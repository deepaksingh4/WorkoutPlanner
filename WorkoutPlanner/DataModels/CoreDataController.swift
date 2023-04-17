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
    
    static let instance = CoreDataManager()
    
    
    private init() {
        container.loadPersistentStores { desc, error in
            guard error != nil else{
                print("Loaded successfully ")
                return
            }
            print("Unable to load")
        }
    }
    
    
    func setupInitialData(){
        //firsttime app launch
        let userDefault = UserDefaults.standard
        if !userDefault.bool(forKey: "FirstLounch"){
            guard let fileUrl = Bundle.main.path(forResource: "exercises", ofType: "json") else{
                return
            }
            
            if FileManager.default.fileExists(atPath: fileUrl){
                guard let content = FileManager.default.contents(atPath: fileUrl) else{
                    return
                }
                let workouts = try? JSONSerialization.jsonObject(with: content, options: [.mutableContainers]) as? [String: AnyObject] 
                WorkoutEntityManager().saveWorkoutsFromJSON(exercises: workouts?["exercises"] as? [[String: AnyObject]] ?? [])
            }
        }
        
        
        
        
    }
}
