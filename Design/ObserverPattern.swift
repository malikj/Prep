//
//  ObserverPattern.swift
//  ArrayInDetail
//
//  Created by malikj on 05/02/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation


//
//  Observer.swift
//  NewProject
//
//  Created by Adam on 1/21/19.
//  Copyright © 2019 Adam. All rights reserved.
//
/*
 *
            When there is one-to-many relationship between objects
            such as if one object is modified, its depenedent objects
            are to be notified automatically
 *
 */


import Foundation

protocol ObservableEx {
  associatedtype T
    var value :T {get set}
    var observers:[ObserverEx] {get set}
    func addObserver(observer:ObserverEx)
    func removeObserver(observer:ObserverEx)
    func notifyAllObservers<T>(with newValue:T)
}

protocol ObserverEx {
    var id :Int {get }
    func update<T>(with newValue:T)
}

class Manager<T> : ObservableEx {
    var _value: T! = nil
    var _observers: [ObserverEx] = [ObserverEx]()
    
    var value: T {
        get {
            return _value
        }
        set {
            self._value = newValue
            notifyAllObservers(with: newValue)
        }
    }
    
    var observers: [ObserverEx] {
        get {
            return self._observers
        }
        set {
            self._observers = newValue;
        }
    }
    
    func addObserver(observer: ObserverEx) {
        observers.append(observer)
    }
    
    func removeObserver(observer: ObserverEx) {
        observers = observers.filter({$0.id != observer.id})
        
      //  let even = values.filter { $0 % 2 == 0 }

    }
    
    func notifyAllObservers<T>(with newValue: T) {
        for observer in observers {
            observer.update(with: newValue)
        }
    }
    
}

class Observer_New_Class_1 : ObserverEx {
    var _id: Int = 0
    var id : Int {
        get {
            return self._id
        }
    }
    init(id:Int) {
        self._id = id
    }
    
    func update<T>(with newValue: T) {
        print(" Observer #\(self.id) updated with new value : ", newValue)
    }

}

// main observer Methods or actions
protocol ApplyObservable {
    associatedtype T
    var value : T { get set }
    var observers : [ObserverTwo] { get set }
    
    func addObserver(observer: ObserverTwo)
    func removeObserver(observer: ObserverTwo)
    func notifyAllObservers<T>(with newValue: T)
}

// Observer
protocol ObserverTwo {
    var id : Int { get } // property to get an id
    func update<T>(with newValue: T)
}

class Variable<T> : ApplyObservable {
    
    private var _value : T! = nil
    private var _observers : [ObserverTwo] = []
    
    var value : T {
        get {
            return self._value
        }
        set {
            self._value = newValue
            self.notifyAllObservers(with: newValue)
        }
    }
    
    var observers : [ObserverTwo] {
        get {
            return self._observers
        }
        set {
            self._observers = newValue
        }
    }
    
    func addObserver(observer: ObserverTwo) {
        observers.append(observer)
    }
    
    func removeObserver(observer: ObserverTwo) {
        observers = observers.filter({$0.id != observer.id})
    }
    
    func notifyAllObservers<T>(with newValue: T) {
        for observer in observers {
            observer.update(with: newValue)
        }
    }
}



class Observer_Class_1 : ObserverTwo {
    
    private var _id : Int = 0
    
    var id: Int {
        get {
            return self._id
        }
    }
    
    init(id: Int) {
        self._id = id
    }
    
    func update<T>(with newValue: T) {
        print(" Observer #\(self.id) updated with new value : ", newValue)
    }
    
}

class Observer_Class_2: ObserverTwo {
    
    private var _id : Int = 0
    
    var id: Int {
        get {
            return self._id
        }
    }
    
    init(id: Int) {
        self._id = id
    }
    
    func update<T>(with newValue: T) {
        print(" Observer #\(self.id) updated with new value : ", newValue)
    }
}


class tester  {
    static func test() {
        let obs1 = Observer_Class_1(id: 1)
        let obs2 = Observer_Class_2(id: 2)
        let obsv = Variable<String>()
        
        let obsInt = Variable<Int>()
        obsInt.addObserver(observer: obs2)
        obsInt.value = 2;
        
        obsv.addObserver(observer: obs1)
        obsv.addObserver(observer: obs2)
        obsv.value = "Hello world"
        obsv.removeObserver(observer: obs1)
        obsv.value = "Obs1 removed, yey"
        
        let newobs1 = Observer_New_Class_1(id: 1)
        let manager =  Manager<Int>()
        manager.addObserver(observer: newobs1)
        manager.value = 1;
        manager.removeObserver(observer: newobs1)

        
    }
}
