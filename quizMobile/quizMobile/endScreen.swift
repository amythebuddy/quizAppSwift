//
//  endScreen.swift
//  quizMobile
//
//  Created by StudentAM on 4/16/24.
//

import SwiftUI

struct endScreen: View {
    @State var score: Int
    var body: some View {
        NavigationView {
            ZStack{
                Image("quizBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Great Job!")
                        .font(.system(size: 50))
                        .padding()
                        .foregroundColor(.white)
                        .background(.purple)
                        .cornerRadius(10)
                    Text("You got \(score) out of 10")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .font(.system(size: 40))
                        .background(.purple)
                        .cornerRadius(10)
                    NavigationLink(destination: ContentView(), label: { Text("Play Again") })
                        .foregroundColor(.white)
                        .frame(width: 250)
                        .padding()
                        .font(.system(size: 50))
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    endScreen(score: 9)
}
