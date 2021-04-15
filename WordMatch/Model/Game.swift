//
//  Game.swift
//  WordMatch
//
//  Created by Beau Nouvelle on 8/4/21.
//

import Foundation
import AVFoundation

protocol GameDelegate: AnyObject {
    func gameOver()
    func nextQuestion()
    func scoreUpdated(score: Int)
}

class Game {
     
    weak var delegate: GameDelegate?
    var currentQuestion: Question?
    var questions: [Question] = []
    var score: Int = 0
    var numberOfQuestions = 0
    
    func newGame() {
        score = 0
        questions = Car.allCases.shuffled().map {
            Question(answer: $0, options: Car.allCases.shuffled())
        }
        numberOfQuestions = questions.count
        nextQuestion()
        delegate?.scoreUpdated(score: 0)
    }
    
    func userChose(option: Car) {
        if option == currentQuestion?.answer {
            score += 1
            delegate?.scoreUpdated(score: score)
            nextQuestion()
            AudioServicesPlaySystemSound(1001)
        } else {
            nextQuestion()
            AudioServicesPlaySystemSound(1002)
        }
    }
    
    func nextQuestion() {
        guard questions.count > 0 else {
            delegate?.gameOver()
            return
        }
        currentQuestion = questions.removeFirst()
        delegate?.nextQuestion()
    }
    
}

