import Foundation

public class Node: CustomStringConvertible {
    public var neighbors: [Edge]
    
    public private(set) var label: String
    public var isVisited: Bool
    public var distance: Int?
    
    public init(_ label: String) {
        self.label = label
        neighbors = []
        isVisited = false
    }
    
    public var description: String {
        if let distance = distance {
            return "Node(label: \(label), distance: \(distance))"
        }
        return "Node(label: \(label), distance: infinity)"
    }
    
    public var hasDistance: Bool {
        return distance != nil
    }
    
    public func remove(_ edge: Edge) {
        neighbors = neighbors.filter { $0 != edge }
    }
}

extension Node: Equatable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.label == rhs.label && lhs.neighbors == rhs.neighbors
    }
}



