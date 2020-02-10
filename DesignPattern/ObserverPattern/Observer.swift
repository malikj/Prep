//
//  Observer.swift
//  ArrayInDetail
//
//  Created by malikj on 18/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation

class Observer {
    func updateData(data:String) {}
}

class CourseObserver: Observer {
    var id: Int = 0
    
    func update<T>(with newValue: T) {
        
    }
    
    
    override func updateData(data: String) {
          print("课程更新了---\(data)")
    }
    
}

class StudyObserver: Observer {

    override func updateData(data: String) {
          print("学习更新了---\(data)")
    }
}
