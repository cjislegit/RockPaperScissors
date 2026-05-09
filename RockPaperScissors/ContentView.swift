//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Carlos Ramirez on 5/8/26.
//

import SwiftUI

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
                Text("Rock, Paper Scissors")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                
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
                            print(choice)
                        } label: {
                            Text("\(choice)")
                                .font(.system(size: 90))
                        }
                    }
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}



#Preview {
    ContentView()
}
