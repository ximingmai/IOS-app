//
//  RootView.swift
//  Cilly-Learn how to code in C++
//
//  Created by 颜泽鑫 on 16/7/17.
//  Copyright © 2016年 颜泽鑫. All rights reserved.
//

import UIKit

class RootView: UITableViewController {
  var info : [String] = []
  
  @IBOutlet weak var NaviItem: UINavigationItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let data = DataContext()
    info = data.Data["RootView"]!["info"] as! [String]
    view.backgroundColor = UIColor(red: 0.13, green: 0.15, blue: 0.19, alpha: 1)
    NaviItem.title = "Cilly"
    NaviItem.titleView = UIImageView(image: UIImage(named: "Icon-Small"))
    self.navigationController?.navigationBar.barStyle = UIBarStyle(rawValue: 1)!
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
    let Identifier = "CustomCell"
    let cell = tableView.dequeueReusableCellWithIdentifier(Identifier, forIndexPath: indexPath) as! CustomCell
    cell.MainTitle.text = info[indexPath.row]
    cell.MainTitle.textColor = UIColor(red: 0.75, green: 0.77, blue: 0.81, alpha: 1)
    let textPath = DataContext().getFilePath("data.txt")
    let data = NSKeyedUnarchiver.unarchiveObjectWithFile(textPath) as! DataContext
    var right = 0
    for item in data.Data[data.identification[indexPath.row % 2]]!["finished"]! {
      if item == true {
        right += 1
      }
    }
    cell.SubTitle.text = "\(right) / \(data.Data[data.identification[indexPath.row % 2]]!["info"]!.count)"
    cell.SubTitle.textColor = UIColor(red: 0.33, green: 0.59, blue: 0.77, alpha: 1)
    cell.imageView?.image = UIImage(named: "Icon-60")
    cell.backgroundColor = UIColor(red: 0.13, green: 0.15, blue: 0.19, alpha: 1)
    cell.selectionStyle = UITableViewCellSelectionStyle.None
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let data = DataContext()
    let DetailView = self.storyboard?.instantiateViewControllerWithIdentifier(data.identification[indexPath.row % 2])
    self.navigationController?.showViewController(DetailView!, sender: nil)
  }
}
