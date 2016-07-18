//
//  DataContext.swift
//  Cilly-Learn how to code in C++
//
//  Created by 颜泽鑫 on 16/7/17.
//  Copyright © 2016年 颜泽鑫. All rights reserved.
//

import Foundation
import UIKit

class DataContext : NSObject, NSCoding {
  /// The whole data of this data will be stored in this dictionary.
  var Data = ["Lesson_1" :
    ["info" :
      ["Introduction", "Fundamental job", "Variable", "Code?", "Even more numbers...", "Math", "Module", "Constant", "Comment", "Summery"],
      "finished" :
        [false, false, false, false, false, false, false, false, false, false]
    ],
              "RootView" : ["info" : ["Basic C++", "Variables", "Booleans", "string", "If and else...", "Loop", "Array", "Function"]
    ],
              "Lesson_2" :
                ["info" :[ "Declaration", "Initialization", "Always initialize...", "Type safety", "Cast", "++", "+=", "Summary"],
                  "finished" : [false, false, false, false, false, false, false, false]
    ]
  ]
  
  var identification = ["Lesson_1", "Lesson_2"]
  
  override init() {
    super.init()
  }
  required init?(coder aDecoder: NSCoder) {
    super.init()
    Data["Lesson_1"]!["finished"] = aDecoder.decodeObjectForKey("Lesson_1_finished") as! [Bool]
    Data["Lesson_2"]!["finished"] = aDecoder.decodeObjectForKey("Lesson_2_finished") as! [Bool]
  }
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(Data["Lesson_1"]!["finished"], forKey: "Lesson_1_finished")
    aCoder.encodeObject(Data["Lesson_2"]!["finished"], forKey: "Lesson_2_finished")
  }
  func getFilePath(filename : String) -> String {
    let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
    var DocumentPath = path[0] as NSString
    /**
     *  You still need to pay attention to add `/` before file name.
     *  So that you can interval the different component.
     *  @param "/"
     *
     *  @return path
     */
    DocumentPath = DocumentPath.stringByAppendingString("/")
    return DocumentPath.stringByAppendingString(filename)
  }
}
