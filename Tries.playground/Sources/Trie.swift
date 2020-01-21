import Foundation

public class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {

    public typealias Node = TrieNode<CollectionType.Element>

    private let root = Node(key: nil, parent: nil)

    public init() {}

    public func insert(_ collection: CollectionType) {

        //curret keeps track of traversal progress -> it starts from the root node
        var current = root

        // tries stores each element of a collection in separate nodes.
        for element in collection {
            if current.children[element] == nil { //for each element we first check if the node currently exists in the children dictionary
                current.children[element] = Node(key: element, parent: current) //if it doesnt -> then we create a new node
            }

            current = current.children[element]! //during each loop we move current to the next node
        }

        //after itirating through the for in loop, current should be referencing the node representing the end of the collection, so we mark this node as terminating
        current.isTerminating = true
    }
//similar to insert
    public func contains(_ collection: CollectionType) -> Bool {
      var current = root
      for element in collection {
        guard let child = current.children[element] else {
          return false
        }
        current = child
      }
      return current.isTerminating
    }

    public func remove(_ collection: CollectionType) {
      // here we check if collection is part of  the trie and point current to the last node of the collection
      var current = root
      for element in collection {
        guard let child = current.children[element] else {
          return
        }
        current = child
      }
      guard current.isTerminating else {
        return
      }
      // we set current terminating to false, so current can be removed
      current.isTerminating = false
      //if there are no other children in the current node -> other collections do not depend on the current node
      while let parent = current.parent,
            current.children.isEmpty && !current.isTerminating { //we also check if the current node is a terminating. If it is terminating -> it belongs to another collection
                //then we remove the nodes
          parent.children[current.key!] = nil
          current = parent
      }
    }

}

public extension Trie where CollectionType: RangeReplaceableCollection { //because algorithm will need to access to the append method of RangeReplaceableCollection type


    func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        var current = root
        //here we check if the trie contains the prefix, if not -> it returns empty array
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }
            current = child //is the node which is the end of prefix (last element of prefix)
        }

        return collections(startingWith: prefix , after: current) //here we are calling recursive helper method mentioned below

    }

    private func collections(startingWith prefix: CollectionType,
                             after node: Node) -> [CollectionType] {
      // we create an array to hold the results
      var results: [CollectionType] = []
        //if node is terminating -> then we add it to results
      if node.isTerminating {
        results.append(prefix)
      }

      //
      for child in node.children.values { //we are checking the current node's children (what is after our prefix)
        var prefix = prefix //we declared the variable prefix, which is our collection prefix from parameters
        prefix.append(child.key!) //we adding all the nodes which are after our prefix to prefix
        results.append(contentsOf: collections(startingWith: prefix,
                                               after: child)) //after child means after the last element of prefix
      }

      return results
    }

}
