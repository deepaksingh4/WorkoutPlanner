//
//  AddWorkout.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

import SwiftUI

struct AddWorkout: View {
    
    private var viewModel = AddWorkoutViewModel()
    @State private var workoutName: String = ""
    @State private var selected: Int = 0
    var body: some View {
        NavigationView {
            List(0..<1){ index in
                Section("Select Workout") {
                    ForEach(viewModel.workouts) { index_in in
                        HStack {
                            Text("\(index_in)")
                                .frame(height: 40)
                                .foregroundColor(Color.white)
                                .contentShape(Rectangle())
                            
                            Spacer()
                        }.listRowBackground(workoutName == "\(index_in)" ? Color.green : Color.teal)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                workoutName = "\(index_in)"
                            }
                    }
                    
                }
                
            }.listStyle(.plain)
        }
        .onAppear(){
            
        }
        .searchable(text: $workoutName)
    }
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout()
    }
}
