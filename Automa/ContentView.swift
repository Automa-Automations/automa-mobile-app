//
//  ContentView.swift
//  Automa
//
//  Created by Simon Ferns on 2024/04/23.
//

import SwiftUI 

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Image("TutorialImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("HI")
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
