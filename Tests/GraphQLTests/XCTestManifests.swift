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

extension LexerNameTestCase {
    static let __allTests = [
        ("testItLexesNames", testItLexesNames),
        ("testItStopLexingNamesWhenAnotherTokenOccurs", testItStopLexingNamesWhenAnotherTokenOccurs),
    ]
}

extension LexerNumberTestCase {
    static let __allTests = [
        ("testItContinuesLexingAfterLexingFloats", testItContinuesLexingAfterLexingFloats),
        ("testItContinuesLexingAfterLexingIntegers", testItContinuesLexingAfterLexingIntegers),
        ("testItLexesFloats", testItLexesFloats),
        ("testItLexesMultiBitIntegers", testItLexesMultiBitIntegers),
        ("testItLexesNegativeFloats", testItLexesNegativeFloats),
        ("testItLexesNegativeIntegers", testItLexesNegativeIntegers),
        ("testItLexesSingleBitIntegers", testItLexesSingleBitIntegers),
    ]
}

extension LexerPunctuationTokenTestCase {
    static let __allTests = [
        ("testItLexesAmpersands", testItLexesAmpersands),
        ("testItLexesAts", testItLexesAts),
        ("testItLexesBangs", testItLexesBangs),
        ("testItLexesClosingBraces", testItLexesClosingBraces),
        ("testItLexesClosingBrackets", testItLexesClosingBrackets),
        ("testItLexesClosingParenthesis", testItLexesClosingParenthesis),
        ("testItLexesColons", testItLexesColons),
        ("testItLexesDollars", testItLexesDollars),
        ("testItLexesEquals", testItLexesEquals),
        ("testItLexesOpeningBraces", testItLexesOpeningBraces),
        ("testItLexesOpeningBrackets", testItLexesOpeningBrackets),
        ("testItLexesOpeningParenthesis", testItLexesOpeningParenthesis),
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

extension LexerTestCase {
    static let __allTests = [
        ("testItLexesAComplexQuery", testItLexesAComplexQuery),
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
        testCase(LexerNameTestCase.__allTests),
        testCase(LexerNumberTestCase.__allTests),
        testCase(LexerPunctuationTokenTestCase.__allTests),
        testCase(LexerStringTestCase.__allTests),
        testCase(LexerTestCase.__allTests),
        testCase(LexerWhitespaceTestCase.__allTests),
    ]
}
#endif
