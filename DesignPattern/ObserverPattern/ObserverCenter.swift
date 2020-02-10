//
//  ObserverCenter.swift
//  ArrayInDetail
//
//  Created by malikj on 18/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import UIKit
import Foundation

class ObserverCenter {
    
    var observerMap:[String:Observer] = [:]
    
    func addObserver(observerName:String,observer:Observer) {
        observerMap[observerName] = observer
    }
    
    func deleteObserver(observerName:String) {
        observerMap.removeValue(forKey: observerName)
    }
    
    func notifyObserver(data:String) {
        
        for (_,value) in observerMap {
            let observer:Observer = value
            observer.updateData(data: data)
        }
    }
}

//  Refers from here
class MyNotification {
    var notificationName: String
    init(name: String) {
        notificationName = name
    }
}

class CourseObserverTwo: MyObserver {
    
    func processNotification(notification: MyNotification) {
        // this would get called when notification fires
    }
}

protocol MyObserver {
    func processNotification(notification: MyNotification);
}

class MyNotificationCenter {
    
    var observers = [MyObserver]();

    func addObserver(observer: MyObserver) {
        // Add the observer to the array
//        observers.a(observer);
//        var cookies = [[Int]]()
//        cookies.Add(1);
//        var reverseArray: [Int] = [Int]()
//        reverseArray.append(1);
        observers.append(observer);
    }

    func removeObserver(observer: MyObserver) {
        // Remove the observer from the array
//        observers.R();
    }

    func postNotification(n: MyNotification) {
        // For each object in the observer array, call its processNotification() method
        for i in observers {
            i.processNotification(notification: n);
        }
    }
}
