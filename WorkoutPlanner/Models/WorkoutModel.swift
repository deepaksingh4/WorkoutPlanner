//
//  WorkoutModel.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

import Foundation

struct WorkoutModel{
    let name: String
    let iconImage: String
    let sets: Sets?
    let videoURL: String?
    let description: String
    let id: UUID
    let targetBodyMuscle: BodyMuscle
}

enum BodyMuscle: String{
    case Chest
    case Biceps
    case Triceps
    case Legs
    case Back
    case Shoulder
    case Abs
    case Hamstring
}

struct Sets{
    let count: Int
    let weight: Int
}
