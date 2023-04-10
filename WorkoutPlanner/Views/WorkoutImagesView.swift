//
//  WorkoutImagesView.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 10/04/2023.
//

import SwiftUI



struct WorkoutImagesView: View {
    
    let workoutIcons: [WorkoutImage]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(.fixed(100), spacing: 50), GridItem(.fixed(100), spacing: 30)], spacing: 20) {
                ForEach(workoutIcons){icon in
                    Image(icon.image)
                        .resizable()
                        .padding(10)
                        .scaledToFit()
                        .modifier(bgCircleWithStroke(backgroundColor: .green, strokeColor: .black))
                }
            }
        }
    }
}

struct WorkoutImagesView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutImagesView(workoutIcons: [WorkoutImage(image:"punch"), WorkoutImage(image:"punch")])
    }
}

struct WorkoutImage: Identifiable {
    let id = UUID()
    let image: String
}

//func workoutImages() -> [WorkoutImage]{
//    let images = []
//    
//}


struct bgCircleWithStroke: ViewModifier {
    
    let backgroundColor: Color
    let strokeColor: Color
    
    func body(content: Content) -> some View {
        content
            .background(Circle().strokeBorder(strokeColor))
            .background(backgroundColor)
            .clipShape(Circle())
    }
}
