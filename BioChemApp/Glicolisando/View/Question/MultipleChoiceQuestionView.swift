//
//  MultipleChoiceQuestionView.swift
//  BioChemApp
//
//  Created by Ian Pacini on 06/11/23.
//

import SwiftUI

struct MultipleChoiceQuestionView: View {
    @Binding var answer: String?

    let question: MultipleChoiceQuestion

    let buttonColor: Color = Color(red: 255/255, green: 224/255, blue: 176/255)
    let buttonStrokeColor: Color = Color(red: 163/255, green: 111/255, blue: 49/255)
    
    var body: some View {
        VStack(spacing: 20) {
            createOption(question.choiceA.capitalizedSentence)
            createOption(question.choiceB.capitalizedSentence)
            createOption(question.choiceC.capitalizedSentence)
            createOption(question.choiceD.capitalizedSentence)
            createOption(question.choiceE.capitalizedSentence)
        }
    }

    fileprivate func createOption(_ option: String) -> some View {
        return Button(action: {answer = option}, label: {
            HStack {
            Spacer()
            Text(option.capitalized)
                .font(.headline)
                .frame(minWidth: 120)
                .padding(20)
                .foregroundStyle(.black)
            Spacer()
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(buttonColor)
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 4)
                .padding(2)
                .foregroundStyle(buttonStrokeColor)
                .opacity(0.7)
        }
        })
    }
}

#Preview {
    MultipleChoiceQuestionView(answer: .constant(nil), question: MultipleChoiceQuestion(subject: .glicogenese,
                                                                question: "TESTEEEE EEEEEEEE EEEEEEEE EEEEEEE E EEE E EEEEEEEEEEEEEEEEEEEEEEEEEE EEEEEEEEEEEE EEEEEEEEEEEE", 
                                                                                        correctAnswer: "AAA", explanation: "",
                                                                choiceA: "AAA",
                                                                choiceB: "BBB",
                                                                choiceC: "CCC",
                                                                choiceD: "DDD",
                                                                choiceE: "EEE"))
}
