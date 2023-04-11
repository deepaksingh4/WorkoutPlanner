//
//  WorkoutJournal.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/29/23.
//

import SwiftUI

struct WorkoutJournal: View {
    @ObservedObject var viewModel: WorkoutJournalViewModel = WorkoutJournalViewModel()
    
    var body: some View {
        
        if viewModel.wokroutPlans.count == 0 {
            
            NavigationView {
                VStack {
                    NavigationLink(destination: DayPlanner()) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                            .padding(16)
                            .background(Color(.systemYellow))
                            .clipShape(Circle())
                            .shadow(radius: 2)
                    }
                    
                    

                    Text("Add your workout plan")
                        .font(.system(size: 14))
                        .foregroundColor(Theme.Colors.primaryTextColor)
                        .padding(8)
                    
                }
            }
        }else{
            VStack{
                HStack{
                    Spacer()
                    DailyThumbnailView(workoutState: .missed)
                    DailyThumbnailView(workoutState: .done)
                    DailyThumbnailView(workoutState: .done)
                    DailyThumbnailView(workoutState: .current)
                    DailyThumbnailView(workoutState: .planned)
                    DailyThumbnailView(workoutState: .planned)
                    DailyThumbnailView(workoutState: .notPlanned)
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 25))
                        .foregroundColor(.blue)
                }.padding(16)
                List(0..<2){ _ in
                    WorkoutView(allowEdit: true)
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
    case rest
    case notPlanned
}

struct DailyThumbnailView: View {
    
    var workoutState: WorkoutState = .missed
    var body: some View{
        switch workoutState {
        case .missed:
            Circle()
                .foregroundColor(.red)
                .frame(width: 25)
                .hoverEffect(.lift)
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
        case .rest:
            Circle()
                .foregroundColor(.yellow)
                .frame(width: 25)
        case .notPlanned:
            Circle()
                .foregroundColor(.gray)
                .frame(width: 25)
            
        }
        
    }
}
