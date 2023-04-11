//
//  WorkoutJournalViewModel.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 11/04/2023.
//

import Foundation


class WorkoutJournalViewModel: ObservableObject{
    @Published var wokroutPlans: [WorkoutDayPlan] = []
    
    func fetchWorkoutPlans()
    {
        
    }
}


