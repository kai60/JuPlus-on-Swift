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
import SwiftyJSON


class FurnitureController:RootViewController,UITableViewDelegate,UITableViewDataSource
{
    
    var tableView:UITableView!
    var dataArray:[JSON]!
    var netManager:Manager!
    var pageNumber=1
    var pageSize=10;
    var tagId=0
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
        dataArray=[JSON]()
       
        netManager=Alamofire.Manager.sharedInstance
        netManager.startRequestsImmediately=true
        
    }
    func UIConfig ()
    {
        tableView=UITableView (frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height), style: UITableViewStyle.Plain)
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.separatorStyle=UITableViewCellSeparatorStyle.None;
        self.view .addSubview(tableView)
        self.tableView.mj_header=MJRefreshNormalHeader(refreshingBlock: { [unowned self]() -> Void  in
            
           self.loadNewData()
        })
        self.tableView.mj_footer=MJRefreshAutoNormalFooter(refreshingBlock: { [unowned self] () -> Void in
            self.loadMoreData()
        })
        self.tableView.mj_header.beginRefreshing()
        
        
    }
    //MARK:---------DataWork------------
    
    func loadNewData()
    {
        pageNumber=1
       let request=netManager.request(.GET, baseUrl+"collocate/list", parameters: ["pageNum":pageNumber,"pageSize":pageSize,"tagId":tagId], encoding: .URLEncodedInURL, headers: header)
        
        
        // json 现在就是reponse的结构体 只closure的形参 它的构建是在内部完成的
        // value 在成功的result的value里面
        request.responseJSON { (resultJSON) -> Void in
            
            if resultJSON.result.isSuccess
            {
                let value=JSON.init(resultJSON.result.value!)
                let data:JSON=value[dataKey]
                data.arrayValue
                self.dataArray.removeAll();
                self.dataArray=data["list"].arrayValue;
                //print(self.dataArray)
                self.tableView.reloadData()
                
            }
            else
            {
               
            }
            self.tableView.mj_header .endRefreshing()
        }
        
        
    }
    func loadMoreData()
    {
        pageNumber++;
        let request=netManager.request(.GET, baseUrl+"collocate/list", parameters: ["pageNum":pageNumber,"pageSize":pageSize,"tagId":tagId], encoding: .URLEncodedInURL, headers: header)
        
        
        // json 现在就是reponse的结构体 只closure的形参 它的构建是在内部完成的
        
        request.responseJSON { (resultJSON) -> Void in
            
            if resultJSON.result.isSuccess
            {
                let value=JSON.init(resultJSON.result.value!)
                let data:JSON=value[dataKey]
                let list=data["list"].arrayValue;
                self.dataArray.appendContentsOf(list)
                //print(self.dataArray)
                self.tableView.reloadData()
                
            }
            else
            {
                
            }
            self.tableView.mj_footer .endRefreshing()
        }
        
        
    }
    
   // MARK:---------TableViewDelegateAndDataSources-------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        
            return dataArray.count;
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let identifier="furnishcell"
        var cell:FurnitureCell?=tableView.dequeueReusableCellWithIdentifier(identifier) as?FurnitureCell
        if(cell==nil)
        {
            cell=FurnitureCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
            cell?.selectionStyle=UITableViewCellSelectionStyle.None;
        }
        
        cell?.fillDataWith(dataArray[indexPath.row])
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return FurnitureCell .getHeightWith(dataArray[indexPath.row])
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        print("selcted the row \(indexPath.row)")
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
  
    
    // MARK:---------Action-------

    
    
    
}