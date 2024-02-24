//
//  InfoView.swift
//  BullsEyeSwiftUI
//
//  Created by Tina  on 24.02.24.
//

import SwiftUI

struct InfoView: View {
    //@Binding var isPresented: Bool
    var body: some View {
        ZStack {
            Image("icBackground")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity,minHeight: 0, maxHeight: .infinity)
                .clipped()
                .ignoresSafeArea(.all)
            VStack() {
                if let url = Bundle.main.url(forResource: "bullEye", withExtension: "html") {
                    WebView(url: url)
                }
                Button(action: {
                    // isPresented = false
                }) {
                    Text("Close")
                }
                
            }
        }
    }
}

//#Preview {
//    @State var isPresent = true
//    InfoView()
//}
