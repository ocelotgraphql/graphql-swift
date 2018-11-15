extension Character {
	var unicodeScalarCodePoint: UInt32 {
		let characterString = String(self)
		let scalars = characterString.unicodeScalars

		return scalars[scalars.startIndex].value
	}
}
