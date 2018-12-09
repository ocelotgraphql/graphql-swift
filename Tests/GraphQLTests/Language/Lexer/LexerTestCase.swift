import XCTest
@testable import GraphQL

final class LexerTestCase: XCTestCase {
	private let validGraphQLQuery = """
	{
		viewer {
			...SmallUser
			followers(first: 100) {
				edges {
					node {
						...SmallUser
					}
				}
			}
		}
	}

	fragment SmallUser on User {
		id
		name
	}
	"""

	func testItLexesAComplexQuery() {
		XCTAssertLexing(validGraphQLQuery, spitsOut: [
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.openingBrace, startingAt: 0, endingAt: 1),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 3, endingAt: 9, holding: "viewer"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.openingBrace, startingAt: 10, endingAt: 11),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.spread, startingAt: 14, endingAt: 17),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 17, endingAt: 26, holding: "SmallUser"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 29, endingAt: 38, holding: "followers"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.openingParenthesis, startingAt: 38, endingAt: 39),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 39, endingAt: 44, holding: "first"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.colon, startingAt: 44, endingAt: 45),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.int, startingAt: 46, endingAt: 49, holding: "100"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.closingParenthesis, startingAt: 49, endingAt: 50),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.openingBrace, startingAt: 51, endingAt: 52),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 56, endingAt: 61, holding: "edges"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.openingBrace, startingAt: 62, endingAt: 63),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 68, endingAt: 72, holding: "node"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.openingBrace, startingAt: 73, endingAt: 74),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.spread, startingAt: 80, endingAt: 83),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 83, endingAt: 92, holding: "SmallUser"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.closingBrace, startingAt: 97, endingAt: 98),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.closingBrace, startingAt: 102, endingAt: 103),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.closingBrace, startingAt: 106, endingAt: 107),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.closingBrace, startingAt: 109, endingAt: 110),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.closingBrace, startingAt: 111, endingAt: 112),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 114, endingAt: 122, holding: "fragment"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 123, endingAt: 132, holding: "SmallUser"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 133, endingAt: 135, holding: "on"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 136, endingAt: 140, holding: "User"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.openingBrace, startingAt: 141, endingAt: 142),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 144, endingAt: 146, holding: "id"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.name, startingAt: 148, endingAt: 152, holding: "name"),
			Lexer.Token(ofKind: GraphQL.Lexer.Token.Kind.closingBrace, startingAt: 153, endingAt: 154)
		])
	}
}
