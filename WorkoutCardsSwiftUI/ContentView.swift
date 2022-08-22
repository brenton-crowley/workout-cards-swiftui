//
//  ContentView.swift
//  WorkoutCardsSwiftUI
//
//  Created by Brent on 22/8/2022.
//

import SwiftUI

struct ContentView: View {
    
    private struct Constants {
        static let titleSize:CGFloat = 30.0
        static let scrollviewHeight:CGFloat = 260.0
        
        static let rows = [
            GridItem(.flexible())
        ]
        
        static let noWorkoutsMessage = "No workouts to display!"
    }
    
    @ObservedObject private var model = WorkoutsViewModel()
    
    var workouts: [Workout] { model.workouts ?? []}
    
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
            LazyHGrid(rows: Constants.rows) {
                ForEach(workouts, id:\.self) { workout in
                    makeCardForWorkout(workout)
                        .padding(.leading)
                }
            }
        }
        .frame(height: 260.0)
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
