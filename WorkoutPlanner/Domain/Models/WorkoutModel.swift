//
//  WorkoutModel.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

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

import Foundation

struct WorkoutListModel: Identifiable, Decodable{
    
    let name: String
//    let iconImage: String
    let instructions: [String]
    let equipment: String?
//    let primary: String?
//    let description: String
    let id: UUID
    let primaryMuscles: [BodyMuscle]

}

enum BodyMuscle: String, Decodable{
    case Chest = "chest"
    case Biceps = "biceps"
    case Triceps = "triceps"
    case Legs = "legs"
    case Back = "back"
    case Shoulder = "shoulder"
    case Abs = "abs"
    case Hamstring = "hamstring"
    
}

struct Sets{
    let count: Int
    let weight: Int
}
