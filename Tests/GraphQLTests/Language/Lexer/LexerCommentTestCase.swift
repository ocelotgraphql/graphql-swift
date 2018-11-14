import XCTest
@testable import GraphQL

final class LexerCommentTestCase: XCTestCase {
	func testItLexesComments() {
		let comment = "comment"
		XCTAssertLexing("#\(comment)", spitsOut: [
			Lexer.Token(ofKind: .comment, startingAt: 0, endingAt: comment.count + 1, holding: comment)
		])
	}

	func testItStopsLexingCommentsOnLineBreaks() {
		let comment = "comment"
		XCTAssertLexing("#\(comment)\n!", spitsOut: [
			Lexer.Token(ofKind: .comment, startingAt: 0, endingAt: comment.count + 1, holding: comment),
			Lexer.Token(ofKind: .bang, startingAt: comment.count + 2, endingAt: comment.count + 3)
		])
	}
}
