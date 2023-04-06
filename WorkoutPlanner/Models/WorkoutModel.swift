//
//  WorkoutModel.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

import Foundation

struct WorkoutModel{
    var name: String
    var iconImage: String
    var sets: Sets?
    var videoURL: String?
    var targetBodyMuscle: BodyMuscle
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
    var count: Int
    var weight: Int
}
