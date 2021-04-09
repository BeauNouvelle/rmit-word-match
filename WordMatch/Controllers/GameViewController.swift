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
    
    let game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }
    
    @IBAction func imageButtonTapped(_ sender: UIButton) {
        
    }
    
    func nextQuestion() {
        if game.questions.isEmpty {
            // end game
        } else {
            
            let question = game.nextQuestion()
            wordLabel.text = question.answer.rawValue
            
            for index in 0..<question.options.count {
                print(index)
                
                guard index <= imageButtons.count - 1 else {
                    break
                }
                
                let option = question.options[index]
                let button = imageButtons[index]
                
                print(option.rawValue)
                
                button.setBackgroundImage(option.image, for: .normal)
            }
        }
    }
    
}
