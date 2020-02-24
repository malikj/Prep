/*
 
 
 //
 //  ViewController.swift
 //  BinaryTree
 //
 //  Created by malikj on 19/07/18.
 //  Copyright © 2018 malikj. All rights reserved.
 //

 import UIKit

 enum Gender :String {
     case Male, Female // in a single line like this, separated by commas
 }

 class ViewController: UIViewController {

     override func viewDidLoad() {
         super.viewDidLoad()
         
         BSTTreeWithClasses();
         
 //        arithmiticOperagtion()
 //        binaryTreeInsert()
 //        traverse()
 //        BinaryTreeTwo()
 //        BinaryTreeToArray()
     }
     
     func arithmiticOperagtion(){
         // leaf nodes
         let node5 = BinaryTree.node(.empttyy, "5", .empttyy)
         let nodeA = BinaryTree.node(.empttyy, "a", .empttyy)
         let node10 = BinaryTree.node(.empttyy, "10", .empttyy)
         let node4 = BinaryTree.node(.empttyy, "4", .empttyy)
         let node3 = BinaryTree.node(.empttyy, "3", .empttyy)
         let nodeB = BinaryTree.node(.empttyy, "b", .empttyy)
         
         // intermediate nodes on the left
         let Aminus10 = BinaryTree.node(nodeA, "-", node10)
         let timesLeft = BinaryTree.node(node5, "*", Aminus10)
         
         // intermediate nodes on the right
         let minus4 = BinaryTree.node(.empttyy, "-", node4)
         let divide3andB = BinaryTree.node(node3, "/", nodeB)
         let timesRight = BinaryTree.node(minus4, "*", divide3andB)
         
         // root node
         let tree = BinaryTree.node(timesLeft, "+", timesRight)
         print(tree)
     }
     
     
     /**
      
      /* Function to find sum of all the elements*/
      int addBT(Node* root)
      {
          if (root == NULL)
              return 0;
          return (root->key + addBT(root->left) + addBT(root->right));
      }
        
      */
     
     
     func BSTTreeWithClasses() {
         let numberList : Array<Int> = [8, 2, 10, 9, 11, 1, 7]
         
 //        let numberListnumberList : Array<Character> = ["c", "b", "a", "d", "e"]

         let bst = BST<Int>()
 //        let root = BST<Character>()
         for number in numberList {
             bst.addNodeTwo(number)
         }
         
 //        if (root == nil) {
 //            return 0;
 //        }
 //
 //        return (rootNode!.data + SumBT(rootNode?.leftNode) + SumBT(rootNode?.rightNode));
         
         
         //should print sorted tree
 //        root.printPreeOrderTree()

         bst.printTree()
         
         bst.addNodeTwo(15)
         
         bst.printTree()

         
         bst.search(value: 10);
         bst.search(value: 4);

         
         bst.deleteKey(value: 1)
         
         // sum of all elements
        print("sum of bt  \(bst.SumOfBinaryTree(root: bst.rootNode))");
         
 //        root.sear(value: 10, <#Int#>)
         
 //        root.searchTwo(value: 1)

         bst.printTree()
         
         bst.inorderTwo(nil);


     }
     
     func binaryTreeInsert() {
         
         var binaryTree: BinaryTree<Int> = .empttyy
         binaryTree.insert(newValue: 7) // binaryTree now has a node value with 5
         binaryTree.insert(newValue: 2) // binaryTree is unchanged
         binaryTree.insert(newValue: 10)
         print(binaryTree)

     }
     
     func traverse () {
         var tree: BinaryTree<Int> = .empttyy
         tree.insert(newValue: 7)
         tree.insert(newValue: 10)
         tree.insert(newValue: 2)
         tree.insert(newValue: 1)
         tree.insert(newValue: 5)
         tree.insert(newValue: 9)
         
         tree.traverseInOrder {
             print("started")
             print($0)
         }
     }
     
     func BinaryTreeTwo() {
         let treeTwo = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1])
         print(treeTwo)
         if((treeTwo.search(5)) != nil) {
             print("value found")
         }
         else {
             print("not found")
         }
         
         print("traverseInOrder --- ")
         treeTwo.traverseInOrder {

             print($0)
         }
         print("traversePreOrder --- ")

         treeTwo.traversePreOrder {
             
             print($0)
         }
         
         print("traversePostOrder --- ")

         treeTwo.traversePostOrder {
             print($0)
         }

     }
     
     func BinaryTreeToArray () {
         let tree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1])
            // [1, 2, 5, 7, 9, 10]
 //        print(tree.toArray())
         tree.remove()
         print(tree)
     }

     override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
     }


 }


 */

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
