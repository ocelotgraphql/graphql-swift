import XCTest
@testable import GraphQL

final class LexerWhitespaceTestCase: XCTestCase {
	private func bang(statingAt startPosition: Int = 1) -> Lexer.Token {
		return Lexer.Token(ofKind: .bang, startingAt: startPosition, endingAt: startPosition + 1)
	}

	func testItIgnoresTabs() {
		XCTAssertLexing("\t", spitsOut: [])
	}

	func testItStopsIgnoringTabsOnceANonWhitespaceCharacterWasFound() {
		XCTAssertLexing("\t!", spitsOut: [bang()])
	}

	func testItIgnoresNewLines() {
		XCTAssertLexing("\n", spitsOut: [])
	}

	func testItStopsIgnoringNewLinesOnceANonWhitespaceCharacterWasFound() {
		XCTAssertLexing("\n!", spitsOut: [bang()])
	}

	func testItIgnoresCarriageReturns() {
		XCTAssertLexing("\r", spitsOut: [])
	}

	func testItStopsIgnoringCarriageReturnsOnceANonWhitespaceCharacterWasFound() {
		XCTAssertLexing("\r!", spitsOut: [bang()])
	}

	func testItIgnoresSpaces() {
		XCTAssertLexing(" ", spitsOut: [])
	}

	func testItStopsIgnoringSpacesOnceANonWhitespaceCharacterWasFound() {
		XCTAssertLexing(" !", spitsOut: [bang()])
	}

	func testItIgnoresSuccessiveWhitespaces() {
		XCTAssertLexing("\r\n\t !", spitsOut: [bang(statingAt: 3)])
	}
}
