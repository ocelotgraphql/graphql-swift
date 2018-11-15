/// All errors thrown from this library will be instances of
/// this concrete `Error` type. It holds information about the
/// failures start and end position inside the source and
/// provides a message describing the failure in plain English.
public struct GraphQLError: Error {
	/// A description of the error. It's written in plain English
	/// so that you can potetially use it to communicate the failure
	/// to your users.
	///
	/// - Note: This is also the value being returned by `description`.
	public let message: String

	/// The start location of the error inside the source.
	public let start: Int

	/// The end location of the error inside the source.
	/// It's only set in some cases where the errors range
	/// can be determined.
	public let end: Int?

	init(startingAt start: Int, endingAt end: Int? = nil, describedBy message: String) {
		self.start = start
		self.end = end
		self.message = message
	}
}

extension GraphQLError: CustomStringConvertible {
	public var description: String {
		return message
	}
}
