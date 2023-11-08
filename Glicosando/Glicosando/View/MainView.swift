//
//  MainView.swift
//  BioChemApp
//
//  Created by Ian Pacini on 06/11/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var currentViewModel: QuestionViewModel = QuestionViewModel()

    @State var highscore: Int = (UserDefaultsHelper.get(key: .highscore) as? Int ?? 0)
    @Binding var navigationPath: NavigationPath

    let buttonColor: Color = Color(red: 255/255, green: 224/255, blue: 176/255)
    let buttonStrokeColor: Color = Color(red: 163/255, green: 111/255, blue: 49/255)

    var body: some View {
        ZStack {
            Color(red: 240/255, green: 179/255, blue: 106/255).ignoresSafeArea(.all)

            VStack {
    
                Text("Glicolizando!")
                    .font(.custom("CoffeCake", size: 60))
                    .padding(.vertical, 160)

                Text("Recorde de questoes: \(highscore)")
                    .font(.custom("CoffeCake", size: 24))
                    .bold()
                    .foregroundStyle(.black)

                NavigationLink(value: ScreenDestinationEnum.Roulette, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 250, height: 90)
                            .foregroundStyle(buttonColor)
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                            .frame(width: 235, height: 75)
                            .foregroundStyle(.white)
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .frame(width: 250, height: 90)
                            .foregroundStyle(buttonStrokeColor)
                        Text("Novo Jogo!")
                            .font(.custom("CoffeCake", size: 40))
                            .bold()
                            .foregroundStyle(.black)
                    }
                })
                .navigationDestination(for: ScreenDestinationEnum.self) { destination  in
                    switch destination {
                    case .Roulette:
                        RouletteView(questionViewModel: currentViewModel, navigationPath: $navigationPath)
                    case .Question:
                        QuestionView(questionViewModel: currentViewModel, navigationPath: $navigationPath)
                    case .Explanation:
                        ExplanationView(questionViewModel: currentViewModel)
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            highscore = (UserDefaultsHelper.get(key: .highscore) as? Int ?? 0)
        }
    }
}

#Preview {
    NavigationStack {
        MainView(navigationPath: .constant(.init()))
    }
}
