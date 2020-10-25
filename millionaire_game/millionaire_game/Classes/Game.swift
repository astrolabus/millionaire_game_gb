//
//  Game.swift
//  millionaire_game
//
//  Created by Полина Войтенко on 25.10.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import Foundation

class Game {
    static let shared = Game()

    var gameSession: GameSession?
    
    private let recordsCaretaker = RecordsCaretaker()
    private(set) var records = [Records]() {
        didSet {
            recordsCaretaker.save(records: records)
        }
    }
    
    private init() {
        self.records = recordsCaretaker.load()
    }
    
    func addRecord() {
        guard let score = gameSession?.result, let questionCount = gameSession?.questionCount else { return }
        let countedResult = (score * 100)/questionCount
        
        let record = Records(date: Date(), score: countedResult)
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
}
