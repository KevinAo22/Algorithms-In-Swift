// Breadth-first Search

func breadthFirstSearch(_ graph: OrientedGraph, root: Node) -> [String] {
    var queue = Queue<Node>()
    queue.enqueue(root)
    
    var visitedNode = [String]()
    
    while !queue.isEmpty {
        let current = queue.dequeue()!
        
        visitedNode.append(current.label)
        current.isVisited = true
        
        for edge in current.neighbors {
            if !edge.neighbor.isVisited {
                queue.enqueue(edge.neighbor)
                edge.neighbor.isVisited = true
            }
        }
    }
    
    return visitedNode
}

let graph = OrientedGraph()

let nodeA = graph.addNode("a")
let nodeB = graph.addNode("b")
let nodeC = graph.addNode("c")
let nodeD = graph.addNode("d")
let nodeE = graph.addNode("e")
let nodeF = graph.addNode("f")
let nodeG = graph.addNode("g")
let nodeH = graph.addNode("h")

graph.addEdge(nodeA, neighbor: nodeB)
graph.addEdge(nodeA, neighbor: nodeC)
graph.addEdge(nodeB, neighbor: nodeD)
graph.addEdge(nodeB, neighbor: nodeE)
graph.addEdge(nodeC, neighbor: nodeF)
graph.addEdge(nodeC, neighbor: nodeG)
graph.addEdge(nodeE, neighbor: nodeH)
graph.addEdge(nodeE, neighbor: nodeF)
graph.addEdge(nodeF, neighbor: nodeG)

let visitedNode = breadthFirstSearch(graph, root: nodeA)
print(visitedNode)
