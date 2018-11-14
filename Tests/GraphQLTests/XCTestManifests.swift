import XCTest

extension GraphQLErrorTestCase {
    static let __allTests = [
        ("testItReturnsItsMessageAsDescription", testItReturnsItsMessageAsDescription),
    ]
}

extension LexerPunctuationTokenTestCase {
    static let __allTests = [
        ("testItLexesBangs", testItLexesBangs),
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
