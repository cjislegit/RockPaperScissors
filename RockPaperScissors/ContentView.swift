//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Carlos Ramirez on 5/8/26.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.white)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    @State var currentChoice = ["🪨", "🧻", "✂️"].shuffled()
    @State var shouldWin = Bool.random()
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color(red: 0.62, green: 0.68, blue: 0.07),
                Color(red: 0.53, green: 0.55, blue: 0.03),
                Color(red: 0.42, green: 0.46, blue: 0.05),
                Color(red: 0.29, green: 0.36, blue: 0.04),
                Color(red: 0.15, green: 0.24, blue: 0.02)
            ], startPoint: .top, endPoint: .bottom)
            
            VStack {
                Spacer()
                
                Text("Rock, Paper Scissors")
                    .titleStyle()
                
                VStack(spacing: 10) {
                    VStack {
                        Text("Tap Option That")
                        if shouldWin {
                            Text("Wins Against \(currentChoice.first!)")
                        } else {
                            Text("Loses Against \(currentChoice.first!)")
                        }
                    }
                    
                    ForEach(currentChoice, id: \.self) { choice in
                        Button {
//                            print(choice)
                            buttonTapped(choice)
                        } label: {
                            Text("\(choice)")
                                .font(.system(size: 90))
                        }
                    }
                }
                .padding(.vertical, 20)
                
                Spacer()
                Spacer()
                
                Text("Score: 0")
                    .titleStyle()
                
                Spacer()
            }
            .padding()
        }
        .ignoresSafeArea()
    }
    
    func buttonTapped(_ button: String) {
        if shouldWin {
            if button == "🪨" && currentChoice.first! == "✂️" {
                print("Correct!")
            } else if currentChoice.first! == "🪨" && button == "🧻" {
                print("Correct!!!!!!!")
            } else if currentChoice.first! == "🧻" && button == "✂️" {
                print("Correct!!!!")
            } else {
                print("Wrong")
            }
        } else {
            if currentChoice.first! == "✂️" && button == "🧻" {
                print("Correct!!!!")
            } else if currentChoice.first! == "🪨" && button == "✂️" {
                print("Correct!!!!!!!")
            } else if currentChoice.first! == "🧻" && button == "🪨" {
                print("Correct!!!!")
            } else {
                print("Wrong!!")
            }
        }
    }
    
}

#Preview {
    ContentView()
}
