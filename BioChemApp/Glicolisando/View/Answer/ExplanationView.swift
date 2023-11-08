//
//  ExplanationView.swift
//  BioChemApp
//
//  Created by Ian Pacini on 07/11/23.
//

import SwiftUI

struct ExplanationView: View {
    @ObservedObject var questionViewModel: QuestionViewModel
    
    let question: Question
    
    let buttonColor: Color = Color(red: 255/255, green: 224/255, blue: 176/255)
    let buttonStrokeColor: Color = Color(red: 156/255, green: 98/255, blue: 27/255)

    init(questionViewModel: QuestionViewModel) {
        self.questionViewModel = questionViewModel
        self.question = questionViewModel.currentQuestion!
    }

    var body: some View {
        ZStack {
            Color(red: 240/255, green: 179/255, blue: 106/255).ignoresSafeArea(.all)
            
            VStack {
                HStack(alignment: .top) {
                    Spacer()
                    Text(question.question.capitalizedSentence)
                        .font(.title)
                        .frame(minHeight: 100)
                        .padding(10)
                        .padding(.vertical, 10)
                    Spacer()
                }
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(buttonColor)
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 5)
                            .padding(2)
                            .foregroundStyle(buttonStrokeColor)
                    }
                    .padding(.bottom, 20)
                VStack {
                    Text("Resposta:")
                        .font(.headline)
                    VStack {
                        HStack(alignment: .top) {
                            Spacer()
                            Text(question.correctAnswer.capitalizedSentence)
                                .font(.title3)
                                .bold()
                                .padding(.vertical, 20)
                            Spacer()
                        }
                        Text("Por que?")
                            .font(.headline)
                            .padding(.bottom, 8)
                        Text(question.explanation.capitalizedSentence)
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 50)
                    }
                    .padding(.horizontal, 14)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(buttonColor)
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 5)
                            .padding(2)
                            .foregroundStyle(buttonStrokeColor)
                    }
                    .padding(.bottom, 20)
                }
                Spacer()
            }
            .padding(.top, 50)
            .padding(.horizontal, 20)
        }
        .navigationTitle(question.subject.rawValue.capitalized)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ExplanationView(questionViewModel: .init())
}
