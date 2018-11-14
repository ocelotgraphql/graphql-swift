import XCTest

extension GraphQLErrorTestCase {
    static let __allTests = [
        ("testItReturnsItsMessageAsDescription", testItReturnsItsMessageAsDescription),
    ]
}

extension LexerPunctuationTokenTestCase {
    static let __allTests = [
        ("testItLexesAmpersands", testItLexesAmpersands),
        ("testItLexesAts", testItLexesAts),
        ("testItLexesBangs", testItLexesBangs),
        ("testItLexesClosingBraces", testItLexesClosingBraces),
        ("testItLexesClosingBrackets", testItLexesClosingBrackets),
        ("testItLexesClosingParanthesis", testItLexesClosingParanthesis),
        ("testItLexesColons", testItLexesColons),
        ("testItLexesDollars", testItLexesDollars),
        ("testItLexesEquals", testItLexesEquals),
        ("testItLexesOpeningBraces", testItLexesOpeningBraces),
        ("testItLexesOpeningBrackets", testItLexesOpeningBrackets),
        ("testItLexesOpeningParanthesis", testItLexesOpeningParanthesis),
        ("testItLexesPipes", testItLexesPipes),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(GraphQLErrorTestCase.__allTests),
        testCase(LexerPunctuationTokenTestCase.__allTests),
    ]
}
#endif
