//
//  Workout.swift
//  WorkoutCardsSwiftUI
//
//  Created by Brent on 22/8/2022.
//

import Foundation

struct Workout: Hashable, Decodable {
    
    var name, subcategoryName, estimatedDuration, image: String?
    var circuitCount, exerciseCount: Int?
}

// Store helper properties in an extension to separate from the model details.
extension Workout {
    var detailText:String {
        
        "\(circuitCount ?? 0) Circuits • \(exerciseCount ?? 0) Exercises • \(estimatedDuration ?? "-") Mins"
        
    }
    
    var subCategoryText: String {
        if let text = self.subcategoryName {
            return text.uppercased()
        }
        
        return "Sub category name".uppercased()
    }
}
