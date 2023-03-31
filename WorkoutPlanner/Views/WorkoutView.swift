//
//  WorkoutView.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 3/28/23.
//

import SwiftUI

struct WorkoutView: View{
    var allowEdit = false
    @State var isEditing = false
    var body: some View {
        HStack(spacing: 16){
            Image("bench-press")
                .renderingMode(.template)
                .resizable()
                .foregroundColor(Color("button"))
                .scaledToFit()
                .frame(width: 80)
                .padding(16)
            VStack(alignment: .leading){
                Text("Bench Press")
                    .font(.headline)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 8))
                Text("10-12")
                    .font(.caption)
                    .padding(.trailing, 8)
            }
            Spacer()
                .padding(16)
            if allowEdit{
                Button {
                    isEditing = true
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 32))
                        .foregroundColor(Color("background"))
                        .padding(EdgeInsets(top: 42, leading: 15, bottom: 42, trailing: 15))
                        .background(Color("button"))
                        .clipShape(Rectangle())
                }.buttonStyle(.plain)
                    .sheet(isPresented: $isEditing){
                        AddSetView(dismissView: $isEditing)
                            .shadow(radius: 1)
                            .presentationDetents([.fraction(0.25)])
                    }
                
            }
        }
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
