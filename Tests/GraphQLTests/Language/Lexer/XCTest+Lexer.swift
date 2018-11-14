import XCTest
@testable import GraphQL

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
