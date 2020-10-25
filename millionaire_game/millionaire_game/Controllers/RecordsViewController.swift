//
//  RecordsViewController.swift
//  millionaire_game
//
//  Created by Полина Войтенко on 25.10.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import UIKit

class RecordsViewController: UIViewController {
    
    @IBOutlet weak var recordsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordsTableView.delegate = self
        recordsTableView.dataSource = self
    }
    
    func formateDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        
        return dateFormatter.string(from: date)
    }
    
}

extension RecordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! RecordsTableViewCell
        
        let score = Game.shared.records[indexPath.row].score
        let date = Game.shared.records[indexPath.row].date
        
        cell.resultLabel.text = "Результат: \(score)%"
        cell.dateLabel.text = "Дата игры: \(formateDate(date))"
        
        return cell
    }
}
