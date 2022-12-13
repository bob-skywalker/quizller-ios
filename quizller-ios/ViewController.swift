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
    
    let quiz = [
        ["Four + Two is equal to Six.", "True"],
        ["Five - Three is greater than One", "True"],
        ["Three + Eight is less than Ten", "True"]
    ]
    
    var questionNum = 0
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNum][1]
        
        if userAnswer == actualAnswer && questionNum < quiz.count - 1 {
            questionNum += 1
            updateUI()
        } else if userAnswer == actualAnswer && questionNum == quiz.count - 1 {
            questionNum = 0
            updateUI()
        }
    }
    
    func updateUI(){
        questionLabel.text = quiz[questionNum][0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }


}

