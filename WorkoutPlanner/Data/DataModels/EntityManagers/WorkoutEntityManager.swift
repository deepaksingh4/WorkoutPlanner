//
//  WorkoutEntityManager.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 07/04/2023.
//

import Foundation
import CoreData

struct WorkoutEntityManager {
    let manager: CoreEntityManager<Workout>
    
    init() {
        self.manager = CoreEntityManager(ctx: CoreDataManager.instance.context)
    }
    
//    func saveWorkout(workout: WorkoutModel){
//        let workoutEntity = Workout(context: manager.context)
//        workoutEntity.name = workout.name
//        //        workoutEntity.muscle = workout.targetBodyMuscle.rawValue
//        workoutEntity.details = workout.description
//        workoutEntity.id = workout.id
//        manager.save()
//    }
    
    func fetchWorkouts() -> [WorkoutListModel]{
        guard let workouts = manager.fetchEntities(predicate: NSPredicate()) as? [[String : Any]] else{
            //throw an error
            return []
        }
        do{
            let data = try JSONSerialization.data(withJSONObject: workouts, options: .prettyPrinted)
            let workoutModels = try JSONDecoder().decode([WorkoutListModel].self, from: data)
            return workoutModels
        }catch(let error){
            print(error.localizedDescription)
            return []
        }
    }
    
    //    func deleteWorkout(workout: WorkoutModel) {
    //        if let toBeDeleted = manager.fetchEntities(predicate: NSPredicate(format: "id == %@", workout.id as CVarArg)).first {
    //            manager.deleteEntity(toBeDeleted: toBeDeleted)
    //        }
    //    }
    //
    //    func updateWorkout(workout: WorkoutModel){
    //        if let toBeDeleted = manager.fetchEntities(predicate: NSPredicate(format: "id == %@", workout.id as CVarArg)).first {
    //            toBeDeleted.name = workout.name
    //            toBeDeleted.details = workout.description
    ////            toBeDeleted.muscle = workout.targetBodyMuscle.rawValue
    //            manager.save()
    //        }
    //    }
    
    
    /*
     {
     "name": "Scapular Pull-Up",
     "force": "pull",
     "level": "beginner",
     "mechanic": "isolation",
     "equipment": null,
     "primaryMuscles": [
     "traps"
     ],
     "secondaryMuscles": [
     "lats",
     "middle back"
     ],
     "instructions": [
     "Take a pronated grip on a pull-up bar.",
     "From a hanging position, raise yourself a few inches without using your arms. Do this by depressing your shoulder girdle in a reverse shrugging motion.",
     "Pause at the completion of the movement, and then slowly return to the starting position before performing more repetitions."
     ],
     "category": "strength"
     }
     */
    func saveWorkoutsFromJSON(exercises: [[String : AnyObject]]) {
        exercises.forEach { exercise in
            let workout = Workout(context: manager.context)
            workout.id = UUID()
            workout.name = exercise["name"] as? String ?? ""
            workout.instructions = exercise["instructions"] as? [String] ?? []
            workout.force = exercise["force"] as? String ?? ""
            workout.category = exercise["category"] as? String ?? ""
            workout.level = exercise["level"] as? String ?? ""
            workout.primaryMuscles = exercise["primaryMuscles"] as? [String] ?? []
            workout.secondaryMuscles = exercise["secondaryMuscles"] as? [String] ?? []
            workout.equipment = exercise["equipment"] as? String ?? ""
            workout.level = exercise["level"] as? String ?? ""
            workout.mechanic = exercise["mechanic"] as? String ?? ""
            manager.context.perform {
               try? manager.context.save()
            }
        }
        print("done")
    }
    
}
