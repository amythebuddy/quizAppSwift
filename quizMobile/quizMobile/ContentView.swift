//
//  ContentView.swift
//  quizMobile
//
//  Created by StudentAM on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("quizBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Quiz Time")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .padding(.bottom, 50)
                    NavigationLink(destination: mainQuiz(), label: {Text("Animal Quiz")}) //go to the animal quiz
                        .foregroundColor(.black)
                        .font(.system(size: 40))
                        .frame(width: 300, height: 200)
                        .background(
                            Image("shibaInu")
                                .resizable()
                        )
                        .cornerRadius(10)
                        .padding()
                    NavigationLink(destination: historyQuiz(), label: {Text("History Quiz")})//go to the history quiz
                        .foregroundColor(.black)
                        .font(.system(size: 40))
                        .frame(width: 300, height: 200)
                        .background(
                            Image("history")
                                .resizable()
                        )
                        .padding()
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
