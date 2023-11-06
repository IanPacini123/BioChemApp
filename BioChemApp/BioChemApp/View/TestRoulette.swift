//
//  TestRoulette.swift
//  BioChemApp
//
//  Created by Ian Pacini on 06/11/23.
//

import SwiftUI

enum RouletteCases: String, CaseIterable {
    case glicolise, glicogenese, gliconeogenese
}

struct TestRoulette: View {
    @State var rotation: Double = 0
    @State var rotationTime: Double = 0.005
    @State var isStopping: Bool = false
    @State var didStop: Bool = false
    var body: some View {
            ZStack {
                Image("Roulette")
                    .rotationEffect(Angle(degrees: rotation))
                Rectangle()
                    .frame(width: 5, height: 50)
                    .offset(y: -120)
                    .foregroundStyle(.yellow)
            }
            .onTapGesture {
                isStopping = true
            }
            .onReceive(Timer.publish(every: rotationTime, on: .main, in: .common).autoconnect(), perform: { _ in
                if rotationTime < 0.09 {
                    rotation += 5
                    if isStopping {
                        slowDown()
                    }
                } else {
                    didStop = true
                }
            })
        .onChange(of: didStop) { _ in
            let actualRotation = rotation.truncatingRemainder(dividingBy: 360)
            if actualRotation <= 60 {
                print(RouletteCases.glicolise.rawValue)
            } else if actualRotation <= 180 {
                print(RouletteCases.gliconeogenese.rawValue)
            } else if actualRotation <= 300 {
                print(RouletteCases.glicogenese.rawValue)
            } else {
                print(RouletteCases.glicolise.rawValue)
            }
        }
    }

    func slowDown() {
        rotationTime += rotationTime/100
    }
}

#Preview {
    TestRoulette()
}
