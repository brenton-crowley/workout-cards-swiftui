//
//  WorkoutsViewModel.swift
//  WorkoutCardsSwiftUI
//
//  Created by Brent on 22/8/2022.
//

import Foundation

class WorkoutsViewModel: ObservableObject {
    
    @Published private(set) var workouts: [Workout]?
    
    init() {
        self.loadWorkouts()
        dump(workouts)
    }
    
    private func loadWorkouts() {
        do {
            workouts = try JSONService.shared.makeModelsForBundleJSONFilename("workouts", modelType: [Workout].self)
        } catch {
            print(error)
        }
    }
}
