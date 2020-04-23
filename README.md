# Swift Semantic

This Swift console application permits to retrieve, for a selection in a Swift source file, the main concept from the Swift scheme of the ALMA ontology. It uses [SwiftSyntax](https://github.com/apple/swift-syntax) in its version `0.50200.0` (for Swift 5.2).

## Download & Installation

```bash
git clone https://ds-git.fstc.uni.lu/christian.grevisse/swift-semantic.git
cd swift-ast

# Build a release binary
swift build -c release

# Copy into your Swift toolchain (here: Xcode)
sudo cp -i .build/release/swift-semantic /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```

## Usage

You can now use the utility in the following way:

```
$ swift semantic <path/to/file.swift> <startLine> <startColumn> <endLine> <endColumn>
```

For instance, assume you have a file `Airport.swift` containing:

```swift
struct Airport {

	let name:String
	let iataCode:String

	init(name:String, iataCode:String) {
		self.name = name
		self.iataCode = iataCode.prefix(3).uppercased()
	}

}
```

You can use the utility the following way:

```bash
$ swift semantic Airport.swift 6 2 9 3
{
	"nodeType" : "InitializerDeclSyntax",
	"selectedNode" : "\n\n\tinit(name:String, iataCode:String) {\n\t\tself.name = name\n\t\tself.iataCode = iataCode.prefix(3).uppercased()\n\t}",
	"concepts" : [
		"swift:Initializer"
	]
}
```
