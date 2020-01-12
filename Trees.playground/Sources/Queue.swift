import Foundation

// in order to test Level - order traversal -> we will implement queue array (since our children was an array)

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool {get}
    var peek: Element? {get}
}

public struct QueueArray<T>: Queue {
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }

    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst() //if array is empty -> returns nil if not -> removes the element from the front and returns it
    }

    public typealias Element = T
    private var array: [T] = []
    public init() {}
    public var isEmpty: Bool{
        return array.isEmpty
    }
    public var peek: T? {
        return array.first
    }
}

