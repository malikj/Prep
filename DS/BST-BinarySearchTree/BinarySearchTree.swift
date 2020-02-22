//
//  BinarySearchTree.swift
//  BinaryTree
//
//  Created by malikj on 19/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

class BinarySearchTree<T:Comparable> {
    
    var value: T
    var left : BinarySearchTree?
    var right : BinarySearchTree?
    var parent : BinarySearchTree?
    
    init(value:T) {
        self.value = value
    }
    
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(value: v)
        }
    }
    
    
    var isRoot : Bool {
        return self.parent == nil
    }
    
    var isLeaf:Bool {
        return self.left == nil && self.right == nil
    }
    
    var isLeftChild:Bool {
        return self.parent?.left === self
    }
    
    var isRightChild:Bool {
        return self.parent?.right === self
    }
    
    var hasLeftChild: Bool {
        return left != nil
    }
    
    var hasRightChild: Bool {
        return right != nil
    }
    
    var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    func insert(value:T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            }
            else {
                left  = BinarySearchTree(value: value)
                left?.parent = self
            }
        }
        else  {
            if let right = right {
                right.insert(value: value)
            }
            else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    public func recursiveSearch(value: T) -> BinarySearchTree? {
        if value < self.value {
            return left?.search(value)
        } else if value > self.value {
            return right?.search(value)
        } else {
            return self  // found it!
        }
    }
    
    public func search(_ value: T) -> BinarySearchTree? {
        var node: BinarySearchTree? = self
        
        while let n = node {
            if value < n.value {
                node = n.left // search in left
            } else if value > n.value {
                node = n.right // search in right
            } else {
                return node // value found
            }
        }
        return nil
    }
    
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    func traversePreOrder (process:(T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    func traversePostOrder (process:(T) -> Void) {
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
        process(value)
    }
    
    func map(formula: (T) -> T) -> [T] {
        var a = [T]()
        if let left = left { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = right { a += right.map(formula: formula) }
        return a
    }
    
    func toArray() -> [T] {
        return map { $0 }
    }
    
    // Mark: - Delete
    
    private func reconnectParentTo(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    @discardableResult public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        
        // Replacement for current node can be either biggest one on the left or
        // smallest one on the right, whichever is not nil
        if let right = right {
            replacement = right.minimum()
        } else if let left = left {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        
        // Place the replacement on current node's position
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentTo(node:replacement)
        
        // The current node is no longer part of the tree, so clean it up.
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
}
