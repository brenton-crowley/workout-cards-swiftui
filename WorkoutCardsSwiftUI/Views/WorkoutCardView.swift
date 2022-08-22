//
//  WorkoutCardView.swift
//  WorkoutCardsSwiftUI
//
//  Created by Brent on 22/8/2022.
//

import SwiftUI

struct WorkoutCardView: View {
    
    private struct Constants {
        
        static let cardWidth:CGFloat = 300.0
        static let cardHeight:CGFloat = 260.0
        
        static let imageRadius:CGFloat = 20.0
        static let subCategoryFontSize:CGFloat = 11.0
        static let nameFontSize:CGFloat = 20.0
        static let detailsFontSize:CGFloat = 15.0
        static let contentSpacing:CGFloat = 3.0
    }
    
    let workout: Workout
    
    var imageURL:URL? { URL(string: workout.image ?? "") }
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: Constants.contentSpacing) {
            asyncImageView
            categoryLabel
            nameLabel
            detailLabel
        }
        .frame(width: Constants.cardWidth, height: Constants.cardHeight)
    }
    
    var asyncImageView: some View {
        
        AsyncImage(url: imageURL) { img in
            withAnimation {
                img
                    .resizable()
                    .scaledToFit()                
            }
        } placeholder: {
            Color.lightColor
                .opacity(0.1)
                .overlay(
                    ProgressView()
                )
        }
        .clipShape(RoundedRectangle(cornerRadius: Constants.imageRadius))
    }
    
    var image: some View {
        Image("image")
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: Constants.imageRadius))
    }
    
    var categoryLabel: some View {
        
        Text(workout.subCategoryText)
            .font(.custom(Font.gilroySemiBold, size: Constants.subCategoryFontSize))
            .foregroundColor(.accentColor)
            .padding(.top, 10.0)
        
    }
    
    var nameLabel: some View {
        
        Text(workout.name ?? "Workout Name")
            .font(.custom(Font.gilroySemiBold, size: Constants.nameFontSize))
            .foregroundColor(.darkColor)
        
    }
    
    var detailLabel: some View {
        
        Text(workout.detailText)
            .font(.custom(Font.gilroyMedium, size: Constants.detailsFontSize))
            .foregroundColor(.lightColor)
        
    }
}

struct WorkoutCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let workouts = try? JSONService.shared.makeModelsForBundleJSONFilename("workouts", modelType: [Workout].self)
        
        let workout = workouts?.first ?? Workout()
        
        WorkoutCardView(workout: workout)
    }
}
