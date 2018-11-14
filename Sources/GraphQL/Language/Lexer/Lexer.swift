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
		switch character.unicodeScalarCodePoint {
		case 33:
			return consumePunctuationToken(ofKind: .bang, startingAt: offset)
		default:
			throw GraphQLError(startingAt: offset, describedBy: "Invalid character: \"\(character)\"")
		}
	}

	private static func consumePunctuationToken(ofKind kind: Token.Kind, startingAt offset: Int) -> Cont {
		return Cont { _ in
			let end = offset + 1
			let token = Token(ofKind: kind, startingAt: offset, endingAt: end)
			return (token, try startState(offsetBy: end))
		}
	}
}

extension Lexer {
	private struct Cont {
		let run: (inout Substring) throws -> (Token, Cont)?
	}
}
