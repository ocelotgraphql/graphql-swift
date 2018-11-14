// swift-tools-version:4.2

import PackageDescription

let package = Package(
	name: "GraphQL",
	products: [
		.library(
			name: "GraphQL",
			targets: ["GraphQL"]
		)
	],
	dependencies: [],
	targets: [
		.target(
			name: "GraphQL",
			dependencies: []
		),
		.testTarget(
			name: "GraphQLTests",
			dependencies: ["GraphQL"]
		)
	]
)
