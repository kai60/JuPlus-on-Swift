//
//  RootViewController.swift
//  JuPlus
//
//  Created by Kai on 15/12/18.
//  Copyright © 2015年 祝发冬. All rights reserved.
//

import Foundation
import UIKit
 @objc(RootViewController)  class RootViewController :UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
    }
    
    
//    required init?(coder aDecoder: NSCoder) {
//        
//        super.init(coder: aDecoder)
//    }
//    
//   
//    
//  
//    
//    
//    convenience   init()
//    {
//        
//        var nibNameOrNil:String?="DesignerController"// Utility.classNameAsString(DesignerController.self)
//        
//        //考虑到xib文件可能不存在或被删，故加入判断
//        
//        if NSBundle.mainBundle().pathForResource(nibNameOrNil, ofType: "xib") == nil
//            
//        {
//            
//            nibNameOrNil = nil
//            
//        }
//        nibNameOrNil="DesignerController"
//        
//        self.init(nibName: nibNameOrNil, bundle: NSBundle.mainBundle())
//        
//    }
//    
//
//    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
//    {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        
//
//    }
}