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
                VStack(spacing: 200) {
                    Text("Quiz Time")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                    NavigationLink(destination: mainQuiz(), label: {Text("Begin")})
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                        .frame(width: 250, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
