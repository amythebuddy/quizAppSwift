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
    @State private var score = 0
    @State private var selectedOption: String?
    @State private var showAnswer = false
    @State private var isNextBtnVisible = false
    @State var index = 0
    var body: some View {
        ZStack {
            Image("quizBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Score: \(score)") //display score
                    .foregroundColor(.white)
                    .font(.system(size: 30))
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
                        selectedOption = option
                        checkAnswers(selectedOptions: option) // check if the selected option is correct
                        isNextBtnVisible = true // show the next button
                    })
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .frame(width: 300, height: 60)
                        // If showAnswer is false, the expression results in Color.white, meaning no answer has been selected yet
                        //If the option is the correct answer, it returns Color.green, making the background of the button green.
                        // else if it is not the correct answer, it evaluates the next nested condition.
                        .background(showAnswer ? (option == questions[index].answer ? Color.green :
                                                    (option == selectedOption ? Color.red : Color.red)
                                                 ) : Color.white)
                        .border(Color.black, width: 5)
                        .padding(5)
                        .cornerRadius(10)
                        .disabled(isNextBtnVisible)
                    
                }
                if isNextBtnVisible { // if it becomes true, the next button shows up
                    Button("Next", action: {
                        index += 1
                        showAnswer = false
                        selectedOption = nil
                        isNextBtnVisible = false
                    })
                }
                Spacer()
            }
        }
    }
    func checkAnswers(selectedOptions: String){
        if selectedOptions == questions[index].answer{ // if the user clicks on the right one, add score
            score += 1
            showAnswer = true
        } else {
            showAnswer = false
        }
    }
}

#Preview {
    mainQuiz()
}
