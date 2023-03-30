//
//  AddSetView.swift
//  WorkoutPlanner
//
//  Created by Deepak on 30/03/23.
//

import SwiftUI

struct AddSetView: View {
    @State private var numberOfReps: String = ""
    @State private var weight: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    print("Cancel")
                } label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                }.padding(8)
                Spacer()
                Text("Set 1").padding(8)
                Spacer()
                Button {
                    print("Done")
                } label: {
                    Text("Done")
                        .foregroundColor(.blue)
                }.padding(8)

            }
            HStack{
                TextField("Rep Count", text: $numberOfReps)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top,20)
                    .padding(.trailing, 16)
                    .padding(.leading, 16)
                    .padding(.bottom, 8)
                    .foregroundColor(.blue)
            }
            HStack(){
                TextField("Weight", text: $weight)
                    .textFieldStyle(.roundedBorder)
                    .padding(.trailing, 16)
                    .padding(.leading, 16)
                    .padding(.bottom, 16)
                    .foregroundColor(.blue)
                    
            }
            Spacer()
        }
//        .background(.red)
    }
}

struct AddSetView_Previews: PreviewProvider {
    static var previews: some View {
        AddSetView()
    }
}
