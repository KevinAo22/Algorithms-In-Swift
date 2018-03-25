// Depth-first Search

func depthFirstSearch(_ graph: OrientedGraph, root: Node) -> [String] {
    var visitedNode = [root.label]
    root.isVisited = true
    
    for edge in root.neighbors {
        if !edge.neighbor.isVisited {
            visitedNode += depthFirstSearch(graph, root: edge.neighbor)
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

let visitedNode = depthFirstSearch(graph, root: nodeA)
print(visitedNode)
