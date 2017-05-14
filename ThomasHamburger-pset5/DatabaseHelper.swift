//
//  DatabaseHelper.swift
//  ThomasHamburger-pset5
//
//  Created by Thomas Hamburger on 11-05-17.
//  Copyright © 2017 Thomas Hamburger. All rights reserved.
//

import Foundation
import SQLite

// Hier komt alle logica die te maken heeft met data opslaan naar de database.
class DatabaseHelper {
    
    private var database: Connection?
    
    // The table consist of three columns: id, name and checkedOff.
    private let todosTable = Table("todosTable")
    private let id = Expression<Int64>("id")
    private let title = Expression<String>("title")
    private let completed = Expression<Bool>("completed")
    
    init?() {
        do {
            try setupDatabase()
        } catch {
            print(error)
            return nil
        }
    }
  
    private func setupDatabase() throws {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        do {
            database = try Connection("\(path)/db.sqlite3")
            try createTable()
        } catch {
            // Error handling here.
            throw error
        }
    }
    
    private func createTable() throws {
        do {
            try database!.run(todosTable.create(ifNotExists: true) { t in // CREATE TABLE "todos"
                t.column(id, primaryKey: .autoincrement)// "id" INTEGER // primaryKey: .autoincrement
                t.column(title) // "name" STRING
                t.column(completed) // "checkedOff" BOOLEAN
            })
        } catch {
            print("Failed to create table")
            throw error
        }
    }
    
    func create(title: String) throws {
        let insert = todosTable.insert(self.title <- title, self.completed <- false)
        
        do {
            let rowID = try database!.run(insert)
            print(rowID)
        } catch {
            throw error
        }
    }
    
    func read(keyWord: String) throws -> String? {
        var result: String?
        do {
            for todo in try database!.prepare(todosTable) {
                result = "id: \(todo[id]), name: \(todo[title]), completed: \(todo[completed])"
                print(result ?? "Geen todo gevonden met deze keyword")
            }
        } catch {
            throw error
        }
        return result
    }
    
    func markCompleted(id: Int64, completed: Bool) throws {
        do {
            try database!.run(todosTable.filter(id == self.id).update(self.completed <- completed))
        } catch {
            throw error
        }
    }
    
    func deleteTodoItem(id: Int64) throws {
        do {
            try database!.run(todosTable.filter(id == self.id).delete())
        } catch {
            throw error
        }
    }


    
}
