//
//  mainQuiz.swift
//  quizMobile
//
//  Created by StudentAM on 4/12/24.
//

import SwiftUI

struct Question { // create a model of a quesion
    var question : String
    var options: [String]
    var answer: String
}

struct mainQuiz: View {
    @State private var questions = [ // store 10 questions and all the options in here
        Question(question: "The Brown Recluse is a venomous creature, but what is it?", options: ["Spider, Snake, Scorpion, Frog"], answer: "Spider"),
        Question(question: "Shiba Inus are small hunting dogs native to which country?", options: ["China, Uzbekistan, Japan, France"], answer: "Japan"),
        Question(question: "What is the largest living species of lizard?", options: ["Malayan water monitor, Tree crocodile, Perentie, Komodo dragon"], answer: "Komodo dragon"),
        Question(question: "In the wild, Siberian tigers eat all of these, EXCEPT:", options: ["Pikas, Elk, Dik-diks, Bears"], answer: "Dik-diks"),
        Question(question: "The name caracal comes from a Turkish word meaning:", options: ["Royal cat, Black ears, Sharp tooth, Golden lynx"], answer: "Black ears"),
        Question(question: "Starfish primarily eat:", options: ["Sand worms, Mollusks, Algae, Tuna"], answer: "Mollusks"),
        Question(question: "How are platypuses are different from most other mammals?", options: ["They are cold-blooded, They have gills, They have pouches, They lay eggs"], answer: "They lay eggs"),
        Question(question: "Wolverines are a kind of:", options: ["Skunk, Wolf, Bear, Weasel"], answer: "Weasel"),
        Question(question: "The name narwhal derives from the old Norse word nar, which means:", options: ["Whale, Corpse, Horn, Fish"], answer: "Corpse"),
        Question(question: "How do toucans sleep?", options: ["Standing up, Hanging upside down, Climbing, Laying"], answer: "Hanging upside down")
    ]
    @State private var score = 0
    @State var index = 0
    var body: some View {
        ZStack {
            Image("quizBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(questions[index].question)
                    .background(.white)
                    .padding(10)
                    .frame(width: 400, height: 500, alignment: .center)
            }
        }
    }
}

#Preview {
    mainQuiz()
}
