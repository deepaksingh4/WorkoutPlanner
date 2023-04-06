//
//  WorkoutPlannerApp.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

import SwiftUI

@main
struct WorkoutPlannerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            WorkoutJournal()
        }
    }
}

