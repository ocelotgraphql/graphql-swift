import XCTest
@testable import GraphQL

final class LexerNumberTestCase: XCTestCase {
	func testItLexesSingleBitIntegers() {
		let randomInt = Int.random(in: 0...9)
		let intString = String(randomInt)

		XCTAssertLexing(intString, spitsOut: [
			Lexer.Token(ofKind: .int, startingAt: 0, endingAt: 1, holding: intString)
		])
	}

	func testItLexesMultiBitIntegers() {
		let randomInt = Int.random(in: 10...100)
		let intString = String(randomInt)

		XCTAssertLexing(intString, spitsOut: [
			Lexer.Token(ofKind: .int, startingAt: 0, endingAt: intString.count, holding: intString)
		])
	}

	func testItLexesNegativeIntegers() {
		let randomInt = Int.random(in: -100 ... -1)
		let intString = String(randomInt)

		XCTAssertLexing(intString, spitsOut: [
			Lexer.Token(ofKind: .int, startingAt: 0, endingAt: intString.count, holding: intString)
		])
	}

	func testItContinuesLexingAfterLexingIntegers() {
		let randomInt = Int.random(in: 0...9)
		let intString = String(randomInt)

		XCTAssertLexing("\(intString))", spitsOut: [
			Lexer.Token(ofKind: .int, startingAt: 0, endingAt: 1, holding: intString),
			Lexer.Token(ofKind: .closingParanthesis, startingAt: 1, endingAt: 2)
		])
	}

	func testItLexesFloats() {
		let floatString = "4.123"

		XCTAssertLexing(floatString, spitsOut: [
			Lexer.Token(ofKind: .float, startingAt: 0, endingAt: floatString.count, holding: floatString)
		])
	}

	func testItLexesNegativeFloats() {
		let floatString = "-4.123"

		XCTAssertLexing(floatString, spitsOut: [
			Lexer.Token(ofKind: .float, startingAt: 0, endingAt: floatString.count, holding: floatString)
		])
	}

	func testItContinuesLexingAfterLexingFloats() {
		let floatString = "4.123"

		XCTAssertLexing("\(floatString))", spitsOut: [
			Lexer.Token(ofKind: .float, startingAt: 0, endingAt: floatString.count, holding: floatString),
			Lexer.Token(ofKind: .closingParanthesis, startingAt: floatString.count, endingAt: floatString.count + 1)
		])
	}
}
