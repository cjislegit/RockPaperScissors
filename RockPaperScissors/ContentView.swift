//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Carlos Ramirez on 5/8/26.
//

import SwiftUI

struct ContentView: View {
    @State var currentChoice = ["rock", "paper", "scissors"].shuffled()
    @State var win = Bool.random()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
