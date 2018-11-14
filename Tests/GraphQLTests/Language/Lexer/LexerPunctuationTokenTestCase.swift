import XCTest
@testable import GraphQL

final class LexerPunctuationTokenTestCase: XCTestCase {
	func testItLexesBangs() {
		XCTAssertLexing("!", spitsOutPunctuationTokenOfKind: .bang)
	}
}

private func XCTAssertLexing(_ source: String, spitsOutPunctuationTokenOfKind kind: Lexer.Token.Kind) {
	do {
		var lexer = try Lexer(lexing: source)
		guard let token = try lexer.advance() else {
			XCTFail("Expected to lex punctuation token of kind \(kind), but advancing returned nil.")
			return
		}

		XCTAssertEqual(token.kind, kind)
		XCTAssertEqual(token.start, 0)
		XCTAssertEqual(token.end, 1)
	} catch {
		XCTFail("Expected to lex punctuation token of kind \(kind), but got an error instead: \(error.localizedDescription)")
	}
}
