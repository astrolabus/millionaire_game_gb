//
//  GameViewController.swift
//  millionaire_game
//
//  Created by Полина Войтенко on 25.10.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import UIKit

protocol GameDelegate: AnyObject {
    func updateGameSession(with result: Int, questionsCount: Int)
}

class GameViewController: UIViewController {
    
    var questions: [Question] = [
        Question(question: "На каком инструменте играл древнерусский певец и сказитель Боян?",
                 answers: ["На виолончели", "На гуслях", "На баяне", "На гитаре"],
                 rightAnswer: "На гуслях"),
        Question(question: "В какой из этих стран один из официальных языков - французский?",
                 answers: ["Республика Гаити", "Кения", "Эквадор", "Венесуэлла"],
                 rightAnswer: "Республика Гаити"),
        Question(question: "В каком из этих фильмов не снимался Александр Абдулов?",
                 answers: ["Убить дракона", "Чародеи", "Московские каникулы", "Карнавал"],
                 rightAnswer: "Московские каникулы"),
        Question(question: "В каком году произошла Куликовская битва?",
                 answers: ["1569", "1616", "1773", "1380"],
                 rightAnswer: "1380"),
        Question(question: "Какая картина Малевича находится в Русском музее?",
                 answers: ["Красный квадрат", "Точильщик", "Черный квадрат", "Белый квадрат"],
                 rightAnswer: "Красный квадрат")
    ]
    
    var currentQuestion = 0
    var points = 0
    
    var mode: Mode = Game.shared.selectedMode ?? .consecutively
    private var modeStrategy: ModeStrategy? {
        switch self.mode {
        case .consecutively:
            return ConsecutivelyModeStrategy()
        case .randomly:
            return RandomModeStrategy()
        }
    }
    private var data = [Question]()
    
    weak var gameDelegate: GameDelegate?
    
    @IBOutlet weak var quitButton: UIButton!
    
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    @IBOutlet weak var questionView: UIView! {
        didSet {
            questionView.layer.cornerRadius = 25
            questionView.clipsToBounds = true
        }
    }
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerOne: UIButton! {
        didSet {
            answerOne.layer.cornerRadius = 10
            answerOne.clipsToBounds = true
        }
    }
    @IBOutlet weak var ansswerTwo: UIButton! {
        didSet {
            ansswerTwo.layer.cornerRadius = 10
            ansswerTwo.clipsToBounds = true
        }
    }
    @IBOutlet weak var answerThree: UIButton! {
        didSet {
            answerThree.layer.cornerRadius = 10
            answerThree.clipsToBounds = true
        }
    }
    @IBOutlet weak var answerFour: UIButton! {
        didSet {
            answerFour.layer.cornerRadius = 10
            answerFour.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerOne.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        ansswerTwo.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        answerThree.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        answerFour.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        quitButton.addTarget(self, action: #selector(quitGame), for: .touchUpInside)
        
        addNewQuestions()
        
        data = self.modeStrategy?.setUpMode(questions) ?? []
        
        setQuestions()
    }
    
    @objc private func quitGame() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        
        if sender.titleLabel?.text == data[currentQuestion].rightAnswer {
            points += 1
            if points == data.count {
                gameDelegate?.updateGameSession(with: points, questionsCount: data.count)
                dismiss(animated: true, completion: nil)
            } else {
                currentQuestion += 1
                setQuestions()
            }
        } else {
            gameDelegate?.updateGameSession(with: points, questionsCount: data.count)
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    private func setQuestions() {
        
        let progress = (points * 100)/data.count
        
        questionNumber.text = "Вопрос №\(currentQuestion + 1)"
        progressLabel.text = "\(progress)%"
        questionLabel.text = data[currentQuestion].question
        
        let buttonArr = [answerOne, ansswerTwo, answerThree, answerFour]
        var buttonCount = 0
        
        for button in buttonArr {
            button?.setTitle(data[currentQuestion].answers[buttonCount], for: .normal)
            buttonCount += 1
        }
        
        buttonCount = 0
    }
    
    private func addNewQuestions() {
        if !Game.shared.questions.isEmpty {
            questions.append(contentsOf: Game.shared.questions)
        }
    }

}
