//
//  AddWorkoutViewModel.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 22/05/2023.
//

import Foundation

class AddWorkoutViewModel: ObservableObject{
    
    @Published var workouts = []
    
    func fetchWorkouts(){
        workouts = WorkoutEntityManager().fetchWorkouts()
    }
}
