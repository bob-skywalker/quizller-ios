//
//  ResultsViewController.swift
//  quizller-ios
//
//  Created by bo zhong on 12/14/22.
//

import UIKit

class ResultsViewController: UIViewController {
    var finalScore: String?
    
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var viewBackGround: UIView!
    @IBOutlet weak var trophyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(finalScore!)%"
        
        if Double(finalScore!)! < 50.0 {
            adviceLabel.text = "🙁 Nice try, do not give up."
            trophyImage.image = UIImage(named: "bronze_medal")
            viewBackGround.backgroundColor = UIColor.lightGray
        } else if Double(finalScore!)! > 50.0 && Double(finalScore!)! < 80.0 {
            viewBackGround.backgroundColor = UIColor.systemTeal
            trophyImage.image = UIImage(named: "silver_medal")
            adviceLabel.text = "You will do better next time! 👏"
        } else {
            viewBackGround.backgroundColor = UIColor.blue
            trophyImage.image = UIImage(named: "gold_medal")
            adviceLabel.text = "You are awesome! Kudos to you 😊"
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
