//
//  EntityManager.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 07/04/2023.
//

import Foundation
import CoreData

//protocol EntityManager{
//    associatedtype T
//    func save()
//    func fetch() -> [T]
//    var dataController: DataController {get set}
//}


class CoreEntityManager<T: NSManagedObject>{
    var context: NSManagedObjectContext
    
    init(ctx: NSManagedObjectContext){
        self.context = ctx
    }
    
    func save(){
        do{
            try context.save()
        }catch let error{
            print("error while saving \(error)")
        }
    }
    
    func fetchEntities(predicate: NSPredicate) -> [T] {
        let request = NSFetchRequest<T>()
        request.entity = T.entity()
        request.predicate = predicate
        var results: [T] = []
        do{
            results = try context.fetch(request)
        }catch let error{
            print("error while fetch \(error)")
        }
        
        return results
    }
    
    func deleteEntity(toBeDeleted: T){
          context.delete(toBeDeleted)
    }
    
    
}
