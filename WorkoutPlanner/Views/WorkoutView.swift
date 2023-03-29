//
//  WorkoutView.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

import SwiftUI

struct WorkoutView: View{
    var body: some View {
        HStack(spacing: 16){
            Image("bench-press")
                .renderingMode(.template)
                .resizable()
                .foregroundColor(Color("button"))
                .scaledToFit()
                .frame(width: 80)
            VStack(alignment: .leading){
                Text("Bench Press")
                    .font(.headline)
                HStack{
                    Text("10-12")
                        .font(.caption)
                    Spacer()
                    Button {
                        print("Add details for workout")
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color("background"))
                            .padding(8)
                            .background(Color("button"))
                            .clipShape(Circle())
                    }.buttonStyle(.plain)
                }
            }
            Spacer()
        }
        .padding(16)
        .background(Color("background"))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: Color("darkGray"), radius: 1)
        
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
