import XCTest

extension GraphQLErrorTestCase {
    static let __allTests = [
        ("testItReturnsItsMessageAsDescription", testItReturnsItsMessageAsDescription),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(GraphQLErrorTestCase.__allTests),
    ]
}
#endif
