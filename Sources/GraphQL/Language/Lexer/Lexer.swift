/// [To be implemented]
public struct Lexer {
	private var remainder: Substring
	private var cont: Cont

	public init(lexing source: String) throws {
		remainder = source[...]
		cont = try Lexer.startState()
	}

	public mutating func advance() throws -> Token? {
		guard let (token, cont) = try cont.run(&remainder) else { return nil }
		self.cont = cont
		return token
	}

	private static func startState(offsetBy offset: Int = 0) throws -> Cont {
		return Cont { substring in
			guard let nextCharacter = substring.popFirst() else { return nil }
			return try consume(nextCharacter, startingAt: offset).run(&substring)
		}
	}

	private static func consume(_ character: Character, startingAt offset: Int) throws -> Cont {
		let unicodeScalarCodePoint = character.unicodeScalarCodePoint
		if let punctuationTokenKind = punctuationTokens[unicodeScalarCodePoint] {
			return consumePunctuationToken(ofKind: punctuationTokenKind, startingAt: offset)
		} else {
			switch unicodeScalarCodePoint {
			case 9, 10, 13, 32:
				return consumeWhitespace(startingAt: offset)
			default:
				throw GraphQLError(startingAt: offset, describedBy: "Invalid character: \"\(character)\"")
			}
		}
	}

	private static func consumeWhitespace(startingAt offset: Int) -> Cont {
		return Cont { substring in
			var numberOfWhitespaces = 1
			while let nextCharacter = substring.popFirst() {
				if [9, 10, 13, 32].contains(nextCharacter.unicodeScalarCodePoint) {
					numberOfWhitespaces += 1
					continue
				} else {
					return try consume(nextCharacter, startingAt: offset + numberOfWhitespaces).run(&substring)
				}
			}
			return nil
		}
	}

	private static func consumePunctuationToken(ofKind kind: Token.Kind, startingAt offset: Int) -> Cont {
		guard kind == .spread else {
			let end = offset + 1
			let token = Token(ofKind: kind, startingAt: offset, endingAt: end)
			return Cont { _ in (token, try startState(offsetBy: end)) }
		}

		return consumeSpread(startingAt: offset)
	}

	private static func consumeSpread(startingAt offset: Int) -> Cont {
		return Cont { substring in
			var numberOfDots = 1
			while let nextCharacter = substring.popFirst(), nextCharacter.unicodeScalarCodePoint == 46 {
				numberOfDots += 1
			}

			guard numberOfDots == 3 else {
				throw GraphQLError(startingAt: offset, describedBy: "Invalid character, did you mean to use ... instead?")
			}

			let end = offset + 3
			let token = Token(ofKind: .spread, startingAt: offset, endingAt: end)
			return (token, try startState(offsetBy: end))
		}
	}
}

extension Lexer {
	private struct Cont {
		let run: (inout Substring) throws -> (Token, Cont)?
	}
}

private let punctuationTokens: [UInt32: Lexer.Token.Kind] = [
	33: .bang,
	36: .dollar,
	38: .ampersand,
	40: .openingParenthesis,
	41: .closingParanthesis,
	46: .spread,
	58: .colon,
	61: .equals,
	64: .at,
	91: .openingBracket,
	93: .closingBracket,
	123: .openingBrace,
	124: .pipe,
	125: .closingBrace
]
