//
//  ContentView.swift
//  BullsEyeSwiftUI
//
//  Created by Tina  on 23.02.24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var sliderValue: Float = 50
    @State private var target = Int.random(in: 1...100)
    @State private var score = 0
    @State private var points = 0
    @State private var round = 0
    
    var body: some View {
        ZStack {
            Image("icBackground")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity,minHeight: 0, maxHeight: .infinity)
                .clipped()
                .ignoresSafeArea(.all)
            
            VStack(alignment: .center, spacing: 50) {
                HStack{
                    Label("Put the Bull's Eye as close as you can to:", systemImage: "")
                        .labelStyle(.titleOnly)
                    Label("\(target)", systemImage: "")
                        .labelStyle(.titleOnly)
                }
                HStack {
                    Label("1", systemImage: "")
                        .labelStyle(.titleOnly)
                    Slider(value: $sliderValue, in: 1...100)
                        .onChange(of: sliderValue){ value in
                            print("New value \(lroundf(sliderValue))")
                        }
                    Label("100", systemImage: "")
                        .labelStyle(.titleOnly)
                }
                HStack {
                    Button("Hit me") {
                        print("Button Hit")
                        points = 100 - calculateDifference()
                        showAlert = true
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(alertTitle(difference: calculateDifference())), message: Text("You scored: \(points)!"), dismissButton: .default(Text("OK"), action: {
                            startNewRound()
                        }))
                    }
                }
                HStack(alignment: .center, spacing: 300) {
                    HStack(alignment: .center, spacing: 50) {
                        Button("Start Over") {
                            print("Start Over button hit")
                            startOver()
                        }
                        HStack {
                            Label("Score:", systemImage: "")
                                .labelStyle(.titleOnly)
                            Label("\(score)", systemImage: "")
                                .labelStyle(.titleOnly)
                        }
                    }
                    HStack(alignment: .center, spacing: 50) {
                        HStack {
                            Label("Round:", systemImage: "")
                                .labelStyle(.titleOnly)
                            Label("\(round)", systemImage: "")
                                .labelStyle(.titleOnly)
                        }
                        Button(action: {
                            print("Info button tapped")
                        }) {
                            Image(systemName: "info.circle")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            
        }
    }
}

// MARK: - Helper functions
extension ContentView {
    private func startNewRound() {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        sliderValue = 50
    }
    
    private func alertTitle(difference: Int) -> String {
        var title = ""
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        return title
    }
    
    private func calculateDifference() -> Int {
        let currentValue = lroundf(sliderValue)
        
        var difference = currentValue - target
        if difference < 0 {
            difference = abs(target - currentValue)
        }
        return difference
    }
    
    private func startOver() {
        score = 0
        round = -1
        points = 0
        startNewRound()
        
    }
}

#Preview {
    ContentView()
}
