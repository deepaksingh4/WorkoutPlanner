//
//  DayPlannerViewModel.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 11/04/2023.
//

import Foundation

class DayPlannerViewModel: ObservableObject{
    @Published var workoutPlans: [WorkoutDayPlan] = [WorkoutDayPlan(workouts: [], day: 1), WorkoutDayPlan(workouts: [], day: 2), WorkoutDayPlan(workouts: [], day: 3), WorkoutDayPlan(workouts: [], day: 4), WorkoutDayPlan(workouts: [], day: 5), WorkoutDayPlan(workouts: [], day: 6)]
    
    func fetchPlannedWorkouts(){
        //fecth from DB and update ht array of workout plan
    }
}
