//
//  EntreeController.swift
//  Ambrainsia
//
//  Created by Timothy Itodo on 5/22/19.
//  Copyright © 2019 Timothy Itodo. All rights reserved.
//

import UIKit

class EntreeController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionIndex = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextQuestion()
    }
    
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionIndex += 1
        nextQuestion()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionIndex + 1)/13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionIndex + 1)
        
    }
    
    func nextQuestion() {
        if questionIndex < 13 {
            questionLabel.text = allQuestions.list[questionIndex].questionText
            updateUI()
        }
        else {
            
            let alert = UIAlertController(title: "Awesome!", message: "Now that you've scraped your plate, let's go ice the cake with some desert", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Proceed to Desert!", style: .default) { (UIAlertAction) in
                self.performSegue(withIdentifier: "goToDesertIntro", sender: self)
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionIndex].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong!")
        }
    }
    

}
