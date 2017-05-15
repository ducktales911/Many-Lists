//
//  TodoManager.swift
//  ThomasHamburger-pset5
//
//  Created by Thomas Hamburger on 11-05-17.
//  Copyright © 2017 Thomas Hamburger. All rights reserved.
//

import Foundation

class TodoManager {
    
    private let database = DatabaseHelper()
    
    static let sharedInstance = TodoManager()
    
    private init() { }
    
    // roep de functies aan door TodoManager.sharedInstance.fuctienaam(evt. paramters)
    func printHello() {
       print("Hello from the object side")
    }

    // Hier komt alle logica voor het verwerken van todoItems
    
    // IN DE VORM VAN EEN SINGLETON
    // todoLists: List of TodoLists
        // one to many relatie = kan bestaan uit 0 tot meedere todoLists
    
    // +readTodos
    
    // +writeTodos
}
