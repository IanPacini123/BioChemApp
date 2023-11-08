//
//  QuestionView.swift
//  BioChemApp
//
//  Created by Ian Pacini on 06/11/23.
//

import SwiftUI

struct QuestionView: View {
    @ObservedObject var questionViewModel: QuestionViewModel

    @State var answer: String?
    @State var didAnswer: Bool = false
    @State var leaveAlert: Bool = false
    @Binding var navigationPath: NavigationPath

    var question: Question {
        questionViewModel.currentQuestion!
    }
    
    let buttonColor: Color = Color(red: 255/255, green: 224/255, blue: 176/255)
    let buttonStrokeColor: Color = Color(red: 156/255, green: 98/255, blue: 27/255)
    
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
                if question.questionType == .multipleChoice {
                    MultipleChoiceQuestionView(answer: $answer, question: question as! MultipleChoiceQuestion)
                } else {
                    TrueFalseQuestionView(answer: $answer, question: question as! TrueFalseQuestion)
                        .padding(.vertical, 100)
                        .padding(.bottom, 50)
                }
            }
            .padding(20)
            if didAnswer {
                answerPopUp
            }
        }
        .navigationTitle(question.subject.rawValue.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(!didAnswer)
        .onChange(of: answer ?? "") { answer in
            if answer != "" {
                didAnswer.toggle()
                questionViewModel.checkForAnswer(question, answer)
            }
        }
        .toolbar(content: {
            if !didAnswer {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {leaveAlert.toggle()}, label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Sair")
                        }
                    })
                }
            }
        })
        .alert("Deseja sair?", isPresented: $leaveAlert) {
            Button("Continuar", role: .cancel) { }
            Button("Sair", role: .destructive) {
                navigationPath = NavigationPath()
            }
        } message: {
            Text("Tem certeza que deseja parar? Seu progresso será perdido, mas seu recorde ficará salvo.")
        }
    }

    var answerPopUp: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
                .opacity(0.7)
            VStack {
                Spacer()
                AnswerView(answerCorrect: questionViewModel.isAnswerCorrect(question, answer!))
                Spacer()
            }
        }
    }
}
//
//#Preview {
//    NavigationStack {
//        QuestionView(questionViewModel: .init(), navigationPath: .constant(.init()))
//    }
//}
//
//#Preview(body: {
//    NavigationStack {
//        QuestionView(questionViewModel: .init(), navigationPath: .constant(.init()))
//    }
//})
