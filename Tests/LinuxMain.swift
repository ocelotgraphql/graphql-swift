import XCTest

import GraphQLTests

var tests = [XCTestCaseEntry]()
tests += GraphQLTests.__allTests()

XCTMain(tests)
