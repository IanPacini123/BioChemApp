//
//  RouletteView.swift
//  BioChemApp
//
//  Created by Ian Pacini on 06/11/23.
//

import SwiftUI

struct RouletteView: View {
    @ObservedObject var questionViewModel: QuestionViewModel
    
    @Binding var navigationPath: NavigationPath
    
    @State var rotation: Double = 0
    @State var rotationTime: Double = 0.01
    @State var isStopping: Bool = false
    @State var didStop: Bool = false
    @State var rotationAmmount: Double = 5
    @State var isTextBig: Bool = false
    
    @State var randomModifier: Double = Double(Int.random(in: 1...360))
    @State var leaveAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color(red: 240/255, green: 179/255, blue: 106/255).ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                Text("Responda uma pergunta sobre o tema que sortear!")
                    .font(.custom("CoffeCake", size: 30))
                    .padding(10)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                Text("Pontuação: \(questionViewModel.score)")
                    .padding(.bottom, 30)
                    .font(.title3)
                    .bold()
                ZStack {
                    Image("Roulette")
                        .rotationEffect(Angle(degrees: rotation + randomModifier))
                    Image("Indicator")
                        .offset(y: -130)
                    Text("Clique para parar a roleta!")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.black)
                        .offset(y: 170)
                        .scaleEffect(isTextBig ? 1.1 : 1)
                        .animation(.easeInOut(duration: 1).repeatForever(), value: isTextBig)
                        .onAppear {
                            isTextBig.toggle()
                        }
                }
                .onTapGesture {
                    isStopping = true
                    rotationAmmount = 3
                }
                .onReceive(Timer.publish(every: rotationTime, on: .main, in: .common).autoconnect(), perform: { _ in
                    if rotationTime < 0.056 {
                        rotation += rotationAmmount
                        if isStopping {
                            slowDown()
                        }
                    } else {
                        didStop = true
                    }
                })
                .onChange(of: didStop) { _ in
                    sleep(UInt32(1.0))
                    questionViewModel.setRandomQuestionFromRotation((rotation + randomModifier))
                    navigationPath.append(ScreenDestinationEnum.Question)
                }
                Spacer()
            }
            .padding(.bottom, 100)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                resetRoulette()
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {leaveAlert.toggle()}, label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Sair")
                        }
                    })
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
    }

    private func resetRoulette() {
        self.rotation = 0
        self.rotationTime = 0.01
        self.isStopping = false
        self.didStop = false
        self.rotationAmmount = 5
        self.randomModifier = Double(Int.random(in: 1...360))

        var newNavigationPath = NavigationPath()
        newNavigationPath.append(ScreenDestinationEnum.Roulette)
        navigationPath = newNavigationPath
    }
    
    func slowDown() {
        rotationTime += rotationTime/100
    }
}

#Preview {
    NavigationStack {
        RouletteView(questionViewModel: .init(), navigationPath: .constant(.init()))
    }
}
