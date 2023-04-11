//
//  AddWorkout.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

import SwiftUI

struct AddWorkout: View {
    @State private var workoutName: String = ""
    @State private var selected: Int = 0
    var body: some View {
        NavigationView {
            List(0..<1){ index in
                Section("Select Workout") {
                    ForEach(0..<5){ index_in in
                        HStack {
                            Text("\(index_in)")
                                .frame(height: 40)
                                .foregroundColor(Color.white)
                            
                            Spacer()
                        }.listRowBackground(workoutName == "\(index_in)" ? Color.green : Color.teal)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                workoutName = "\(index_in)"
                            }
                    }
                    
                }
                
            }.listStyle(.sidebar)
        }
        .searchable(text: $workoutName)
    }
    
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout()
    }
}
