//
//  placetableTableViewController.swift
//  bb
//
//  Created by 王子璇 on 2018/5/26.
//  Copyright © 2018年 王子璇. All rights reserved.
//

import UIKit

class MainBottom: UIViewController {
    
    var placesname =  ["Australia","Japan","China"]
    var placesimage = ["great_ocean_road","fuji","great_wall"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.placesname.count
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.placesname.count
    }
    
    
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        // Configure the cell...
        cell.textLabel?.text = placesname[indexPath.row]
        cell.imageView?.image = UIImage(named: placesimage[indexPath.row])
        
        
        return cell
        
    }
    /* override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
     let optionmenu = UIAlertController(title: nil, message: "Do you like it?", preferredStyle: .actionSheet)
     }
     
     */
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    /* override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     self.placesname.remove(at: indexPath.row)
     self.placesimage.remove(at: indexPath.row)
     
     self.tableView.reloadData()
     
     self.tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareaction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: {(ACTION:UITableViewRowAction!, indexPath:IndexPath) -> Void in
            let sharemenu = UIAlertController(title: nil, message: "share using", preferredStyle: .actionSheet)
            let wechat = UIAlertAction(title: "Wechat", style: UIAlertActionStyle.default, handler: nil)
            let email = UIAlertAction(title: "Email", style: UIAlertActionStyle.default, handler: nil)
            let twitter = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            
            sharemenu.addAction(wechat)
            sharemenu.addAction(email)
            sharemenu.addAction(twitter)
            sharemenu.addAction(cancel)
            
            
            self.present(sharemenu, animated: true, completion: nil)
        }
        )
        let deleteaction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Default", handler: {(ACTION:UITableViewRowAction!, indexPath:IndexPath) -> Void in
            self.placesname.remove(at: indexPath.row)
            self.placesimage.remove(at: indexPath.row)
            //self.ta.deleteRows(at: [indexPath], with: .fade)
            
        }
        )
        
        
        shareaction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        deleteaction.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        return [deleteaction,shareaction]
    }
    
    
    
    
    
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

