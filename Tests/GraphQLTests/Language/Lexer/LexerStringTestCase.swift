import XCTest
@testable import GraphQL

final class LexerStringTestCase: XCTestCase {
	func testItLexesStrings() {
		let value = "hello"
		XCTAssertLexing("\"\(value)\"", spitsOut: [
			Lexer.Token(ofKind: .string, startingAt: 0, endingAt: 7, holding: value)
		])
	}

	func testItLexesStringsWithoutRemovingWhitespace() {
		let value = " hello "
		XCTAssertLexing("\"\(value)\"", spitsOut: [
			Lexer.Token(ofKind: .string, startingAt: 0, endingAt: 9, holding: value)
		])
	}

	func testItThrowsAnErrorIfAStringIsNotTerminated() {
		XCTAssertLexing("\"hello", throwsErrorStartingAt: 0)
	}

	func testItThrowsAnErrorIfAStringContainsInvalidCharacters() {
		XCTAssertLexing("\"test\u{b}\"", throwsErrorStartingAt: 4)
	}
}
