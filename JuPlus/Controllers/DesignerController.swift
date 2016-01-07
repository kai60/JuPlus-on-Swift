//
//  DesignerController.swift
//  JuPlus
//
//  Created by Kai on 16/1/6.
//  Copyright © 2016年 祝发冬. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import MJRefresh
import SwiftyJSON

 @objc(DesignerController)  class DesignerController :RootViewController
{
    var designerid=""
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initTitleView()
    }
    
    func initTitleView()
    {
        self.title="搭配师"
        self.navigationItem.leftBarButtonItem=UIBarButtonItem.init(image: UIImage.init(named: "back"), style: UIBarButtonItemStyle.Plain, target: self, action: "back")
    }
    
    func back()
    {
    self.navigationController?.popViewControllerAnimated(true)
    }
 
   
}


