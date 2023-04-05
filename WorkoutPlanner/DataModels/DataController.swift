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
    
    func fetchWorkouts(){
        let workoutRequest = NSFetchRequest<Workouts>(entityName: "Workouts")
        
        do {
            try container.viewContext.fetch(workoutRequest)
        }catch let error{
            print("Error while loading workout: \(error)")
        }
    }
    
//    func addWorkout(workout: WorkoutModel, context: NSManagedObjectContext){
//
//    }
}


struct WorkoutDataModel{
    let id = UUID()
    let name: String
    let muscle: String
    let details: String
}
