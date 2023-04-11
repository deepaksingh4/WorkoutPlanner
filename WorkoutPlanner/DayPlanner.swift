//
//  ContentView.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

import SwiftUI

struct DayPlanner: View {
    
    @ObservedObject var viewModel: DayPlannerViewModel = DayPlannerViewModel()
    
    @State private var selectedDay: Int = 1
    @State private var presentSheet: Bool = false
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                List(viewModel.workoutPlans[selectedDay - 1].workouts){ workout in
                    ZStack {
                        WorkoutView()
                        NavigationLink(destination: Text("aa \(workout.name)")){
                            EmptyView()
                        }.opacity(0)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.grouped)
                .scrollContentBackground(.hidden)
                
                GeometryReader { context in
                    Button {
                        print("add workout")
                        presentSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(.red)
                            .clipShape(Circle())
                    }.padding(.top,context.size.height - 70)
                        .padding(.leading,context.size.width/2 - 29)
                        .sheet(isPresented: $presentSheet) {
                            AddWorkout()
                                .presentationDetents([.fraction(0.5)])
                                .presentationDragIndicator(.visible)
                        }
                }
                
            }
            .navigationTitle("Workouts")
            .toolbar {
                HStack(alignment: .center){
                    ForEach(viewModel.workoutPlans){ workout in
                        Text("\(workout.day)")
                            .padding(2)
                            .modifier(bgCircleWithStroke(backgroundColor: workout.day == selectedDay ? .green : .yellow , strokeColor: .clear, width: 30))
                            .onTapGesture {
                                selectedDay = workout.day
                            }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DayPlanner()
    }
}
