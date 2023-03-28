//
//  ContentView.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    
     @State private var searchText: String = ""
     @State private var presentSheet: Bool = false
    var body: some View {
        
        NavigationStack{
            ZStack{
                List(1..<10){ index in
                    ZStack {
                        WorkoutView()
                        NavigationLink(destination: Text("aa \(index)")){
                            EmptyView()
                        }.opacity(0)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.grouped)
                .scrollContentBackground(.hidden)
                .searchable(text: $searchText)
                
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
                            Text("csutom")
                                .presentationDetents([.fraction(0.5)])
                                .presentationDragIndicator(.visible)
                        }
                }
                
            }
        }
        .ignoresSafeArea()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
