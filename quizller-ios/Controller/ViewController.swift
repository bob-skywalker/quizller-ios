//
//  ViewController.swift
//  quizller-ios
//
//  Created by bo zhong on 12/13/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var TrueButton: UIButton!
    @IBOutlet weak var FalseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
    

    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            sender.layer.cornerRadius = 15
        } else {
            sender.backgroundColor = UIColor.red
            sender.layer.cornerRadius = 15
        }
        
        quizBrain.nextQuestion()

        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        TrueButton.backgroundColor = UIColor.clear
        FalseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = quizBrain.getScore()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
}

