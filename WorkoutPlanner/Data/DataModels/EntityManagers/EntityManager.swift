//
//  EntityManager.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 07/04/2023.
//

import Foundation
import CoreData

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
    
    func fetchEntities(predicate: NSPredicate = NSPredicate()) -> [T] {
        let request = NSFetchRequest<T>()
        request.resultType = .dictionaryResultType
        request.entity = T.entity()
//        request.predicate = predicate
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
