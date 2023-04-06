//
//  DataController.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/31/23.
//

import Foundation
import CoreData
import Combine
 
struct CoreDataManager: DataManager{
    var container: NSPersistentContainer = NSPersistentContainer(name: "WorkoutContainer")
    var context: NSManagedObjectContext
    {
        get {
            return container.viewContext
        }
    }
    
}
