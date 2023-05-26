//
//  DataController.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 4/6/23.
//

import Foundation
import CoreData

protocol DataController{
    var context: NSManagedObjectContext {get}
    var container: NSPersistentContainer {set get}
}

class CoreDataControllr {
    
    private let modelName: String
    private(set) lazy var viewContext: NSManagedObjectContext  = {
        NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }()
    private lazy var backgroundContext: NSManagedObjectContext = {
        container.newBackgroundContext()
    }()
    
    private lazy var container: NSPersistentContainer = {
        NSPersistentContainer(name: modelName)
    }()
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
}
