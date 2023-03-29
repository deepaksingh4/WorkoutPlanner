//
//  AddWorkout.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

import SwiftUI

struct AddWorkout: View {
    @State private var workoutName: String = ""
    @State private var setCount: Int = 0
    var body: some View {
        
        VStack(alignment: .center){
//                Spacer()
                Image(systemName: "photo.circle.fill")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(Color("background"))
                    .padding(16)
                    .frame(width: 100, height: 100)
                    .background(Color("button"))
                    .clipShape(Circle())
//                Spacer()
                VStack(alignment: .center){
                    HStack{
                        Text("Workout Name")
                        Spacer()
                        TextField("Workout Name", text: $workoutName)
                    }
                    HStack(alignment: .center) {
                        Text("# Sets")
                        Spacer()
                        Text("\(setCount)")
                        Spacer()
                        Stepper("", value: $setCount)
                            .labelsHidden()
                    }.monospacedDigit()
                }
                
                Spacer()
                
                
                            
            }
            .padding(25)
        }
    
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout()
    }
}
