import Foundation

public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []

    public init(_ value: T) {
        self.value = value
    }

    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        return String(describing: children)
    }
}

extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach{ //for each of the arrays (meaninig for each group. for ex. hot and cold is a group THEN soda and milk is a group
            $0.forEachDepthFirst(visit: visit) //function inside itslef: most left of the groups's array and goes as much down
        }
    }
}

extension TreeNode {
    public func forEachLevelOrder (visit: (TreeNode) -> Void) {
        visit(self)
        var queueOfTree = QueueArray<TreeNode>()
        children.forEach { queueOfTree.enqueue($0) } // beverages hot cold tea coffee cocoa soda milk.. dequeing is in the same order -> since fifo
        while let node = queueOfTree.dequeue() { //when there is a node -> we are dequiing the items i h the order we were enqueing them -> and then we visit children of nodes  in the order we were dequing them
            visit(node)
            node.children.forEach { queueOfTree.enqueue($0)}//for each item of FIFO -> we look for its children -> 1) we visit beverages' children -> meaning hot and cold 2) then we visit children of hot -> so we visit tea coffee cocoa 3)
        }

    }
}

extension TreeNode where T: Equatable {
  public func search(_ value: T) -> TreeNode? {
    var result: TreeNode?
    forEachLevelOrder { node in //forEachLevelOrder is a funciton which itirates through all the nodes (its declared as pubclic in the previous extention
      if node.value == value {
        result = node
      }
    }
    return result
  }
}




