//
//  QuestionViewModel.swift
//  BioChemApp
//
//  Created by Ian Pacini on 07/11/23.
//

import SwiftUI

class QuestionViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentQuestion: Question?
    @Published var score: Int = 0

    init() {
        self.questions = questionsBacklog
    }

    func getSubjectFromRoulette(degrees: Double) -> Subjects {
        let actualRotation = degrees.truncatingRemainder(dividingBy: 360)
        if actualRotation <= 36 {
            return Subjects.gliconeogenese
        } else if actualRotation <= 108 {
            return Subjects.glicogenese
        } else if actualRotation <= 180 {
            return Subjects.glicogenio
        } else if actualRotation <= 252 {
            return Subjects.glicolise
        } else if actualRotation <= 324 {
            return Subjects.glicose
        } else {
            return Subjects.gliconeogenese
        }
    }

    func isAnswerCorrect(_ question: Question, _ answer: String) -> Bool {
        return answer.capitalized == question.correctAnswer.capitalized
    }
    
    func checkForAnswer(_ question: Question, _ answer: String) {
        if answer.capitalized == question.correctAnswer.capitalized {
            score += 1
            checkForHighscore(currentScore: score)
            removeCorrectQuestion(question: question)
        }
    }

    func checkForHighscore(currentScore: Int) {
        let highscore = UserDefaultsHelper.get(key: .highscore) as? Int ?? 0

        if currentScore > highscore {
            UserDefaultsHelper.set(value: currentScore, forKey: .highscore)
        }
    }

    func getRandomQuestionFromSubject(_ subject: Subjects) -> Question {
        let filteredQuestions = questions.filter({$0.subject == subject})

        if let randomQuestion = filteredQuestions.randomElement() {
            return randomQuestion
        }

        self.reloadQuestionsFromSubject(subject)

        return getRandomQuestionFromSubject(subject)
    }

    func reloadQuestionsFromSubject(_ subject: Subjects) {
        let filteredQuestions = questionsBacklog.filter({$0.subject == subject})

        self.questions.append(contentsOf: filteredQuestions)
    }

    func setRandomQuestionFromRotation(_ rotation: Double) {
        self.currentQuestion = getRandomQuestionFromSubject(getSubjectFromRoulette(degrees: rotation))
    }

    func removeCorrectQuestion(question: Question) {
        self.questions.removeAll(where: {$0.question == question.question})
    }
}
