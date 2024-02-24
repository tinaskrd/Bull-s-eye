//
//  CustomButtonStyles.swift
//  BullsEyeSwiftUI
//
//  Created by Tina  on 24.02.24.
//

import Foundation
import SwiftUI

struct GoldenButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 100, height: 37)
            .font(.custom("Arial Rounded MT Bold", size: 20))
            .foregroundStyle(Color(red: 96, green: 30, blue: 0))
            .shadow(color: .white, radius: 10)
            .background(configuration.isPressed ? Image("icButtonNormal") .resizable()
                .scaledToFill() : Image("icButtonHighlighted")
                .resizable()
                .scaledToFill()
            )
        
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct SmallButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 32, height: 32)
            .background(
                Image("icSmallButton")
                    .resizable()
                    .scaledToFill()
            )
    }
}
