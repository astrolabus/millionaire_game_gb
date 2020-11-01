//
//  MainViewController.swift
//  millionaire_game
//
//  Created by Полина Войтенко on 25.10.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var starGame: UIButton! {
        didSet {
            starGame.layer.borderColor = UIColor.systemYellow.cgColor
            starGame.layer.borderWidth = 2
            starGame.layer.cornerRadius = 10
            starGame.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var showRecords: UIButton! {
        didSet {
            showRecords.layer.borderColor = UIColor.systemYellow.cgColor
            showRecords.layer.borderWidth = 2
            showRecords.layer.cornerRadius = 10
            showRecords.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var settingsButton: UIButton! {
        didSet {
            settingsButton.layer.borderColor = UIColor.systemYellow.cgColor
            settingsButton.layer.borderWidth = 2
            settingsButton.layer.cornerRadius = 10
            settingsButton.clipsToBounds = true
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGame":
            guard let destination = segue.destination as? GameViewController else {return}
            destination.gameDelegate = self
        default:
            break
        }
    }

}

extension MainViewController: GameDelegate {
    func updateGameSession(with result: Int, questionsCount: Int) {
        let gameSession = GameSession()
        gameSession.result = result
        gameSession.questionCount = questionsCount
        
        Game.shared.gameSession = gameSession
        Game.shared.addRecord()
    }
}
