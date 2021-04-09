//
//  Game.swift
//  WordMatch
//
//  Created by Beau Nouvelle on 8/4/21.
//

import Foundation

class Game {

    var questions: [Question]
    
    init() {
        questions = [Question(answer: .nissan, options: Car.allCases)]
        print(questions)
    }
    
    func nextQuestion() -> Question {
        return questions.removeFirst()
    }
    
}
