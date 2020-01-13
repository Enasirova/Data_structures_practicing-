import Foundation

public struct BinarySearchTree<Element: Comparable> { //binary search trees can only hold values that are comparable

    public private(set) var root: BinaryNode<Element>?

    public init() {}

}


extension BinarySearchTree: CustomStringConvertible {

    public var description: String {
        guard let root = root else { return "empty tree"}
        return String(describing: root)
    }
}

extension BinarySearchTree {



    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> { //private helper method

        guard let node = node else { //recursive method: if the current node is nill, you have found the insertion point and you return the new BinaryNode
            return BinaryNode(value: value)
        }

        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value) //from binary node we are inserting to you binary search tree based on the two rules of binary search trees
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }

        return node //makes assignment of the form root = insert(from: root, value: value) possible, as insert will either create node (if it was nil) or return node (if it was not nil)
    }

    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }

}

extension BinarySearchTree {

    public func contains(_ value: Element) -> Bool {
      // we start by setting current to the root node
      var current = root
      // while current is not nil, check the value of current's node
      while let node = current {
      // if the value is equal to what we are searching for -> true
        if node.value == value {
          return true
        }
     //if the value is not equal to what we are searchin for -> we decide whether we have to check left or right child -> O(log n)
        if value < node.value {
          current = node.leftChild
        } else {
          current = node.rightChild
        }
      }
      return false
    }
}

private extension BinaryNode { // recursive min property is to find the minimum node in a subtree

    var min: BinaryNode {
        return leftChild?.min ?? self
    }
}

extension BinarySearchTree {

    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }

    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {

            return nil
        }
        if value == node.value {
            // if the node is a leaf node, we return nil -> by this we remove the current node
            if node.leftChild == nil && node.rightChild == nil {
              return nil
            }
            // if the node doesnt have left child -> we return right child in order to reconnect the right subtree
            if node.leftChild == nil {
              return node.rightChild
            }

            if node.rightChild == nil {
              return node.leftChild
            }

            //when the node to be removed has both children -> we replace the value of the node with the smallest value from the right subtree

            node.value = node.rightChild!.min.value

            //then we remove swapped value on the right child (node.value in the parameter is our node.value from above)
            node.rightChild = remove(node: node.rightChild, value: node.value)

        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
return node
    }
}
