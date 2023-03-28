//
//  AddWorkout.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

import SwiftUI

struct AddWorkout: View {
    @State private var workoutName: String = ""
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: "plus")
                .renderingMode(.template)
                .resizable()
                .foregroundColor(Color("background"))
                .padding(16)
                .frame(width: 80, height: 80)
                .background(Color("button"))
                .clipShape(Circle())
            HStack(alignment: .center){

                TextField("Workout Name", text: $workoutName)
                    
            }
                
                
        }
    }
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout()
    }
}
