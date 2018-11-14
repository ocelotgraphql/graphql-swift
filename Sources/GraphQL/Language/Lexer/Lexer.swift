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
			case 34:
				return consumeString(startingAt: offset)
			case 35:
				return consumeComment(startingAt: offset)
			case 45, 48...57:
				return consumeNumber(startingWith: character, at: offset)
			case 65...90, 95, 97...122:
				return consumeName(startingWith: character, at: offset)
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

	private static func consumeString(startingAt offset: Int) -> Cont {
		return Cont { substring in
			var value = ""
			var lastCharacter: Character?

			while let nextCharacter = substring.popFirst() {
				let unicodeScalarCodePoint = nextCharacter.unicodeScalarCodePoint

				// Neither LineTerminator nor closing quote
				guard unicodeScalarCodePoint != 0x000A, unicodeScalarCodePoint != 0x000D, unicodeScalarCodePoint != 34 else {
					lastCharacter = nextCharacter
					break
				}

				if unicodeScalarCodePoint < 0x0020 && unicodeScalarCodePoint != 0x009 {
					throw GraphQLError(startingAt: offset + value.count, describedBy: "Invalid character \"\(nextCharacter)\"")
				}

				value += String(nextCharacter)
			}

			let quoteLength = 1

			guard lastCharacter?.unicodeScalarCodePoint == 34 else {
				throw GraphQLError(startingAt: offset, describedBy: "Unterminated String")
			}

			let end = offset + quoteLength + value.count
			return (
				Token(ofKind: .string, startingAt: offset, endingAt: end + quoteLength, holding: value),
				try startState(offsetBy: end + quoteLength)
			)
		}
	}

	private static func consumeComment(startingAt offset: Int) -> Cont {
		return Cont { substring in
			var value = ""

			var end: Int {
				return offset + 1 + value.count
			}

			var token: Token {
				return Token(ofKind: .comment, startingAt: offset, endingAt: end, holding: value)
			}

			while let nextCharacter = substring.popFirst() {
				let unicodeScalarCodePoint = nextCharacter.unicodeScalarCodePoint
				if unicodeScalarCodePoint > 0x001F || unicodeScalarCodePoint == 0x0009 {
					value += String(nextCharacter)
					continue
				} else {
					return (token, try consume(nextCharacter, startingAt: end))
				}
			}

			return (token, try startState(offsetBy: end))
		}
	}

	private static func consumeNumber(startingWith firstCharacter: Character, at offset: Int) -> Cont {
		return Cont { substring in
			var value = String(firstCharacter)
			var isFloat = false

			var end: Int {
				return offset + value.count
			}

			var token: Token {
				return Token(ofKind: isFloat ? .float : .int, startingAt: offset, endingAt: end, holding: value)
			}

			while let nextCharacter = substring.popFirst() {
				let unicodeScalarCodePoint = nextCharacter.unicodeScalarCodePoint
				if (48...57).contains(unicodeScalarCodePoint) {
					value += String(nextCharacter)
				} else if unicodeScalarCodePoint == 46 {
					isFloat = true
					value += String(nextCharacter)
				} else {
					return (token, try consume(nextCharacter, startingAt: end))
				}
			}

			return (token, try startState(offsetBy: end))
		}
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

			let end = offset + numberOfDots
			let token = Token(ofKind: .spread, startingAt: offset, endingAt: end)
			return (token, try startState(offsetBy: end))
		}
	}

	private static func consumeName(startingWith firstCharacter: Character, at offset: Int) -> Cont {
		return Cont { substring in
			var value = String(firstCharacter)

			var end: Int {
				return offset + value.count
			}

			var token: Token {
				return Token(ofKind: .name, startingAt: offset, endingAt: end, holding: value)
			}

			while let nextCharacter = substring.popFirst() {
				switch nextCharacter.unicodeScalarCodePoint {
				case 65...90, 95, 97...122:
					value += String(nextCharacter)
				default:
					return (token, try consume(nextCharacter, startingAt: end))
				}
			}

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
