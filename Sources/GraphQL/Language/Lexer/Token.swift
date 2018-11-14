extension Lexer {
	/// A single token lexed by the `Lexer`.
	/// It knows its position inside the source
	/// and, depending on the kind, the value it
	/// holds.
	public struct Token {
		/// The kind of this token
		public let kind: Kind

		/// The index inside the source at which
		/// this token starts.
		///
		/// The position is zero-indexed, meaning
		/// that if the `Token` starts at the very first
		/// character, its start is 0.
		public let start: Int

		/// The `Token`s "past-the-end" position.
		///
		/// "Past-the-end" means that if the `Token`
		/// starts at 0 and spans two characters,
		/// its `end` is `2`.
		public let end: Int

		/// Some kinds of `Token`s additionally
		/// hold a value stored in this property.
		/// A String token e.g. holds its
		/// characters.
		public var value: String?

		init(ofKind kind: Kind, startingAt start: Int, endingAt end: Int, holding value: String? = nil) {
			self.kind = kind
			self.start = start
			self.end = end
			self.value = value
		}
	}
}

extension Lexer.Token {
	/// The kind of token
	public enum Kind {
		case bang
		case string
		case comment
		case dollar
		case ampersand
		case openingParenthesis
		case closingParanthesis
		case int
		case float
		case spread
		case colon
		case equals
		// swiftlint:disable:next identifier_name
		case at
		case name
		case openingBracket
		case closingBracket
		case openingBrace
		case pipe
		case closingBrace
	}
}
