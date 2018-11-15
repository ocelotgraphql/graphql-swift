import XCTest
@testable import GraphQL

final class LexerNameTestCase: XCTestCase {
	func testItLexesNames() {
		let name = "query"

		XCTAssertLexing(name, spitsOut: [
			Lexer.Token(ofKind: .name, startingAt: 0, endingAt: name.count, holding: name)
		])
	}

	func testItStopLexingNamesWhenAnotherTokenOccurs() {
		let name = "String"

		XCTAssertLexing("\(name)!", spitsOut: [
			Lexer.Token(ofKind: .name, startingAt: 0, endingAt: name.count, holding: name),
			Lexer.Token(ofKind: .bang, startingAt: name.count, endingAt: name.count + 1)
		])
	}
}
