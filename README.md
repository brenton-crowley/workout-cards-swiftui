# workout-cards-swiftui
Coding challenge that shows a horizontal collection of cards styles to guidelines in SwiftUI.

Check out the [Objective-C version](https://github.com/brenton-crowley/workout-cards-objc/edit/main)

# Video Demo

https://user-images.githubusercontent.com/1415689/185831086-312fe31f-7ea3-470e-9062-ba6584b4a259.mov

## Disclaimer
This app is all my own work with just a few documentation look ups for AsyncImage.

I ran this on an iPhone 13 Mini. The card size is fixed.

## Reflections
- I preferred conforming to Hashable over Identifiable in the workout model. Easy enough to just provide id:\.self in the ForEach loop that displays the cards.
- You could get more creative an create an enumeration for the gilroy font that includes some associated data.
- The brief or user interaction might prefer a paginated feel instead of a scrollview. Could be done with a TabView.

## Known issues
- You'd probably want to dynamically resize the card based on the device size. To solve this, I'd use a GeometryReader and a scale factor for the font size. Make the width of the card around 85% of the device width.

