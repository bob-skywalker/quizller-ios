//
//  ViewController.swift
//  quizller-ios
//
//  Created by bo zhong on 12/13/22.
//

import UIKit
import AVFoundation

class TestViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var TrueButton: UIButton!
    @IBOutlet weak var FalseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var bgmButton: UIButton!
    
    
    
    var player: AVAudioPlayer?
    var quizBrain = QuizBrain()
    var rightSoundPlayer: AVAudioPlayer?
    var wrongSoundPlayer: AVAudioPlayer?
    var finalScore = "0.0"
    

    
    let rightSoundPlayed = URL(fileURLWithPath: Bundle.main.path(forResource: "correctAnswer", ofType: "mp3")!)
    
    let wrongSoundPlayed = URL(fileURLWithPath: Bundle.main.path(forResource: "wrongAnswer", ofType: "mp3")!)
    
        
    
    @IBAction func bmgButtonPressed(_ sender: UIButton) {
        if let player = player, player.isPlaying{
            bgmButton.setTitle("play sound", for: .normal)
            bgmButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            player.stop()
            
        } else {
            bgmButton.setTitle("stop sound", for: .normal)
            bgmButton.setImage(UIImage(systemName: "stop.circle"), for: .normal)
            let urlString = Bundle.main.path(forResource: "audio", ofType: "mp3")
            
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                player.play()
            }
            catch{
                print("something went wrong")
            }
        }
    }
    
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            sender.layer.cornerRadius = 15
            do {
                rightSoundPlayer = try AVAudioPlayer(contentsOf: rightSoundPlayed)
                rightSoundPlayer?.play()
                checkFinished()
            } catch{
                print("something went wrong")
            }
        } else {
            sender.backgroundColor = UIColor.red
            sender.layer.cornerRadius = 15
            do {
                wrongSoundPlayer = try AVAudioPlayer(contentsOf: wrongSoundPlayed)
                wrongSoundPlayer?.play()
                checkFinished()
            }catch{
                print("something went wrong")
            }
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
        questionImage.image = UIImage(named: quizBrain.getImage())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        bgmButton.sendActions(for: .touchUpInside)
    } 
    
    func checkFinished(){
        if quizBrain.questionNum == quizBrain.quiz.count - 1{
            let score = (Float(quizBrain.correctQuestionNum) / Float(quizBrain.quiz.count - 1)) * 100
            finalScore = String(format: "%.1f", score)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalScore = finalScore
        }
    }
    
     
}

