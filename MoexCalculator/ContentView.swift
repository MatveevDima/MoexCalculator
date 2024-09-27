//
//  ContentView.swift
//  MoexCalculator
//
//  Created by Александр Матвеев on 26.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State var color = Color.green                  // 1
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            Text("Привет, Практикум!")
                .padding()
                .foregroundColor(color)      // 2
            Button("Нажми здесь!") {         // 3
                if color == .green {
                    color = .orange
                } else {
                    color = .green
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
