//
//  RandomModeStrategy.swift
//  millionaire_game
//
//  Created by Полина Войтенко on 01.11.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import Foundation
import UIKit

final class RandomModeStrategy: ModeStrategy {
    func setUpMode(_ data: [Question]) -> [Question] {
        return data.shuffled()
    }
}
