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
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var round = 1
    @State private var gameOver = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color(red: 0.62, green: 0.68, blue: 0.07),
                Color(red: 0.53, green: 0.55, blue: 0.03),
                Color(red: 0.42, green: 0.46, blue: 0.05),
                Color(red: 0.29, green: 0.36, blue: 0.04),
                Color(red: 0.15, green: 0.24, blue: 0.02)
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
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
                
                Text("Score: \(score)")
                    .titleStyle()
                
                Spacer()
            }
            .padding()
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Play Again", action: askQuestion)
        } message: {
            Text("Your Score is \(score)")
        }
        
        .alert(Text("Game Over"), isPresented: $gameOver) {
            Button("Restart", action: restart)
        } message: {
        Text("You scored \(score)")
        }
        
    }
    
    func buttonTapped(_ button: String) {
        if shouldWin {
            switch (button, currentChoice.first!) {
                case ("🪨", "✂️"), ("🧻", "🪨"), ("✂️", "🧻"):
                scoreTitle = "Correct!!"
                score += 1
            default:
                 scoreTitle = "Wrong"
            }
        } else {
            switch (button, currentChoice.first!) {
            case ("✂️", "🪨"), ("🪨", "🧻"), ("🧻", "✂️"):
                scoreTitle = "Correct!!"
                score += 1
            default:
                scoreTitle = "Wrong"
            }
        }
        
        if round == 5 {
            gameOver = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        currentChoice.shuffle()
        shouldWin = Bool.random()
        round += 1
        
    }
    
    func restart() {
        score = 0
        round = 1
        gameOver = false
        askQuestion()
    }
    
}

#Preview {
    ContentView()
}
