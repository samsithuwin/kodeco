// plan for monday
//open -a Xcode

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  
  var body: some View {
    ZStack{
      Color.gray
      VStack{
        Text("🎯🎯🎯\nPUT the Bullseye as close as you can to".uppercased())
          .bold()
          .multilineTextAlignment(.center)
          .lineSpacing(4.0)
          .font(.footnote)
          .kerning(2.0)
          .padding(.horizontal,30)
        Text(String(game.target))
          .kerning(-1.0)
          .font(.largeTitle)
          .fontWeight(.black)
        HStack {
          Text("1")
            .bold()
          Slider(value: $sliderValue, in: 1.0...100.0)
          Text("100")
            .bold()
        }
        Button ("Hit Me".uppercased()) {
          alertIsVisible = true
        }
        .padding(20.0)
        .background(
          Color.blue
        )
        foregroundColor(.white)
          .cornerRadius(21.0)
          .bold()
          .font(.title3)
          .alert(
            "Hello there!",
            isPresented: $alertIsVisible,
            actions: {
              Button("Awesome") {
                print("Alert closed")
              }
            },
            message:{
              let roundedValue = Int(sliderValue.rounded())
              Text ("""
The slider's value is  \(roundedValue).
You scored \(game.points(sliderValue: roundedValue))points this round.
""")
            }
          )
      }
      .background(Color.gray)
    }
  }
}


#Preview {
  ContentView()
}

