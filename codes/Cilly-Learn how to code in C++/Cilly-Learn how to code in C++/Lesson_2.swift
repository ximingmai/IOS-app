//
//  Lesson_2_View.swift
//  Cilly-Learn how to code in C++
//
//  Created by 颜泽鑫 on 16/7/17.
//  Copyright © 2016年 颜泽鑫. All rights reserved.
//

import UIKit

class Lesson_2: UITableViewController {
  var info : [String] = []
  var Finished : [Bool] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let textPath = DataContext().getFilePath("data.txt")
    /// Unarchive the file to get `Data` info.
    let data = NSKeyedUnarchiver.unarchiveObjectWithFile(textPath) as! DataContext
    info = data.Data["Lesson_2"]!["info"] as! [String]
    Finished = data.Data["Lesson_2"]!["finished"] as! [Bool]
    self.navigationItem.titleView = UIImageView(image: UIImage(named: "Icon-Small"))
    self.view.backgroundColor = UIColor(red: 0.13, green: 0.15, blue: 0.19, alpha: 1)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return info.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let Identifier = "CustomCell_2"
    let cell = tableView.dequeueReusableCellWithIdentifier(Identifier, forIndexPath: indexPath) as! CustomCell_2
    cell.MainTitle.text = info[indexPath.row]
    cell.MainTitle.textColor = UIColor(red: 0.75, green: 0.77, blue: 0.81, alpha: 1)
    cell.Cellimage?.image = UIImage(named: "Icon-60")
    cell.backgroundColor = UIColor(red: 0.13, green: 0.15, blue: 0.19, alpha: 1)
    cell.selectionStyle = UITableViewCellSelectionStyle.None
    if Finished[indexPath.row] == true {
      cell.accessoryType = .Checkmark
    } else {
      cell.accessoryType = .None
    }
    return cell
  }
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    Finished[indexPath.row] = true
    let Identifier = "CustomCell_2"
    let cell = tableView.dequeueReusableCellWithIdentifier(Identifier, forIndexPath: indexPath) as! CustomCell_2
    cell.accessoryType = .Checkmark
    let textPath = DataContext().getFilePath("data.txt")
    let data = NSKeyedUnarchiver.unarchiveObjectWithFile(textPath) as! DataContext
    data.Data["Lesson_2"]!["finished"] = Finished
    let data_manager = NSKeyedArchiver.archivedDataWithRootObject(data)
    do {
      try data_manager.writeToFile(textPath, options: NSDataWritingOptions.AtomicWrite)
    } catch {
      print("Write error!")
    }
  }
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
   if editingStyle == .Delete {
   // Delete the row from the data source
   tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
   } else if editingStyle == .Insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }    
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
