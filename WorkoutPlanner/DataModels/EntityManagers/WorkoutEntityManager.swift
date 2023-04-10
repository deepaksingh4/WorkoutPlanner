//
//  WorkoutEntityManager.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 07/04/2023.
//

import Foundation

struct WorkoutEntityManager {
    let manager: CoreEntityManager<Workout>
    
    init() {
        self.manager = CoreEntityManager(ctx: CoreDataManager.instance.context)
    }
    
    func saveWorkout(workout: WorkoutModel){
        let workoutEntity = Workout(context: manager.context)
        workoutEntity.name = workout.name
        workoutEntity.muscle = workout.targetBodyMuscle.rawValue
        workoutEntity.details = workout.description
        workoutEntity.id = workout.id
        manager.save()
    }
    
    func fetchWorkouts() -> [WorkoutModel]{
        let workouts = manager.fetchEntities().map { workout in
            return WorkoutModel(
                name: workout.name!,
                iconImage: workout.name!,
                sets: nil,
                videoURL: nil,
                description: workout.description,
                id: workout.id!,
                targetBodyMuscle: BodyMuscle(rawValue: workout.muscle!) ?? .Back
            )
        }
        return workouts
    }
    
    func deleteWorkout(workout: WorkoutModel) {
        if let toBeDeleted = manager.fetchEntities(predicate: NSPredicate(format: "id == %@", workout.id as CVarArg)).first {
            manager.deleteEntity(toBeDeleted: toBeDeleted)
        }
    }
    
    func updateWorkout(workout: WorkoutModel){
        if let toBeDeleted = manager.fetchEntities(predicate: NSPredicate(format: "id == %@", workout.id as CVarArg)).first {
            toBeDeleted.name = workout.name
            toBeDeleted.details = workout.description
            toBeDeleted.muscle = workout.targetBodyMuscle.rawValue
            manager.save()
        }
    }
    
    
    
}
