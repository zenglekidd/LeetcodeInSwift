import Foundation

// 3 Approaches
//: ![example graph](133_clone_graph_question.png)

var graph1: [[Int]] =
    [[2,4],
     [1,3],
     [2,4],
     [1,3],
    ]

//print(graph1)

class Node<T> {
    var val: T
    var next: Node<T>?
    
    init(_ value: T) {
        self.val = value
    }
}

class LinkedList<T> {
    var head: Node<T>?
}

var graph2: [LinkedList<Int>]

var graph3: [Int: [Int]]

struct Vertex<T: Hashable> {
    var val: T
}

extension Vertex: Hashable {
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.val == rhs.val
    }
}

extension Vertex: CustomStringConvertible {
  public var description: String {
    return "\(val)"
  }
}

enum EdgeType {
    case directed, undirected
}

struct Edge<T: Hashable> {
    var source: Vertex<T>
    var destination: Vertex<T>
    var weight: Double?
}

class AdjacencyList<T: Hashable> {
    var dict: [Vertex<T> : [Edge<T>]] = [:]
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex.init(val: data)
        
        if dict[vertex] == nil {
            dict[vertex] = []
        }
        
        return vertex
    }
    
    func add(_ : EdgeType, from: Vertex<T>, to: Vertex<T>, weight: Double) {
        let edge1 = Edge(source: from, destination: to, weight: weight)
        dict[from]?.append(edge1)
        
        let edge2 = Edge(source: to, destination: from, weight: weight)
        dict[to]?.append(edge2)
        
        return
    }
    
    func weight(from: Vertex<T>, to: Vertex<T>) -> Double? {
        guard let edges = dict[from] else {
            return nil
        }
        
        for edge in edges {
            if edge.destination == to {
                return edge.weight
            }
        }
        
        return nil
    }
    
    func edges(from: Vertex<T>) -> [Edge<T>]? {
        return dict[from]
    }
    
    public var description: CustomStringConvertible {
      var result = ""
      for (vertex, edges) in dict {
        var edgeString = ""
        for (index, edge) in edges.enumerated() {
          if index != edges.count - 1 {
            edgeString.append("\(edge.destination), ")
          } else {
            edgeString.append("\(edge.destination)")
          }
        }
        result.append("\(vertex) ---> [ \(edgeString) ] \n ")
      }
      return result
    }
}

struct Stack<T> {
    var array: [T] = []
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    func peek() -> T? {
        return array.last
    }
}

//func dfs(from: Vertex<String>, to: Vertex<String>, graph: AdjacencyList<String>) -> Stack<Vertex<String>> {
//    var visited = Set<Vertex<String>>()
//    var stack = Stack<Vertex<String>>()
//
//    visited.insert(from)
//    stack.push(from)
//
//    outer: while let vertex = stack.peek(), vertex != to {
//
//        guard let neighbors = graph.edges(from: vertex), neighbors.count > 0 else {
//            print("backtracking")
//            stack.pop()
//            continue
//        }
//
//        for neighbor in neighbors {
//            if visited.contains(neighbor.destination) == false {
//                visited.insert(neighbor.destination)
//                stack.push(neighbor.destination)
////                print(stack)
//                continue outer
//            }
//        }
////        print("backtrack from \(vertex)")
//        stack.pop()
//    }
//
//    return stack
//}

func dfs(from: Vertex<String>, to: Vertex<String>, graph: AdjacencyList<String>) -> Stack<Vertex<String>> {
    var visited = Set<Vertex<String>>()
    var stack = Stack<Vertex<String>>()
    
    visited.insert(from)
    stack.push(from)
    
    outer: while let vertex = stack.peek(), vertex != to {
        guard let neighbors = graph.edges(from: vertex), neighbors.count > 0 else {
            stack.pop()
            continue
        }
        
        for edge in neighbors {
            if visited.contains(edge.destination) == false {
                visited.insert(edge.destination)
                stack.push(edge.destination)
                continue outer
            }
        }
        
        stack.pop()
    }
    
    return stack
}

struct Queue<T> {
    var list = Array<T>()
    
    mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard list.isEmpty == false else { return nil }
        return list.removeFirst()
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
}

func breadthFirstSearch(_ graph: AdjacencyList<String>, source: Vertex<String>) -> [String] {
    var queue = Queue<Vertex<String>>()
    queue.enqueue(source)
    
    var nodesExplored = [source.description]
    while queue.isEmpty() != true {
        let neighbors = graph.edges(from: queue.dequeue()!) ?? []
        for neighbor in neighbors {
            queue.enqueue(neighbor.destination)
        }
        
    }

    return nodesExplored
}

let adjacencyList = AdjacencyList<String>()
let s = adjacencyList.createVertex(data: "S")
let a = adjacencyList.createVertex(data: "A")
let c = adjacencyList.createVertex(data: "C")
let d = adjacencyList.createVertex(data: "D")
let b = adjacencyList.createVertex(data: "B")
let f = adjacencyList.createVertex(data: "F")
let g = adjacencyList.createVertex(data: "G")
let e = adjacencyList.createVertex(data: "E")

adjacencyList.add(.undirected, from: s, to: a, weight: 1)
adjacencyList.add(.undirected, from: a, to: c, weight: 1)
adjacencyList.add(.undirected, from: a, to: d, weight: 1)
adjacencyList.add(.undirected, from: a, to: b, weight: 1)
adjacencyList.add(.undirected, from: d, to: b, weight: 1)
adjacencyList.add(.undirected, from: d, to: f, weight: 1)
adjacencyList.add(.undirected, from: d, to: g, weight: 1)
adjacencyList.add(.undirected, from: f, to: e, weight: 1)

print(dfs(from: s, to: c, graph: adjacencyList))

//let adjacencyList = AdjacencyList<String>()
//
//let singapore = adjacencyList.createVertex(data: "Singapore")
//let tokyo = adjacencyList.createVertex(data: "Tokyo")
//let hongKong = adjacencyList.createVertex(data: "Hong Kong")
//let detroit = adjacencyList.createVertex(data: "Detroit")
//let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
//let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
//let austinTexas = adjacencyList.createVertex(data: "Austin Texas")
//let seattle = adjacencyList.createVertex(data: "Seattle")
//
//adjacencyList.add(.undirected, from: singapore, to: hongKong, weight: 300)
//adjacencyList.add(.undirected, from: singapore, to: tokyo, weight: 500)
//adjacencyList.add(.undirected, from: hongKong, to: tokyo, weight: 250)
//adjacencyList.add(.undirected, from: tokyo, to: detroit, weight: 450)
//adjacencyList.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
//adjacencyList.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
//adjacencyList.add(.undirected, from: detroit, to: austinTexas, weight: 50)
//adjacencyList.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
//adjacencyList.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
//adjacencyList.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
//adjacencyList.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
//adjacencyList.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)
//
//print(adjacencyList.description)
//
//print(adjacencyList.weight(from: washingtonDC, to: sanFrancisco)!)
//
//if let flightsFromSanFrancisco = adjacencyList.edges(from: sanFrancisco) {
//  print("San Francisco Out Going Flights:")
//  print("--------------------------------")
//  for edge in flightsFromSanFrancisco {
//    print("from: \(edge.source) to: \(edge.destination)")
//  }
//}
