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
        Question(question: "1. The Brown Recluse is a venomous creature, but what is it?", options: ["Spider", "Snake", "Scorpion", "Frog"], answer: "Spider"),
        Question(question: "2. Shiba Inus are small hunting dogs native to which country?", options: ["China", "Uzbekistan", "Japan", "France"], answer: "Japan"),
        Question(question: "3. What is the largest living species of lizard?", options: ["Malayan water monitor", "Tree crocodile", "Perentie", "Komodo dragon"], answer: "Komodo dragon"),
        Question(question: "4. In the wild, Siberian tigers eat all of these, EXCEPT:", options: ["Pikas", "Elk", "Dik-diks", "Bears"], answer: "Dik-diks"),
        Question(question: "5. The name caracal comes from a Turkish word meaning:", options: ["Royal cat", "Black ears", "Sharp tooth", "Golden lynx"], answer: "Black ears"),
        Question(question: "6. Starfish primarily eat:", options: ["Sand worms", "Mollusks", "Algae", "Tuna"], answer: "Mollusks"),
        Question(question: "7. How are platypuses are different from most other mammals?", options: ["They are cold-blooded", "They have gills", "They have pouches", "They lay eggs"], answer: "They lay eggs"),
        Question(question: "8. Wolverines are a kind of:", options: ["Skunk", "Wolf", "Bear", "Weasel"], answer: "Weasel"),
        Question(question: "9. The name narwhal derives from the old Norse word nar, which means:", options: ["Whale", "Corpse", "Horn", "Fish"], answer: "Corpse"),
        Question(question: "10. How do toucans sleep?", options: ["Standing up", "Hanging upside down", "Climbing", "Laying"], answer: "Hanging upside down")
    ]
    @State var score = 0
    @State private var showAnswer = false
    @State private var isNextBtnVisible = false
    @State var index = 0
    @State var amountOfCurrentQuestion = 0 // to track how many questions has the user answered
    var body: some View {
        NavigationView {
            ZStack {
                Image("quizBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Score: \(score)") //display score
                        .foregroundColor(.red)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding(.top, 70)
                    Text(questions[index].question) // display question
                        .padding()
                        .font(.system(size: 25))
                        .frame(width: 350, height: 200, alignment: .center)
                        .background(.white)
                        .border(Color.black, width: 4)
                        .cornerRadius(10)
                    ForEach(questions[index].options, id: \.self) { option in // display each option as a button
                        Button(option, action: {
                            amountOfCurrentQuestion += 1
                            checkAnswers(selectedOptions: option) // check if the selected option is correct
                            if amountOfCurrentQuestion == questions.count { // if the user reach the last question
                                isNextBtnVisible = false // hide the next button
                            } else {
                                isNextBtnVisible = true // show the next button
                            }
                        })
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .frame(width: 300, height: 60)
                            // if showAnswer is false, the button is in white, meaning no answer has been selected yet
                            // if the option is the correct answer, it returns green, making the background of the button green.
                            // else if it is not the correct answer, it returns red.
                            .background(showAnswer ? (option == questions[index].answer ? Color.green : Color.red) : Color.white)
                            .border(Color.black, width: 5)
                            .padding(5)
                            .cornerRadius(10)
                            .disabled(isNextBtnVisible) // all buttons are disabled when isNextBtnVisible are true
                        
                    }
                    if amountOfCurrentQuestion == questions.count { // if the user reach the last question
                        NavigationLink(destination: endScreen(score: score), label: {  // create a new navigationLink that has Next
                            Text("Next")
                                .frame(width: 150, height: 40)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.top, 30)
                        })
                    }
                    if isNextBtnVisible { // if it becomes true, the next button shows up
                        Button("Next", action: {
                            index += 1
                            showAnswer = false // don't let the buttons show answer
                            isNextBtnVisible = false // make the isNextBtnVisible disappeared
                        })
                        .frame(width: 150, height: 40)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top, 30)
                    }
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    func checkAnswers(selectedOptions: String){
        if selectedOptions == questions[index].answer{ // if the user clicks on the right one, add score
            score += 1
        }
        showAnswer = true
    }
}

#Preview {
    mainQuiz()
}
