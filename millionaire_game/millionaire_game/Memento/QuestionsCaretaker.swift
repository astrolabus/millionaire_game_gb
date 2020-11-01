//
//  QuestionsCaretaker.swift
//  millionaire_game
//
//  Created by Полина Войтенко on 01.11.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import Foundation

class QuestionsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "questions"
    
    func save(questions: [Question]) {
        do {
            let data = try encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
