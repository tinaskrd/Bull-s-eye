//
//  ContentView.swift
//  BullsEyeSwiftUI
//
//  Created by Tina  on 23.02.24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var point: Double = 0
    
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
                Slider(value: $point, in: 1...100)
                Label("100", systemImage: "")
                    .labelStyle(.titleOnly)
            }
            HStack {
                Button("Hit me") {
                    print("Button Hit")
                }
            }
            HStack(alignment: .center, spacing: 300) {
                HStack {
                    Button("Start Over") {
                        print("Button hit")
                    }
                    Label("Score:", systemImage: "")
                        .labelStyle(.titleOnly)
                    Label("999", systemImage: "")
                        .labelStyle(.titleOnly)
                }
                HStack {
                    Label("Round:", systemImage: "")
                        .labelStyle(.titleOnly)
                    Label("999", systemImage: "")
                        .labelStyle(.titleOnly)
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

#Preview {
    ContentView()
}
