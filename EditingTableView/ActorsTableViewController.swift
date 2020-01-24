//
//  ActorsTableViewController.swift
//  EditingTableView
//
//  Created by Marni Anuradha on 1/6/20.
//  Copyright © 2020 Marni Anuradha. All rights reserved.
//

import UIKit

class ActorsTableViewController: UITableViewController {

    var actorNames = ["Mahesh", "Tarak", "Prabhas", "Nani", "Ram", "Samantha", "Kajal", "Rakul", "Sushanth", "Tarun", "Raashi", "Shreya", "Priyanka Chopra", "Parinithi Chopra", "Ranveer Singh", "Nisha Agarwal", "Soundarya"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Actors"
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return actorNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
        
        cell.textLabel?.text = actorNames[indexPath.row]
        
        

        // Configure the cell...

        return cell
    }
    /*
  //  Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        if(indexPath.row%2 == 0)
        {
            return true
        }
        else
        {
            return false
        }
        //return true
    }
    */
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if(indexPath.row%2 == 0)
        {
            return UITableViewCell.EditingStyle.insert
        }else{
            return UITableViewCell.EditingStyle.delete
        }
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
       // var ip1 = IndexPath(row: 3, section: 0)
       // var ip2 = IndexPath(row: 6, section: 0)
        if editingStyle == .insert{
            // Delete the row from the data source
            
            print("Insert rows")
            actorNames.insert("Surya", at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.middle)
            
        } else if editingStyle == .delete {
            
            print("Delete rows")
            actorNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        var storedValue = actorNames[fromIndexPath.row]
        actorNames.remove(at: fromIndexPath.row)
        actorNames.insert(storedValue, at: to.row)
        print("User dragged from \(fromIndexPath.row) and dropped at \(to.row)")
        print(actorNames)
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
