import UIKit

//var tree: BinaryNode<Int> = {
//  let zero = BinaryNode(value: 0)
//  let one = BinaryNode(value: 1)
//  let five = BinaryNode(value: 5)
//  let seven = BinaryNode(value: 7)
//  let eight = BinaryNode(value: 8)
//  let nine = BinaryNode(value: 9)
//
//  seven.leftChild = one
//  one.leftChild = zero
//  one.rightChild = five
//  seven.rightChild = nine
//  nine.leftChild = eight
//
//  return seven
//}()
//
//print (tree)
//tree.traverseInOrder { print($0)}
//tree.traversePreOrder { print($0) }
//tree.traversePostOrder { print($0) }


//unbalanced tree
//var bst = BinarySearchTree<Int>()
//for i in 0..<5 {
//    bst.insert(i)
//}
//print(bst)


var exampleTree: BinarySearchTree<Int> {
    var bst = BinarySearchTree<Int>()
    bst.insert(3)
    bst.insert(1)
    bst.insert(4)
    bst.insert(0)
    bst.insert(2)
    bst.insert(5)
    return bst
    }

print(exampleTree)


if exampleTree.contains(5) {
    print("Found 5!")
} else {
    print("Couldn't find 5")
}
var tree = exampleTree
  print("Tree before removal:")
  print(tree)
  tree.remove(3)
  print("Tree after removing root:")
  print(tree)
