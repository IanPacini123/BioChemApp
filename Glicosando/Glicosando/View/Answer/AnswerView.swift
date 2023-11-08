//
//  AnswerView.swift
//  BioChemApp
//
//  Created by Ian Pacini on 07/11/23.
//

import SwiftUI

struct AnswerView: View {
    let answerCorrect: Bool

    let buttonColor: Color = Color(red: 255/255, green: 224/255, blue: 176/255)
    let buttonStrokeColor: Color = Color(red: 215/255, green: 160/255, blue: 80/255)

    var body: some View {
        VStack(spacing: 20) {
            if answerCorrect {
                Text("Resposta")
                    .font(.custom("CoffeCake", size: 60))
                Text("Correta!")
                    .font(.custom("CoffeCake", size: 40))
                    .foregroundStyle(.green)
                    .opacity(0.7)
                NavigationLink(value: ScreenDestinationEnum.Explanation) {
                    Text("Ver Explicação")
                }
            } else {
                Text("Resposta")
                    .font(.custom("CoffeCake", size: 60))
                Text("Errada!")
                    .font(.custom("CoffeCake", size: 40))
                    .foregroundStyle(.red)
                    .opacity(0.7)
                NavigationLink(value: ScreenDestinationEnum.Explanation) {
                    Text("Ver Explicação")
                }
            }
        }
        .padding(24)
        .navigationBarBackButtonHidden(true)
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(buttonColor)
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 10)
                    .padding(2)
                    .foregroundStyle(buttonStrokeColor)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AnswerView(answerCorrect: false)
    }
}
        
