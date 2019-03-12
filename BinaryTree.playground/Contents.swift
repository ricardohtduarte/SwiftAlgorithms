// Binary Search Tree
// value on the left should always have the highest value
// for example
//          5
//      3      10
//    2   4  9   11

// Advantage of a Binary Tree: allows the quick search of elements
// due to its O(logn) complexity due too the decrease of elements
// to search over time since the tree is getting smaller while the
// search proceeds

class Node {
    var value: Int
    var leftNode: Node?
    var rightNode: Node?
    
    init(value: Int, leftNode: Node?, rightNode: Node?) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

func buildBST() -> Node {
    let node2 = Node(value: 2, leftNode: nil, rightNode: nil)
    let node4 = Node(value: 4, leftNode: nil, rightNode: nil)
    let node9 = Node(value: 9, leftNode: nil, rightNode: nil)
    let node11 = Node(value: 11, leftNode: nil, rightNode: nil)
    let node3 = Node(value: 3, leftNode: node2, rightNode: node4)
    let node10 = Node(value: 10, leftNode: node9, rightNode: node11)
    let root = Node(value: 5, leftNode: node3, rightNode: node10)
    return root
}

func searchElement(rootNode: Node, value: Int) -> Bool {
    print(rootNode.value)
    
    if value == rootNode.value {
        return true
    } else if value > rootNode.value {
        guard let rightNode = rootNode.rightNode else {
            return false
        }
        return searchElement(rootNode: rightNode, value: value)
    } else if value < rootNode.value {
        guard let leftNode = rootNode.leftNode else {
            return false
        }
        return searchElement(rootNode: leftNode, value: value)
    }
    
    return false
}

searchElement(rootNode: buildBST(), value: 11)





