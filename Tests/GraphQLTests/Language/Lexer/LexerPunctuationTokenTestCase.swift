import XCTest
@testable import GraphQL

final class LexerPunctuationTokenTestCase: XCTestCase {
	func testItLexesBangs() {
		XCTAssertLexing("!", spitsOutPunctuationTokenOfKind: .bang)
	}

	func testItLexesCommas() {
		XCTAssertLexing(",", spitsOutPunctuationTokenOfKind: .comma)
	}

	func testItLexesDollars() {
		XCTAssertLexing("$", spitsOutPunctuationTokenOfKind: .dollar)
	}

	func testItLexesAmpersands() {
		XCTAssertLexing("&", spitsOutPunctuationTokenOfKind: .ampersand)
	}

	func testItLexesOpeningParenthesis() {
		XCTAssertLexing("(", spitsOutPunctuationTokenOfKind: .openingParenthesis)
	}

	func testItLexesClosingParenthesis() {
		XCTAssertLexing(")", spitsOutPunctuationTokenOfKind: .closingParenthesis)
	}

	func testItLexesSpreads() {
		XCTAssertLexing("...", spitsOutPunctuationTokenOfKind: .spread, end: 3)
	}

	func testItThrowsAnErrorWhenLexingMoreOrLessThanThreeSuccessiveDots() {
		XCTAssertLexing("..", throwsErrorStartingAt: 0)
	}

	func testItLexesColons() {
		XCTAssertLexing(":", spitsOutPunctuationTokenOfKind: .colon)
	}

	func testItLexesEquals() {
		XCTAssertLexing("=", spitsOutPunctuationTokenOfKind: .equals)
	}

	func testItLexesAts() {
		XCTAssertLexing("@", spitsOutPunctuationTokenOfKind: .at)
	}

	func testItLexesOpeningBrackets() {
		XCTAssertLexing("[", spitsOutPunctuationTokenOfKind: .openingBracket)
	}

	func testItLexesClosingBrackets() {
		XCTAssertLexing("]", spitsOutPunctuationTokenOfKind: .closingBracket)
	}

	func testItLexesOpeningBraces() {
		XCTAssertLexing("{", spitsOutPunctuationTokenOfKind: .openingBrace)
	}

	func testItLexesPipes() {
		XCTAssertLexing("|", spitsOutPunctuationTokenOfKind: .pipe)
	}

	func testItLexesClosingBraces() {
		XCTAssertLexing("}", spitsOutPunctuationTokenOfKind: .closingBrace)
	}
}

private func XCTAssertLexing(_ source: String, spitsOutPunctuationTokenOfKind kind: Lexer.Token.Kind, end: Int = 1) {
	do {
		var lexer = try Lexer(lexing: source)
		guard let token = try lexer.advance() else {
			XCTFail("Expected to lex punctuation token of kind \(kind), but advancing returned nil.")
			return
		}

		XCTAssertEqual(token.kind, kind)
		XCTAssertEqual(token.start, 0)
		XCTAssertEqual(token.end, end)
	} catch {
		XCTFail("Expected to lex punctuation token of kind \(kind), but got an error instead: \(error)")
	}
}
