import Foundation

public class TrieNode<Key: Hashable> {

    //key holds the data for the node. Optional because root has no key
    public var key: Key?

    //trieNode holds a weak reference to its parent -> this reference simplifies remove operation
    public weak var parent: TrieNode?

    //node holds multiple different elements -> so children dictionary will handle them
    public var children: [Key: TrieNode] = [:]

    //
    public var isTerminating = false

    public init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}
