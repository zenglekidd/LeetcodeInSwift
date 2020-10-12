import Foundation

//struct MinHeap {
//  var items: [Int] = []
//
//  //Get Index
//  private func getLeftChildIndex(_ parentIndex: Int) -> Int {
//      return 2 * parentIndex + 1
//  }
//  private func getRightChildIndex(_ parentIndex: Int) -> Int {
//      return 2 * parentIndex + 2
//  }
//  private func getParentIndex(_ childIndex: Int) -> Int {
//      return (childIndex - 1) / 2
//  }
//
//  // Boolean Check
//  private func hasLeftChild(_ index: Int) -> Bool {
//      return getLeftChildIndex(index) < items.count
//  }
//  private func hasRightChild(_ index: Int) -> Bool {
//      return getRightChildIndex(index) < items.count
//  }
//  private func hasParent(_ index: Int) -> Bool {
//      return getParentIndex(index) >= 0
//  }
//
//  // Return Item From Heap
//  private func leftChild(_ index: Int) -> Int {
//      return items[getLeftChildIndex(index)]
//  }
//  private func rightChild(_ index: Int) -> Int {
//      return items[getRightChildIndex(index)]
//  }
//  private func parent(_ index: Int) -> Int {
//      return items[getParentIndex(index)]
//  }
//
//  // Heap Operations
//  mutating private func swap(indexOne: Int, indexTwo: Int) {
//      let placeholder = items[indexOne]
//      items[indexOne] = items[indexTwo]
//      items[indexTwo] = placeholder
//  }
//
//  public func peek() -> Int {
//      if items.count != 0 {
//          return items[0]
//      } else {
//          fatalError()
//      }
//  }
//
//  mutating public func poll() -> Int {
//      if items.count != 0 {
//          let item = items[0]
//          items[0] = items[items.count - 1]
//          heapifyDown()
//          items.removeLast()
//          return item
//      } else {
//          fatalError()
//      }
//  }
//
//  mutating public func add(_ item: Int) {
//      items.append(item)
//      heapifyUp()
//  }
//
//  mutating private func heapifyUp() {
//      var index = items.count - 1
//      while hasParent(index) && parent(index) > items[index] {
//          swap(indexOne: getParentIndex(index), indexTwo: index)
//          index = getParentIndex(index)
//      }
//  }
//
//  mutating private func heapifyDown() {
//      var index = 0
//      while hasLeftChild(index) {
//          var smallerChildIndex = getLeftChildIndex(index)
//          if hasRightChild(index) && rightChild(index) < leftChild(index) {
//              smallerChildIndex = getRightChildIndex(index)
//          }
//
//          if items[index] < items[smallerChildIndex] {
//              break
//          } else {
//              swap(indexOne: index, indexTwo: smallerChildIndex)
//          }
//          index = smallerChildIndex
//      }
//  }
//}

struct MaxHeap<Element: Comparable> {
    var items: [Element] = []
    
    public mutating func add(_ item: Element) {
        items.append(item)
        heapifyUp()
    }
    
    public mutating func poll() -> Element? {
        if isEmpty() {return nil}
        let result = items.first!
        items[0] = items.last!
        heapifyDown()
        items.removeLast()
        
        return result
    }
    
    public func peek() -> Element? {
        if isEmpty() {return nil}
        return items.first!
    }
    
    public func isEmpty() -> Bool {
        return items.count == 0
    }
    
    private mutating func heapifyUp() {
        if isEmpty() {return}
        
        var index = items.count - 1
        while hasParent(index) && items[index] > items[parentIndex(index)] {
            swap(index, parentIndex(index))
            index = parentIndex(index)
        }
    }
    
    private mutating func heapifyDown() {
        if isEmpty() {return}

        var index = 0
        while hasLeftChild(index) {
            if hasRightChild(index) {
                if leftChild(index) > rightChild(index) {
                    swap(index, leftChildIndex(index))
                    index = leftChildIndex(index)
                    continue
                } else {
                    swap(index, rightChildIndex(index))
                    index = rightChildIndex(index)
                    continue
                }
            }
            swap(index, leftChildIndex(index))
            index = leftChildIndex(index)
        }
    }
    
    private func leftChild(_ index: Int) -> Element {
        return items[leftChildIndex(index)]
    }
    
    private func rightChild(_ index: Int) -> Element {
        return items[rightChildIndex(index)]
    }
    
    private func parent(_ index: Int) -> Element {
        return items[parentIndex(index)]
    }
    
    private func leftChildIndex(_ index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndex(_ index: Int) -> Int {
        return 2 * index + 2
    }
    
    private func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func hasLeftChild(_ index: Int) -> Bool {
        return leftChildIndex(index) < items.count
    }
    
    private func hasRightChild(_ index: Int) -> Bool {
        return rightChildIndex(index) < items.count
    }
    
    private func hasParent(_ index: Int) -> Bool {
        return parentIndex(index) >= 0
    }
    
    private mutating func swap(_ indexOfFirst: Int, _ indexOfSecond: Int) {
        let temp = items[indexOfFirst]
        items[indexOfFirst] = items[indexOfSecond]
        items[indexOfSecond] = temp
    }
}

var array = Array(0...10)
var randomArray = array.shuffled()
print(randomArray)

var heap = MaxHeap<Int>()
for i in randomArray {
    heap.add(i)
}

var result: [Int] = []
while heap.items.count != 0 {
    result.append(heap.poll()!)
}

print(result)
