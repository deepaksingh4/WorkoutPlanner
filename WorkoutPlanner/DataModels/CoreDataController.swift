//
//  DataController.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/31/23.
//

import Foundation
import CoreData
import Combine
 
class CoreDataManager: DataController{
    var container: NSPersistentContainer = NSPersistentContainer(name: "WorkoutContainer")
    var context: NSManagedObjectContext
    {
        get {
            return container.viewContext
        }
    }
    
    
    init() {
        container.loadPersistentStores { desc, error in
            guard error != nil else{
                print("Loaded successfully ")
                return
            }
            print("Unable to load")
        }
    }
    
}
