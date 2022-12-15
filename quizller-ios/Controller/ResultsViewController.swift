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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = finalScore
        
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
