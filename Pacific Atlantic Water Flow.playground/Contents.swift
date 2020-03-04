/*
 417. Pacific Atlantic Water Flow
 Medium

 Given an m x n matrix of non-negative integers representing the height of each unit cell in a continent, the "Pacific ocean" touches the left and top edges of the matrix and the "Atlantic ocean" touches the right and bottom edges.

 Water can only flow in four directions (up, down, left, or right) from a cell to another one with height equal or lower.

 Find the list of grid coordinates where water can flow to both the Pacific and Atlantic ocean.

 Note:

 The order of returned grid coordinates does not matter.
 Both m and n are less than 150.
  

 Example:

 Given the following 5x5 matrix:

   Pacific ~   ~   ~   ~   ~
        ~  1   2   2   3  (5) *
        ~  3   2   3  (4) (4) *
        ~  2   4  (5)  3   1  *
        ~ (6) (7)  1   4   5  *
        ~ (5)  1   1   2   4  *
           *   *   *   *   * Atlantic

 Return:

 [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]] (positions with parentheses in above matrix).
 */

import Foundation

class Solution {
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
    
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        if matrix.isEmpty || matrix[0].isEmpty {
            return []
        }
        
        let row = matrix.count
        let column = matrix[0].count
        var result: [[Int]] = []
        
        let pacificResult = pacific(matrix)
        let atlanticResult = atlantic(matrix)
        
        for i in 0..<row {
            for j in 0..<column {
                if pacificResult[i][j] && atlanticResult[i][j] {
                    result.append([i, j])
                }
            }
        }
        
        return result
    }
    
    func bfs(_ matrix: [[Int]], visited: inout [[Bool]], queue: inout Queue<[Int]>) {
        let row = matrix.count
        let column = matrix[0].count
        
        while queue.isEmpty() == false {
            let current = queue.dequeue()!
            let i = current[0]
            let j = current[1]
            
            let directions = [(0,1),(0,-1),(1,0),(-1,0)]
            for direction in directions {
                let x = i + direction.0
                let y = j + direction.1
                
                if x < 0 || x >= row || y < 0 || y >= column || visited[x][y] || matrix[x][y] < matrix[i][j] {
                    continue
                }
                visited[x][y] = true
                queue.enqueue([x, y])
            }
        }
    }
    
    func dfs(_ matrix: [[Int]], visited: inout [[Bool]], height: Int, x: Int, y: Int) {
        let row = matrix.count
        let column = matrix[0].count
        
        if x < 0 || x >= row || y < 0 || y >= column || visited[x][y] || matrix[x][y] < height {
            return
        }
        visited[x][y] = true
        
        dfs(matrix, visited: &visited, height: matrix[x][y], x: x + 1, y: y)
        dfs(matrix, visited: &visited, height: matrix[x][y], x: x - 1, y: y)
        dfs(matrix, visited: &visited, height: matrix[x][y], x: x, y: y + 1)
        dfs(matrix, visited: &visited, height: matrix[x][y], x: x, y: y - 1)
    }
    
    func pacific(_ matrix: [[Int]]) -> [[Bool]] {
//        let row = matrix.count
//        let column = matrix[0].count
//
//        var result: [[Bool]] = Array(repeating: Array(repeating: false, count: column), count: row)
//        var queue: Queue<[Int]> = Queue()
//
//        // assign ocean tiles
//        for j in 0..<column {
//            result[0][j] = true
//            queue.enqueue([0, j])
//        }
//
//        for i in 0..<row {
//            result[i][0] = true
//            queue.enqueue([i, 0])
//        }
//
//        bfs(matrix, visited: &result, queue: &queue)
//        return result
        
        let row = matrix.count
        let column = matrix[0].count
        
        var result: [[Bool]] = Array(repeating: Array(repeating: false, count: column), count: row)
        
        // assign ocean tiles
        for j in 0..<column {
            dfs(matrix, visited: &result, height: Int.min, x: 0, y: j)
        }
        
        for i in 0..<row {
            dfs(matrix, visited: &result, height: Int.min, x: i, y: 0)
        }
        
        return result
    }
    
    func atlantic(_ matrix: [[Int]]) -> [[Bool]] {
//        let row = matrix.count
//        let column = matrix[0].count
//
//        var result: [[Bool]] = Array(repeating: Array(repeating: false, count: column), count: row)
//        var queue: Queue<[Int]> = Queue()
//
//        // assign ocean tiles
//        for j in 0..<column {
//            result[row-1][j] = true
//            queue.enqueue([row-1,j])
//        }
//
//        for i in 0..<row {
//            result[i][column-1] = true
//            queue.enqueue([i,column-1])
//        }
//
//        bfs(matrix, visited: &result, queue: &queue)
//        return result
        
        let row = matrix.count
        let column = matrix[0].count

        var result: [[Bool]] = Array(repeating: Array(repeating: false, count: column), count: row)
        
        // assign ocean tiles
        for j in 0..<column {
            dfs(matrix, visited: &result, height: Int.min, x: row-1, y: j)
        }

        for i in 0..<row {
            dfs(matrix, visited: &result, height: Int.min, x: i, y: column - 1)
        }

        return result
    }
}

import Foundation
import XCTest
class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func testExample1() {
        let matrix = [[1,2,2,3,5],
                      [3,2,3,4,4],
                      [2,4,5,3,1],
                      [6,7,1,4,5],
                      [5,1,1,2,4],
                        ]

        XCTAssertEqual(solution.pacificAtlantic(matrix), [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]])
    }
    
    func testExample2() {
        let matrix = [[1,2,3],
                      [8,9,4],
                      [7,6,5],
                        ]

        XCTAssertEqual(solution.pacificAtlantic(matrix), [[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]])
    }

}

SolutionTests.defaultTestSuite.run()
