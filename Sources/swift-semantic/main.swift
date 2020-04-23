import Foundation
import SwiftSyntax
import ArgumentParser

extension Dictionary {

    func toJSON() -> String? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted), let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) {
            return jsonString
        }
        return nil
    }
    
}

struct SwiftSemantic:ParsableCommand {

    @Argument(help: "The path to the Swift source file.")
    var path: String

    @Argument(help: "The start line.")
    var startLine: Int

    @Argument(help: "The start column.")
    var startColumn: Int

    @Argument(help: "The end line.")
    var endLine: Int

    @Argument(help: "The end column.")
    var endColumn: Int

    var url:URL {
        return URL(fileURLWithPath: path)
    }

    mutating func validate() throws {
        guard FileManager.default.fileExists(atPath: url.path) else {
            throw ValidationError("File not found")
        }
    }

    func run() throws {
        guard let ast = try? SyntaxParser.parse(url) else {
            throw ValidationError("Parser error")
        }

        let converter = SourceLocationConverter(file: url.path, tree: ast)

        let absoluteStartPosition = converter.position(ofLine: startLine, column: startColumn)
        let absoluteEndPosition = converter.position(ofLine: endLine, column: endColumn)

        let finder = NodeFinder(start: absoluteStartPosition, end: absoluteEndPosition)
        finder.walk(ast)

        guard let foundNode = finder.node else {
            print(["error": "Node not found"].toJSON()!)
            return
        }

        let semanticMapper = SemanticMapper()
        semanticMapper.walk(foundNode)

        print([
            "nodeType": "\(type(of: foundNode.asProtocol(SyntaxProtocol.self)))",
            "selectedNode": "\(foundNode)",
            "concepts": semanticMapper.concepts
        ].toJSON()!)
    }

}

SwiftSemantic.main()
