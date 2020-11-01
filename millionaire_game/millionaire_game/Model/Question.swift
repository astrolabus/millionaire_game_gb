//
//  Question.swift
//  millionaire_game
//
//  Created by Полина Войтенко on 25.10.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import Foundation

struct Question: Codable {
    var question: String
    var answers: [String]
    var rightAnswer: String
}
