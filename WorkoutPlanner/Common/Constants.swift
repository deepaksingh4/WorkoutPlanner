//
//  Constants.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/31/23.
//
//Crunches Gym Equipment by Gan Khoon Lay from <a href="https://thenounproject.com/browse/icons/term/crunches-gym-equipment/" target="_blank" title="Crunches Gym Equipment Icons">Noun Project</a>

import Foundation
import SwiftUI

enum bodyParts: String{
    case abdominals
    case abductors
    case adductors
    case biceps
    case calves
    case chest
    case forearms
    case glutes
    case hamstrings
    case lats
    case lower_back
    case middle_back
    case neck
    case quadriceps
    case traps
    case triceps
}


func getAllWorkoutImages() -> [WorkoutImage]{
    let fileManager = FileManager.default
    
    guard let filePath = Bundle.main.path(forResource: "workoutImages", ofType: nil) else{
        return []
    }
    
    let content = try? fileManager.contentsOfDirectory(atPath: filePath)
    
    print(content)
    return []
}


struct Theme {
    struct Colors {
        static let primaryTextColor = Color("darkGray")
    }
}


