//
//  WorkoutDayPlan.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/29/23.
//

import Foundation

struct WorkoutDayPlan: Identifiable{
    var workouts: [WorkoutListModel]
    var day: Int
    var id = UUID()
}
