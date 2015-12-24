//
//  Common.swift
//  JuPlus
//
//  Created by Kai on 15/12/18.
//  Copyright © 2015年 祝发冬. All rights reserved.
//


//121.40.228.199:8859/collocate/map
//121.40.228.199:8859/collocate/list?pageNum=1&pageSize=10&tagId=0
import Foundation
import UIKit


let baseUrl="http://121.40.228.199:8859"

let version=(NSBundle.mainBundle().infoDictionary![kCFBundleVersionKey as String]) as? String
let header=["User-Agent":"Jujia-App_"+version!+":IOS"]
let  dataKey="data"
let  resCodeKey="resCode";
let resMsgKey="resMsg"

