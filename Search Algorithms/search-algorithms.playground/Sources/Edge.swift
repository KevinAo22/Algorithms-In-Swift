import Foundation

public class Edge {
    public var neighbor: Node
    
    public init(_ neighbor: Node) {
        self.neighbor = neighbor
    }
}

extension Edge: Equatable {
    public static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.neighbor == rhs.neighbor
    }
}

