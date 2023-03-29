//
//  WorkoutJournal.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/29/23.
//

import SwiftUI

struct WorkoutJournal: View {
    var workoutPlan: Bool = false
    var body: some View {
        if workoutPlan{
            VStack {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .padding(16)
                    .background(Color(.systemYellow))
                    .clipShape(Circle())
                .shadow(radius: 2)
                Text("Add your workout plan")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(8)
            }
           
        }else{
            VStack{
                HStack{
                    Spacer()
                    Circle()
                        .foregroundColor(.red)
                        .frame(width: 25)
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 25)
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.green)
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 40)
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 25)
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 25)
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 25)
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 25))
                        .foregroundColor(.green)
                }.padding(16)
                List(0..<2){ _ in
                    WorkoutView()
                        .listRowSeparator(.hidden)
                }.listStyle(.plain)
            }
        }
        
    }
}

struct WorkoutJournal_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutJournal()
            .listRowSeparator(.hidden)
    }
}

enum WorkoutState{
    case missed
    case done
    case planned
    case current
}

struct DailyThumbnailView: View {
    
    var workoutState: WorkoutState = .missed
    var body: some View{
        switch workoutState {
        case .missed:
            Circle()
                .foregroundColor(.red)
                .frame(width: 25)
        case .done:
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 25))
                .foregroundColor(.green)
        case .planned:
            Circle()
                .foregroundColor(.green)
                .frame(width: 25)
        case .current:
            Circle()
                .foregroundColor(.green)
                .frame(width: 40)
        }
        
    }
}
