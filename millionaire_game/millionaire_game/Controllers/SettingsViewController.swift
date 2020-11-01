//
//  SettingsViewController.swift
//  millionaire_game
//
//  Created by Полина Войтенко on 01.11.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            addButton.layer.cornerRadius = 10
            addButton.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.layer.cornerRadius = 10
            saveButton.clipsToBounds = true
        }
    }
    
    private var selectedMode: Mode {
        switch self.modeSegmentedControl.selectedSegmentIndex {
        case 0:
            return .consecutively
        case 1:
            return .randomly
        default:
            return .consecutively
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.addTarget(self, action: #selector(saveSettings), for: .touchUpInside)
    }
    
    @objc private func saveSettings() {
        Game.shared.selectedMode = selectedMode
        dismiss(animated: true, completion: nil)
    }

}
