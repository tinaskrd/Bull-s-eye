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
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            HStack{
                Label("Put the Bull's Eye as close as you can to:", systemImage: "")
                    .labelStyle(.titleOnly)
                Label("100", systemImage: "")
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
                    showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Hello World"), message: Text("The value of the slider is \(lroundf(sliderValue)).The target value is \(target)"), dismissButton: .default(Text("OK"), action: {
                        startNewRound()
                    }))
                }
            }
            HStack(alignment: .center, spacing: 300) {
                HStack(alignment: .center, spacing: 50) {
                    Button("Start Over") {
                        print("Button hit")
                    }
                    HStack {
                        Label("Score:", systemImage: "")
                            .labelStyle(.titleOnly)
                        Label("999", systemImage: "")
                            .labelStyle(.titleOnly)
                    }
                }
                HStack(alignment: .center, spacing: 50) {
                    HStack {
                        Label("Round:", systemImage: "")
                            .labelStyle(.titleOnly)
                        Label("999", systemImage: "")
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

extension ContentView {
    private func startNewRound() {
        target = Int.random(in: 1...100)
        sliderValue = 50
    }
}

#Preview {
    ContentView()
}
