# Contributing to GraphQL Swift

First of all, thanks for considering to contribute to **GraphQL Swift**! 🎉🚀🎡

The goal of this implementation to not follow [Facebook's reference implementation](https://github.com/graphql/graphql-js) blindly, 
but to write it as "Swifty" as possible.

You can help us reach that goal with your contribution. This can be done in several ways:

- [Report any issues or bugs you discovered](https://github.com/ocelotgraphql/graphql-swift/issues/new)
- [Open issues for feature requests](https://github.com/ocelotgraphql/graphql-swift/issues/new)
- [Implement one of our starter tasks](https://github.com/ocelotgraphql/graphql-swift/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22)

## Issue prefixes

Please consider using the following prefixes when creating new issues:

- [Discussion], if you want to discuss a possible new feature.
- [Wiki], if you discovered a typo or that something's missing in the [Wiki](https://github.com/ocelotgraphql/graphql-swift/wiki).

> If no prefix was specified we assume that your issue reports a bug.

## Code of Conduct

All contributors are expected to follow our [Code of Conduct](CODE_OF_CONDUCT.md). Please read it carefully before making any contribution 📖.

## Setting up the project for Development

### Install Swift

If you haven't installed Swift already, now is the time. This project uses **Swift 4.2**.

### Generate Xcode Project 🏗

Because **GraphQL Swift** is a [Swift PM](https://github.com/apple/swift-package-manager) library, we decided to put the `.xcodeproj` on the `.gitignore`, because maybe not every contributor prefers to use Xcode for writing their Swift code. However, if you do want to work in Xcode, you have to generate a project by running this one-liner in the root directory:

``` sh
swift package generate-xcodeproj --enable-code-coverage
```

> This also enables code coverage reporting for the unit tests.

### Linting 💅

**GraphQL Swift** uses [SwiftLint](https://github.com/realm/SwiftLint) to ensure a consistent code style 🎨. Please install it on your machine and run it before making commits.
Our continuous integration will also run linting and tell you if something's wrong after you submitted a pull request.

``` bash
brew install swiftlint
```

## Testing

### Running tests

We use `XCTest` to write unit tests for the project which you can run in Xcode by pressing `cmd + u` or by simply executing `swift test` inside the root directory.

### Writing tests

You should add tests when adding functionality to existing features or when adding new ones.

## Questions

If you have any questions feel free to [open an issue](https://github.com/slashmo/ocelot/issues/new) where we can discuss further steps.

Thanks again and talk to you soon! 👋
