//
//  ContentView.swift
//  Victor1A
//
//  Created by SW on 3/14/24./Users/sam/projects/Journals/bootcamp1b-/Victor1A/Victor1A/ContentView.swift
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  
  var body: some View {
    VStack{
      Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
        .kerning(2.0)
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
      Button ("Hit Me") {
        alertIsVisible = true
      }
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
  }
}


#Preview {
  ContentView()
}

