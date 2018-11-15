import XCTest
@testable import GraphQL

final class GraphQLErrorTestCase: XCTestCase {
	func testItReturnsItsMessageAsDescription() {
		let message = "Unterminated String"
		let error = GraphQLError(startingAt: 0, describedBy: message)

		XCTAssertEqual(error.description, message)
	}
}
