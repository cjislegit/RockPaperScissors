//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Carlos Ramirez on 5/8/26.
//

import SwiftUI

struct ContentView: View {
    @State var currentChoice = ["rock", "paper", "scissors"].shuffled()
    @State var shouldWin = Bool.random()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color(red: 0.39, green: 0.42, blue: 0.18),
                Color(red: 0.84, green: 0.77, blue: 0.06)
            ], startPoint: .top, endPoint: .bottom)
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
