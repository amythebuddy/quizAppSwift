//
//  historyQuiz.swift
//  quizMobile
//
//  Created by StudentAM on 4/17/24.
//

import SwiftUI


struct historyQuiz: View {
    @State private var questions = [ // store 10 questions and all the options in here
        Question(question: "1. The United States bought Alaska from which country?", options: ["Canada", "Mexico", "China", "Russia"], answer: "Russia"),
        Question(question: "2. Where did the Industrial Revolution begin?", options: ["United States", "France", "Great Britain", "Germany"], answer: "Great Britain"),
        Question(question: "3. Which country was the first to grant women the right to vote?", options: ["United States", "New Zealand", "United Kingdom", "France"], answer: "New Zealand"),
        Question(question: "4. What event marked the beginning of World War II?", options: ["Invasion of Poland by Germany", "Bombing of Pearl Harbor", "Assassination of Archduke Franz Ferdinand", "The signing of the Treaty of Versailles"], answer: "Invasion of Poland by Germany"),
        Question(question: "5. What was the deadliest pandemic in history?", options: ["The Spanish Flu", "The Plague of Justinian", "The HIV/AIDS pandemic", "The Black Death"], answer: "The Black Death"),
        Question(question: "6. During which century did the Renaissance begin?", options: ["14th Century", "15th Century", "16th Century", "17th Century"], answer: "14th Century"),
        Question(question: "7. What year did the Berlin Wall fall?", options: ["1987", "1989", "1991", "1993"], answer: "1989"),
        Question(question: "8. Which war is often called “The Forgotten War”?", options: ["The Vietnam War", "World War I", "The Gulf War", "The Korean War"], answer: "The Korean War"),
        Question(question: "9. What was the original purpose of the Great Wall of China?", options: ["To prevent invasions and raids from nomadic tribes", "To mark the boundary of the empire", "As a trade route", "As a symbol of power"], answer: "To prevent invasions and raids from nomadic tribes"),
        Question(question: "10. Which ancient civilization built the Machu Picchu complex?", options: ["The Aztecs", "The Mayans", "The Incas", "The Olmecs"], answer: "The Incas")
    ]
    @State var score = 0
    @State private var showAnswer = false
    @State private var isNextBtnVisible = false
    @State var index = 0
    @State var amountOfCurrentQuestion = 0 // to track how many questions has the user answered
    var body: some View {
        NavigationView {
            ZStack{
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
                            if amountOfCurrentQuestion == questions.count {// if the user reach the last question
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
                    if amountOfCurrentQuestion == questions.count {
                        NavigationLink(destination: endScreen(score: score), label: { // create a new navigationLink that has Next
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
    historyQuiz()
}
