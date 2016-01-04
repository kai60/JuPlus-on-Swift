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


// 配置类

let baseUrl="http://121.40.228.199:8859/"
let imageBaseUrl="http://jujia-images.oss-cn-hangzhou.aliyuncs.com/"

let version=(NSBundle.mainBundle().infoDictionary![kCFBundleVersionKey as String]) as? String
let header=["User-Agent":"Jujia-App_"+version!+":IOS"]
let  dataKey="data"
let  resCodeKey="resCode";
let resMsgKey="resMsg"
//可以如此获取名字
let fontName="ZHSRXT--GBK1-0"//UIFont.systemFontOfSize(18, weight: UIFontWeightLight).fontName



// 常用变量

let screenWidth=UIScreen.mainScreen().bounds.width;
let screenHeight=UIScreen.mainScreen().bounds.height;