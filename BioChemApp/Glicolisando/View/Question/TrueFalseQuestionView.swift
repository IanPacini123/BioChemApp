//
//  TrueFalseQuestionView.swift
//  BioChemApp
//
//  Created by Ian Pacini on 06/11/23.
//

import SwiftUI

struct TrueFalseQuestionView: View {
    @Binding var answer: String?
    let question: TrueFalseQuestion

    let buttonColor: Color = Color(red: 255/255, green: 224/255, blue: 176/255)
    var body: some View {
        HStack(spacing: 15) {
            createOption("Verdadeiro")
            createOption("Falso")
        }
    }

    fileprivate func createOption(_ option: String) -> some View {
        return Button(action: {answer = option}, label: {
            Text(option)
                .font(.title3)
                .foregroundStyle(.black)
                .frame(minWidth: 120)
                .padding(20)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(buttonColor)
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 5)
                        .padding(2)
                        .foregroundStyle(option == "Falso" ? .red : .green)
                        .opacity(0.3)
                }
        })
    }
}

#Preview {
    TrueFalseQuestionView(answer: .constant(nil), question: TrueFalseQuestion(subject: .glicolise,
                                                      question: "TESTEEEEEEEEEEEEEEEEEEEEEEEEEE EEEEEEEE EEEEE EEE EEEEEEEEEEEEEEE EEEEEEEEE EEEEEEEEEEEEE EEEEEEEEEEEEE EEEEEEE",
                                                                              correctAnswer: "AAA", explanation: ""))
}
