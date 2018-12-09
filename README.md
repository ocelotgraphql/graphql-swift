<img src=".github/logo_text_dark.png" alt="Ocelot logo" height="70">

This is a **work in progress** implementation of the [GraphQL spec](https://github.com/facebook/graphql) written in Swift. Head over to our [Development project](https://github.com/ocelotgraphql/graphql-swift/projects/1) to see the current progress.

## Contributing

Ocelot is currently in it's **very early stages**. As soon as we have a clearly defined roadmap we'll label issues contribution friendly.
You can follow the ongoing development through this repository's [GitHub project board](https://github.com/ocelotgraphql/ios/projects/1).

## Installation

> Unless the only thing you need is a GraphQL Lexer installing this library is not yet recommended.

### Swift Package Manager

As we don't have any releases yet you have to specify the `master` branch instead of a version.
Add the following line to your `Package.swift` file's dependencies array:

``` swift
.package(url: "https://github.com/ocelotgraphql/graphql-swift", .branch("master"))
```
