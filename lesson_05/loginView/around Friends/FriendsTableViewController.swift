//
//  friendsTableTableViewController.swift
//  loginView
//
//  Created by Олег Дмитриев on 31.01.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    @IBOutlet var searchFrienda: UITableView!
    
    var friends = [
        Friend(name: "Alla", avatar: UIImage(named: "Alla")!, ruName: "Алла"),
        Friend(name: "Boris", avatar: UIImage(named: "Boris")!, ruName: "Борис"),
        Friend(name: "Clara", avatar: UIImage(named: "Clara")!, ruName: "Клара"),
        Friend(name: "Dmitriy", avatar: UIImage(named: "Dmitriy")!, ruName: "Дмитрий"),
        Friend(name: "Anna", avatar: UIImage(named: "Alla")!, ruName: "Анна"),
        Friend(name: "Evgeniy", avatar: UIImage(named: "Boris")!, ruName: "Евгений"),
        Friend(name: "Ceroline", avatar: UIImage(named: "Clara")!, ruName: "Кэролин"),
        Friend(name: "Dolly", avatar: UIImage(named: "Dmitriy")!, ruName: "Долли"),
        Friend(name: "Sergey", avatar: UIImage(named: "Alla")!, ruName: "Сергей"),
        Friend(name: "Mihail", avatar: UIImage(named: "Boris")!, ruName: "Михаил"),
        Friend(name: "Cara", avatar: UIImage(named: "Clara")!, ruName: "Сара"),
        Friend(name: "Daniil", avatar: UIImage(named: "Dmitriy")!, ruName: "Даниил"),
        Friend(name: "Alexey", avatar: UIImage(named: "Alla")!, ruName: "Алексей"),
        Friend(name: "Barbara", avatar: UIImage(named: "Boris")!, ruName: "Барбара"),
        Friend(name: "Cvetlana", avatar: UIImage(named: "Clara")!, ruName: "Светлана"),
        Friend(name: "Dantes", avatar: UIImage(named: "Dmitriy")!, ruName: "Дантес")
    ]

    
    
    lazy var friendsForSort:[String] = {
        var teml:[String] = []
        friends.forEach { friend in
            teml.append(friend.ruName)
        }
        return teml
    }()
    
    var filtrenFriends: [String] = [String]()
    
    lazy var selections:[[String]] = {
        
        // Обрабатываю свои входные данные

        
        //далее как на урпоке
        var dict = [[String]]()
        return filtrenFriends.sorted().reduce([[String]]()) { (result, element) -> [[String]] in
            guard var last = result.last else { return [[element]] }
            var collection = result
            if element.first == result.last?.first?.first {
                last.append(element)
                collection[collection.count - 1] = last
            } else {
                collection.append([element])
            }
            return collection
        }
        
        return dict
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FriendCellHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerView")
        filtrenFriends = friendsForSort
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return selections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return selections[section].first?.first?.uppercased()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selections[section].count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsCell else {
            preconditionFailure("Can't create")
        }
        var friendName = selections[indexPath.section][indexPath.row]
        
        cell.FriendCellLable.text = friendName
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRU", let indexPath = tableView.indexPathForSelectedRow {
            let friend = friends[indexPath.row].ruName
            let destinationViewController = segue.destination as? OneFriendController
            destinationViewController?.friendNameRU = friends[indexPath.row].ruName
        }
    }
}

extension FriendsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtrenFriends = friendsForSort.filter { $0.range(of: searchText, options: .caseInsensitive) != nil }
        if filtrenFriends.count == 0 {filtrenFriends = friendsForSort}
        
        selections = {
            //далее как на урпоке
            var dict = [[String]]()
            return filtrenFriends.sorted().reduce([[String]]()) { (result, element) -> [[String]] in
                guard var last = result.last else { return [[element]] }
                var collection = result
                if element.first == result.last?.first?.first {
                    last.append(element)
                    collection[collection.count - 1] = last
                } else {
                    collection.append([element])
                }
                return collection
            }
            
            return dict
        }()
        
        tableView.reloadData()
        print(filtrenFriends)
    }
}
