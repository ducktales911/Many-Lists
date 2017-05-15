//
//  TodoItem.swift
//  ThomasHamburger-pset5
//
//  Created by Thomas Hamburger on 11-05-17.
//  Copyright © 2017 Thomas Hamburger. All rights reserved.
//

import Foundation

class TodoItem {
    // title
    // completed
    // picture
    // duration
    // background color
    // inProgress
    // descrition
    var id: Int64
    var title: String
    var completed: Bool
    var list: Int
    
    init(title: String, id: Int64, completed: Bool, list: Int) {
        self.title = title
        self.id = id
        self.completed = completed
        self.list = list
    }
    
}
