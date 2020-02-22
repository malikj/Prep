//
//  BinaryTreePractice.swift
//  BinaryTree
//
//  Created by malikj on 07/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

// Read -- https://medium.com/nickelfox/binary-search-tree-in-swift-9158aadbe6a3

import Foundation

//class Node<T> {
//    var value: T
//    var leftChild: Node?
//    var rightChild: Node?
//
//    init(value: T) {
//        self.value = value
//    }
//}


// use this
// https://www.journaldev.com/21454/swift-binary-search-tree
class TreeNode<T>{
    
    var data: T
    var leftNode : TreeNode?
    var rightNode : TreeNode? = nil;

//    init(value: T) {
//        self.data = value;
//    }
    
//    init(value: T, leftChild: TreeNode?, rightChild: TreeNode?) {
//        self.data = value;
//        self.leftNode = leftChild;
//        self.rightNode = rightChild;
//    }
    
    init(value: T, leftChild: TreeNode? = nil, rightChild: TreeNode? = nil) {
        self.data = value;
        self.leftNode = leftChild;
        self.rightNode = rightChild;
    }
    
}




extension BST{
    
    func deleteKey(value: T)
    {
    rootNode = deleteRec(rootNode, value)
    }
    
    /* A recursive function to insert a new key in BST */
    func deleteRec(_ root: TreeNode<T>?, _ key: T) -> TreeNode<T>?
    {
    /* Base Case: If the tree is empty */
        if  root == nil{
        return root
        }
    
        if key < (root?.data)! {
            // just make leftnode nil
        root?.leftNode = deleteRec(root?.leftNode, key)
        }
        else if key > (root?.data)!{
            // just make rightnode nil

            root?.rightNode = deleteRec(root?.rightNode, key)
            }
    else
    {
        if root?.leftNode == nil{
            return root?.rightNode
        }
        else if root?.rightNode == nil{
            return root?.leftNode
        }
        
    root?.data = (minValue(root?.rightNode))!
    root?.rightNode = deleteRec(root?.rightNode, (root?.data)!)
    }
    
    return root;
    }
    
    public func minValue(_ node: TreeNode<T>?) -> T? {
        
        var tempNode = node
        
        while let next = tempNode?.leftNode {
            tempNode = next
        }
        return tempNode?.data
    }
    
    public func maxValue(_ node: TreeNode<T>?) -> T? {
           
           var tempNode = node
           
           while let next = tempNode?.rightNode {
               tempNode = next
           }
           return tempNode?.data
       }
    
}



extension BST {
    
    func search(value: T) {
        self.searchTwo(self.rootNode, value)
//        searchTwo
    }
    
    
    func searchTwo(_ root: TreeNode<T>?, _ element :T){
        
        guard let rootNode = root else {
            print("NODE is Not available : \(element)")
            return
        }
        
        if element > rootNode.data {
            
            // right
            searchTwo(rootNode.rightNode,element);
        }
        
        else if element < rootNode.data {
            
            // left
            searchTwo(rootNode.leftNode,element);

        }
        else {
            print("NODE VALUE AVAILABLE : \(rootNode.data)")
        }
    
}
        
    
    private func search(_ root: TreeNode<T>?, _ element: T) {
        
        guard let rootNode = root else {
            print("NODE is Not available : \(element)")
            return
        }
        
        print("current root node \(rootNode.data)")
        if element > rootNode.data {
            self.search(rootNode.rightNode, element)
        } else if element < rootNode.data {
            self.search(rootNode.leftNode, element)
        } else {
            print("NODE VALUE AVAILABLE : \(rootNode.data)")
        }
    }
}

class BST<T : Comparable & CustomStringConvertible> {
    
    var rootNode :TreeNode<T>?
    
    // /* Function to find sum of all the elements*/
    
    func traverse() {
        print("\nPRE-ORDER TRAVERSE")
       // NLR
        self.preorder(self.rootNode)
        print("\n\nIN-ORDER TRAVERSE")
        // LNR
        self.inorder(self.rootNode)
        print("\n\nPOST-ORDER TRAVERSE")
        // LRN
        self.postorder(self.rootNode)
        print("\n")
    }

    func SumOfBinaryTree(root :TreeNode<Int>?) -> Int  {
        if (root == nil) {
            return 0;
        }
        
        return (root!.data + SumOfBinaryTree(root: root?.leftNode) + SumOfBinaryTree(root: root?.rightNode));
        
    }
    
    func addNode(_ value: T) {
        let node = TreeNode(value: value)
        if let rootNode = self.rootNode {
            self.insert(rootNode, node)
        } else {
            self.rootNode = node
        }
    }
    
    func addNodeTwo(_ value:T){
        let node = TreeNode(value: value);
        if let rootNode = self.rootNode {
            self.insertTwo(rootNode, node);
        }
        else {
            self.rootNode = node;
        }
    }
    
    func insertTwo( _ root : TreeNode<T>, _ node: TreeNode<T>){
        if root.data > node.data {
            // insert at left
            if let leftNode = root.leftNode {
                insertTwo(leftNode, node);
            }
            else {
                root.leftNode  = node
            }
        } else {
            // insert at right
            if let rightNode = root.rightNode {
                insertTwo(rightNode, node);
            }
            else {
                root.rightNode  = node
            }
        }
    }
    
    
    private func insert(_ root: TreeNode<T>, _ node: TreeNode<T>) {
        if root.data > node.data {
            if let leftNode = root.leftNode {
                self.insert(leftNode, node)
            } else {
                root.leftNode = node
            }
        } else {
            if let rightNode = root.rightNode {
                self.insert(rightNode, node)
            } else {
                root.rightNode = node
            }
        }
    }
    
    func printTree() {
        self.inorder(self.rootNode)
    }
    
    
    func printPreOrderTree() {
        self.preorder(self.rootNode)
    }
    
    func printPostOrderTree() {
        self.postorder(self.rootNode)
    }
    
    func printInOrderTree() {
        self.inorder(self.rootNode)
    }

    
    func inorderTwo( _ node : TreeNode<T>?) {
        guard node != nil else {
            return
        }
        self.inorderTwo(node?.leftNode)
        print("\(node!.data)", terminator: "");
        self.inorderTwo(node?.rightNode);
    }
    
    private func inorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        self.inorder(node?.leftNode)
        print("\(node!.data)", terminator: " ")
        self.inorder(node?.rightNode)
    }
    
//    // LNR : LEFT NODE RIGHT
//    private func inorder(_ node: TreeNode<T>?) {
//        guard let _ = node else { return }
//        self.inorder(node?.leftNode)
//        print("\(node!.data)", terminator: " ")
//        self.inorder(node?.rightNode)
//    }
    
    // NLR : NODE LEFT RIGHT
    private func preorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        print("\(node!.data)", terminator: " ")
        self.preorder(node?.leftNode)
        self.preorder(node?.rightNode)
    }
    
    // LRN :  LEFT RIGHT NODE
    private func postorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        self.postorder(node?.leftNode)
        self.postorder(node?.rightNode)
        print("\(node!.data)", terminator: " ")
    }
    
}
