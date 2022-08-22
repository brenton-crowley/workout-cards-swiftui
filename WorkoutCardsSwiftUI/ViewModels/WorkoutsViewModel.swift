//
//  WorkoutsViewModel.swift
//  WorkoutCardsSwiftUI
//
//  Created by Brent on 22/8/2022.
//

import Foundation

// ViewModel that's instantiated in ContentView
class WorkoutsViewModel: ObservableObject {
    
    @Published private(set) var workouts: [Workout]? // Model
    
    init() {
        self.loadWorkouts()
    }
    
    private func loadWorkouts() {
        do {
            workouts = try JSONService.shared.makeModelsForBundleJSONFilename("workouts", modelType: [Workout].self)
        } catch {
            print(error)
        }
    }
}
