//
//  AddQuestionViewController.swift
//  millionaire_game
//
//  Created by Полина Войтенко on 01.11.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {
    
    
    @IBOutlet weak var questionTextView: UITextView! {
        didSet {
            questionTextView.layer.borderColor = UIColor.quaternaryLabel.cgColor
            questionTextView.layer.borderWidth = 1
            questionTextView.layer.cornerRadius = 5
            questionTextView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var wrongAnswerOne: UITextField!
    @IBOutlet weak var wrongAnswerTwo: UITextField!
    @IBOutlet weak var wrongAnswerThree: UITextField!

    @IBOutlet weak var rightAnswer: UITextField!
    
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            addButton.layer.cornerRadius = 10
            addButton.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.addTarget(self, action: #selector(addNewQuestion), for: .touchUpInside)
    }
    
    @objc private func addNewQuestion() {
        guard let newQuestion = questionTextView.text, let newRightAnswer = rightAnswer.text else { return }
        let newAnswers = [wrongAnswerOne.text ?? "", wrongAnswerTwo.text ?? "", wrongAnswerThree.text ?? "", newRightAnswer]
        let question = Question(question: newQuestion, answers: newAnswers, rightAnswer: newRightAnswer)
        Game.shared.addQuestion(question)
        
        dismiss(animated: true, completion: nil)
    }

}
