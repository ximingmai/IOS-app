//
//  Lesson_1_View.swift
//  Cilly-Learn how to code in C++
//
//  Created by 颜泽鑫 on 16/7/17.
//  Copyright © 2016年 颜泽鑫. All rights reserved.
//

import UIKit

class Lesson_1: UITableViewController {
  var info : [String] = []
  var Finished : [Bool] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    let textPath = DataContext().getFilePath("data.txt")
    /// Unarchive the file to get `Data` info.
    let data = NSKeyedUnarchiver.unarchiveObjectWithFile(textPath) as! DataContext
    info = data.Data["Lesson_1"]!["info"] as! [String]
    Finished = data.Data["Lesson_1"]!["finished"] as! [Bool]
    self.navigationItem.titleView = UIImageView(image: UIImage(named: "Icon-Small"))
    self.view.backgroundColor = UIColor(red: 0.13, green: 0.15, blue: 0.19, alpha: 1)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return info.count
  }
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let Identifier = "CustomCell_1"
    let cell = tableView.dequeueReusableCellWithIdentifier(Identifier, forIndexPath: indexPath) as! CustomCell_1
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
    let Identifier = "CustomCell_1"
    let cell = tableView.dequeueReusableCellWithIdentifier(Identifier, forIndexPath: indexPath) as! CustomCell_1
    cell.accessoryType = .Checkmark
    let textPath = DataContext().getFilePath("data.txt")
    let data = NSKeyedUnarchiver.unarchiveObjectWithFile(textPath) as! DataContext
    data.Data["Lesson_1"]!["finished"] = Finished
    let data_manager = NSKeyedArchiver.archivedDataWithRootObject(data)
    do {
      try data_manager.writeToFile(textPath, options: NSDataWritingOptions.AtomicWrite)
    } catch {
      print("Write error!")
    }
  }
}
