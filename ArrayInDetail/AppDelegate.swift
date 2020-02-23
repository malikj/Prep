//
//  AppDelegate.swift
//  ArrayInDetail
//
//  Created by malikj on 07/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        HashingProblemsss();
      
        SearchProblems();
        return true
    }
    
    func SearchProblems() {
        Search.searchElementInArray()
    }
    func HashingProblemsss(){
        
            let inputArray = [1, 14, 11, 51, 15]

//        int n = arr.Length;
//        int low = 1, high = 10;
//        HashingProblems.zeroSumSubarray();
//        HashingProblems.findMissingRange(array: inputArray, low: 50, high: 55)
        
        HashingProblems.PrintAllSubArrayWithZero()
        
          // Override point for customization after application launch.
        //        let inputArray = [1, 2, 1, 3, 4, 2, 3]
        //
        //        let ar = [[11, 20],[30, 40], [5, 10], [40, 30], [10, 5]]
        //
        ////        int arr[] =  {1, 9, 3, 10, 4, 20, 2};
        //
        //        let arraylogestConSubSeq = [1, 9, 3, 10, 4, 20, 2]
        //        HashingProblems.findLongestConseqSubseq(array: arraylogestConSubSeq);
        //        HashingProblems.countDistinctNew(a: inputArray, k: 4, n: inputArray.count)
        //        HashingProblems.countDisdinct(arr: inputArray, k: 4)
        //        HashingProblems.findSymPairs(array: ar);
        //        ValidParenthesis.test();
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

