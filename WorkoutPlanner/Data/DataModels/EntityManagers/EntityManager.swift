//
//  EntityManager.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 07/04/2023.
//

import Foundation
import CoreData


protocol EntityManager{
    associatedtype T : NSManagedObject
    var coreDaraManager: CoreDataManager {get set}
    init(coreDataManager: CoreDataManager)
    
    func insertObject(object: T) throws
    func fetchObject(with id: UUID) -> T?
    func batchInsert(data: [[String: Any]]) -> Bool
    func deleteObject(with id: UUID) -> Bool
    func fetchAllObjects() -> [T]
}

extension EntityManager{
    func insertObject(object: T) throws {
         try coreDaraManager.context.save()
    }
    
    func fetchObject(with id: UUID) throws -> T?{
        guard let entityName = T.entity().name else{
            return nil
        }
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        let result = try fetchRequest.execute()
        if result.count > 0{
            return result.first
        }
        return nil
    }
    
}

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
        request.resultType = .managedObjectResultType
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
    
    func fetchEntityDictionaries(predicate: NSPredicate = NSPredicate()) -> [String: Any] {
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.resultType = .dictionaryResultType
        request.entity = T.entity()
//        request.predicate = predicate
        var results: [String: Any] = [:]
        do{
            results = try context.fetch(request) as? [String: Any] ?? [:]
        }catch let error{
            print("error while fetch \(error)")
        }
        
        return results
    }
    
}
