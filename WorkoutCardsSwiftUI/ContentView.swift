//
//  ContentView.swift
//  WorkoutCardsSwiftUI
//
//  Created by Brent on 22/8/2022.
//

import SwiftUI

struct ContentView: View {
    
    // Store magic numbers in a private constants file.
    private struct Constants {
        static let titleSize:CGFloat = 30.0
        static let scrollviewHeight:CGFloat = 260.0
        static let noWorkoutsMessage = "No workouts to display!"
    }
    
    @ObservedObject private var model = WorkoutsViewModel()
    
    var workouts: [Workout] { model.workouts ?? []}
    
    var rows: [GridItem] { [
            GridItem(.flexible())
        ]
    }
    
    /// I prefer to hide the details of view components in computed properties.
    /// My hope is that you can read the list and easily drill down into what you want to find.
    /// For views that require a parameter, I will instead create a function.
    var body: some View {
        VStack (alignment: .leading) {
            titleView
            cardCollection
            Spacer()
        }
    }
    
    var titleView: some View {
        Text("Workouts")
            .font(.custom(Font.gilroyBold, size: Constants.titleSize))
            .padding(.leading)
    }
    
    var cardCollection: some View {
        
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHGrid(rows: rows) {
                ForEach(workouts, id:\.self) { workout in
                    makeCardForWorkout(workout)
                        .padding(.leading)
                }
            }
        }
        .frame(height: Constants.scrollviewHeight)
    }
    
    @ViewBuilder
    private func makeCardForWorkout(_ workout: Workout) -> some View {

        WorkoutCardView(workout: workout)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
