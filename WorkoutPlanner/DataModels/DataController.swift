//
//  DataController.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/31/23.
//

import Foundation
import CoreData
 
class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Workout")
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load data model \(error)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
         try context.save()
            print("data saved")
        }catch{
            print("Unable to save")
        }
    }
    
//    func addWorkout(workout: WorkoutModel, context: NSManagedObjectContext){
//
//    }
}


struct WorkoutModel{
    let id = UUID()
    let name: String
    let muscle: String
    let details: String
}
