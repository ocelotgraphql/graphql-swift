import XCTest

extension GraphQLErrorTestCase {
    static let __allTests = [
        ("testItReturnsItsMessageAsDescription", testItReturnsItsMessageAsDescription),
    ]
}

extension LexerCommentTestCase {
    static let __allTests = [
        ("testItLexesComments", testItLexesComments),
        ("testItStopsLexingCommentsOnLineBreaks", testItStopsLexingCommentsOnLineBreaks),
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
        ("testItLexesSpreads", testItLexesSpreads),
        ("testItThrowsAnErrorWhenLexingMoreOrLessThanThreeSuccessiveDots", testItThrowsAnErrorWhenLexingMoreOrLessThanThreeSuccessiveDots),
    ]
}

extension LexerStringTestCase {
    static let __allTests = [
        ("testItLexesStrings", testItLexesStrings),
        ("testItLexesStringsWithoutRemovingWhitespace", testItLexesStringsWithoutRemovingWhitespace),
        ("testItThrowsAnErrorIfAStringContainsInvalidCharacters", testItThrowsAnErrorIfAStringContainsInvalidCharacters),
        ("testItThrowsAnErrorIfAStringIsNotTerminated", testItThrowsAnErrorIfAStringIsNotTerminated),
    ]
}

extension LexerWhitespaceTestCase {
    static let __allTests = [
        ("testItIgnoresCarriageReturns", testItIgnoresCarriageReturns),
        ("testItIgnoresNewLines", testItIgnoresNewLines),
        ("testItIgnoresSpaces", testItIgnoresSpaces),
        ("testItIgnoresSuccessiveWhitespaces", testItIgnoresSuccessiveWhitespaces),
        ("testItIgnoresTabs", testItIgnoresTabs),
        ("testItStopsIgnoringCarriageReturnsOnceANonWhitespaceCharacterWasFound", testItStopsIgnoringCarriageReturnsOnceANonWhitespaceCharacterWasFound),
        ("testItStopsIgnoringNewLinesOnceANonWhitespaceCharacterWasFound", testItStopsIgnoringNewLinesOnceANonWhitespaceCharacterWasFound),
        ("testItStopsIgnoringSpacesOnceANonWhitespaceCharacterWasFound", testItStopsIgnoringSpacesOnceANonWhitespaceCharacterWasFound),
        ("testItStopsIgnoringTabsOnceANonWhitespaceCharacterWasFound", testItStopsIgnoringTabsOnceANonWhitespaceCharacterWasFound),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(GraphQLErrorTestCase.__allTests),
        testCase(LexerCommentTestCase.__allTests),
        testCase(LexerPunctuationTokenTestCase.__allTests),
        testCase(LexerStringTestCase.__allTests),
        testCase(LexerWhitespaceTestCase.__allTests),
    ]
}
#endif
