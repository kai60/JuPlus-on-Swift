//
//  FurnitureController.swift
//  JuPlus
//
//  Created by 祝发冬 on 15/12/18.
//  Copyright © 2015年 祝发冬. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import MJRefresh


class FurnitureController:RootViewController,UITableViewDelegate,UITableViewDataSource
{
    
    var tableView:UITableView!
    var dataArray:NSMutableArray!
    var netManager:Manager!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        self.title="居+"
        self.prepareData()
        self.UIConfig()
        
        
    }
    
    func prepareData()
    {
        dataArray=NSMutableArray()
       
        netManager=Alamofire.Manager.sharedInstance
        netManager.startRequestsImmediately=true
        
    }
    func UIConfig ()
    {
        tableView=UITableView (frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height), style: UITableViewStyle.Plain)
        self.view .addSubview(tableView)
        self.tableView.mj_header=MJRefreshNormalHeader(refreshingBlock: { [unowned self]() -> Void  in
            
           self.loadNewData()
        })
        self.tableView.mj_footer=MJRefreshAutoNormalFooter(refreshingBlock: { [unowned self] () -> Void in
            self.loadMoreData()
        })
        self.tableView.mj_header.beginRefreshing()
        
    }
    //MARK:---------LoadData------------
    
    func loadNewData()
    {
       let request=netManager.request(.GET, baseUrl+"/collocate/list", parameters: ["pageNum":"1","pageSize":"10","tagId":"0"], encoding: .URLEncodedInURL, headers: nil)
        request.responseJSON { (json) -> Void in
            
            print("成功啦！")
            print(json)
        }
        
    }
    func loadMoreData()
    {
        
    }
    
   // MARK:---------TableViewDelegateAndDataSources-------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return dataArray.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let identifier="cell"
        var cell:UITableViewCell?=tableView.dequeueReusableCellWithIdentifier(identifier)
        if(cell==nil)
        {
            cell=UITableViewCell (style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
        }
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        print("disdselcted")
        
    }
    
    
    
}