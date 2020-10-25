//
//  RecordsTableViewCell.swift
//  millionaire_game
//
//  Created by Полина Войтенко on 25.10.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import UIKit

class RecordsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
