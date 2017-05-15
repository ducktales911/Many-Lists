//
//  TodoList.swift
//  ThomasHamburger-pset5
//
//  Created by Thomas Hamburger on 11-05-17.
//  Copyright © 2017 Thomas Hamburger. All rights reserved.
//

import Foundation

// Todos: list of todoItems
    // One to many relatie: kan bestaan uit 0 tot meerdere todoItems
class TodoList {
    
    var todosArray = [TodoItem]()
    var listId: Int64
    var title: String
    
    init(title: String, listId: Int64) {
        self.title = title
        self.listId = listId
        self.todosArray = []
    }

}


// -title
