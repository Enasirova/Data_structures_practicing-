import Foundation

public class BinaryNode<Element> {

    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?

    //for AVL tree
    public var height = 0
    public var leftHeight: Int {
        return leftChild?.height ?? -1
    }
    public var rightHeight: Int {
        return rightChild?.height ?? -1
    }
    public var balanceFactor: Int {
        return leftHeight - rightHeight
    }


    public init(value: Element) {
        self.value = value
    }


}

extension BinaryNode: CustomStringConvertible {

    public var description: String {
        return diagram(for: self)
    }


    private func diagram(for node: BinaryNode?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {

        guard let node = node else {
            return root + "nil\n" //returns nil on the top -> cause there is no node -> ""nil -> right child 9 doesnt have right child
        }

        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n" //it returns "" the value of the last node
        }

        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")

                + root + "\(node.value)\n"

                + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")

                  }
                }

//goes on till everywhere if node.leftChild == nil && node.rightChild == nil 

extension BinaryNode {

  public func traverseInOrder(visit: (Element) -> Void) {
    leftChild?.traverseInOrder(visit: visit)
    visit(value)
    rightChild?.traverseInOrder(visit: visit)
  }


public func traversePreOrder(visit: (Element) -> Void) {
  visit(value)
  leftChild?.traversePreOrder(visit: visit)
  rightChild?.traversePreOrder(visit: visit)
}

public func traversePostOrder(visit: (Element) -> Void) {
      leftChild?.traversePostOrder(visit: visit)
      rightChild?.traversePostOrder(visit: visit)
      visit(value)
    }


}
