import XCTest
@testable import GraphQL

func XCTAssertLexing(_ source: String, spitsOut tokens: [Lexer.Token]) {
	do {
		var lexer = try Lexer(lexing: source)
		var lexedTokens = [Lexer.Token]()
		while let token = try lexer.advance() {
			lexedTokens.append(token)
		}

		XCTAssertEqual(lexedTokens, tokens)
	} catch {
		XCTFail("Expected to lex \(tokens.count) tokens, but got error instead: \(error)")
	}
}

func XCTAssertLexing(_ source: String, throwsErrorStartingAt start: Int, end: Int? = nil) {
	do {
		var lexer = try Lexer(lexing: source)
		if let token = try lexer.advance() {
			XCTFail("Expected to throw an error while lexing the first token, but got token of kind \(token.kind) instead.")
			return
		}
	} catch let error as GraphQLError {
		XCTAssertEqual(error.start, start)
		XCTAssertEqual(error.end, end)
	} catch {
		XCTFail("Expected to throw a GraphQLError, but got \(error) instead.")
	}
}
