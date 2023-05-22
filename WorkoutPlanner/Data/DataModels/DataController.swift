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
