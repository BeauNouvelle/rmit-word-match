//
//  GameViewController.swift
//  WordMatch
//
//  Created by Beau Nouvelle on 8/4/21.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imageButtons: [UIButton]!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    let game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.delegate = self
        game.newGame()
    }
    
    @IBAction func imageButtonTapped(_ sender: UIButton) {
        guard let selectedOption = game.currentQuestion?.options[sender.tag] else {
            game.nextQuestion()
            return
        }
        game.userChose(option: selectedOption)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        sender.isHidden = true
        game.newGame()
        toggleImageButtonEnabled()
    }
    
    func toggleImageButtonEnabled() {
        for button in imageButtons {
            button.isEnabled = !button.isEnabled
        }
    }
    
}

extension GameViewController: GameDelegate {
    func scoreUpdated(score: Int) {
        scoreLabel.text = "\(score)/\(game.numberOfQuestions)"
    }

    func gameOver() {
        resetButton.isHidden = false
        toggleImageButtonEnabled()
    }
    
    func nextQuestion() {
        guard let question = game.currentQuestion else {
            return
        }
        
        wordLabel.text = question.answer.rawValue.capitalized
        
        for index in 0..<question.options.count {
            let option = question.options[index]
            let button = imageButtons[index]
            
            button.tag = index
            button.setBackgroundImage(option.image, for: .normal)
        }
    }
    
}
