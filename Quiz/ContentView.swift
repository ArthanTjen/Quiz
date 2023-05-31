//
//  ContentView.swift
//  Quiz
//
//  Created by Arthan Tjen on 31/5/23.
//

import SwiftUI

struct ContentView: View {
    
    let questions: [QuizQuestion] = [
        QuizQuestion(
            questionText: "What is the capital of France?",
            option1: "London",
            option2: "Paris",
            option3: "Singapore",
            option4: "Merlin"
        ),
        QuizQuestion(
            questionText: "Which planet is known as the Red Planet?",
            option1: "Venus",
            option2: "Mars",
            option3: "Jupiter",
            option4: "Saturn"
        ),
        QuizQuestion(
            questionText: "What is the largest ocean on Earth?",
            option1: "Indian Ocean",
            option2: "Pacific Ocean",
            option3: "Arctic Ocean",
            option4: "Atlantic Ocean"
        ),
        QuizQuestion(
            questionText: "Who painted the Mona Lisa?",
            option1: "Pablo Picasso",
            option2: "Leonardo da Vinci",
            option3: "Vincent van Gogh",
            option4: "Michelangelo"
        ), QuizQuestion(questionText: "Are you gae", option1: "yes", option2: "Ofc", option3: "Hell nah", option4: "pi")
    ]
    @State private var showAlert = false
    @State private var wasRight = false
    @State private var index = 0
    @State private var showSheet = false
    @State private var score = 0
    
    var body: some View {
        VStack {
            Text(questions[index].questionText)
                .padding()
            
            VStack {
                HStack {
                    
                    Button {
                        showAlert = true
                        wasRight = false
                    } label: {
                        Text(questions[index].option1)
                            .padding()
                    }
                    
                    Button {
                        showAlert = true
                        wasRight = true
                        score += 1
                    } label: {
                        Text(questions[index].option2)
                            .padding()
                    }
                    
                }
                HStack {
                    Button {
                        showAlert = true
                        wasRight = false
                    } label: {
                        Text(questions[index].option3)
                            .padding()
                    }
                    
                    Button {
                        showAlert = true
                        wasRight = false
                    } label: {
                        Text(questions[index].option4)
                            .padding()
                    }
                }
            }
        }
        .padding()
        .alert(wasRight ? "You got that right!!!" : "You got that wrong...", isPresented: $showAlert) {
            
            // one button to go to the next question
            Button("Next Question") {
                index += 1
                if index == questions.count {
                    showSheet = true
                    index = 0
                }
            }
            
        }
        .sheet(isPresented: $showSheet) {
            ScoreView(score: score, total: questions.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
