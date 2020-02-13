//
//  friendsTableTableViewController.swift
//  loginView
//
//  Created by Олег Дмитриев on 31.01.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class friendsTableTableViewController: UITableViewController {
    
    var friends = [
        friend(name: "Alla", avatar: UIImage(named: "Alla")!, ruName: "Алла"),
        friend(name: "Boris", avatar: UIImage(named: "Boris")!, ruName: "Борис"),
        friend(name: "Clara", avatar: UIImage(named: "Clara")!, ruName: "Клара"),
        friend(name: "Dmitriy", avatar: UIImage(named: "Dmitriy")!, ruName: "Дмитрий")
    ]
    
/*
    @IBOutlet override var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
 */

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsCell else {
            preconditionFailure("Can't create")
        }
        let friendName = friends[indexPath.row]
        
        cell.FriendCellLable.text = friendName.ruName
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowRU", let indexPath = tableView.indexPathForSelectedRow {
            let friend = friends[indexPath.row].ruName
            let destinationViewController = segue.destination as? oneFriendController
            destinationViewController?.friendNameRU = friends[indexPath.row].ruName
        }
    }
    

}
