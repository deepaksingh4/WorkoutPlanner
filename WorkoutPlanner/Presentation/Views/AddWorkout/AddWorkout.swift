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
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.workouts) { element in
                        HStack {
                            Text("\(element.name)")
                                .frame(height: 40)
                                .foregroundColor(Color.white)
                                .contentShape(Rectangle())
                            //                                .background(content: <#T##() -> V#>)
                            
                            Spacer()
                        }
                    }
                }
            }
            //            List(0..<1){ index in
            //                Section("Select Workout") {
            //                    ForEach(0..<viewModel.workouts.count) { index_in in
            //                        .listRowBackground(workoutName == "\(index_in)" ? Color.green : Color.teal)
            //                            .listRowSeparator(.hidden)
            //                            .onTapGesture {
            //                                workoutName = "\(index_in)"
            //                            }
            //                    }
            //
            //                }
            //
            //            }.listStyle(.plain)
            //        }
            .onAppear(){
                viewModel.fetchWorkouts()
            }
            .searchable(text: $workoutName)
        }
    }
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout()
    }
}
