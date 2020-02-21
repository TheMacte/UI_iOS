//ß
//  NewsTableViewController.swift
//  loginView
//
//  Created by DAN on 21.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
        
        let newsText = ["Александр Сергеевич Пушкин"]

        override func viewDidLoad() {
            super.viewDidLoad()

        }

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return newsText.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
                   preconditionFailure("Can't deque NewsCell")
                
            }
            
            //рабочая константа выбора текстов новостей
            let newsSingleText = newsText[indexPath.row]
            
            
            //заполняем начальными значениями
            cell.textField.text = newsSingleText
            //cell.textField.translatesAutoresizingMaskIntoConstraints = true
            //cell.textField.sizeToFit()
            
            return cell
        }
    }

