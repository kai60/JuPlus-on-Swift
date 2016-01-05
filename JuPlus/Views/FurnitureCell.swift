//
//  HomePageCell.swift
//  JuPlus
//
//  Created by 祝发冬 on 15/12/24.
//  Copyright © 2015年 祝发冬. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON


class FurnitureCell:UITableViewCell
{
    var descriptionLabel:UILabel!
    var descriptionImageView:UIImageView!
    var designerButton:UIButton!
    var nickNameLabel:UILabel!
    var timeLabel:UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellConfig()
        
    }
    func cellConfig()
    {
        
        designerButton=UIButton(frame: CGRect(x: 10.0,y: 5.0,width: 40.0,height: 40.0))
        designerButton.addTarget(self, action: Selector("headerClick:"), forControlEvents: UIControlEvents.TouchUpInside)
       
        nickNameLabel=UILabel.init(frame: CGRect(x: CGRectGetMaxX(designerButton.frame)+5, y:15.0, width: 100.0, height: 20.0))
        nickNameLabel.font=UIFont.init(name: fontName, size: 14.0)
        nickNameLabel.textAlignment=NSTextAlignment.Left;
        nickNameLabel.textColor=UIColor.init(rgba: "#c08c54")
       
        
        
        timeLabel=UILabel.init(frame: CGRect(x: CGRectGetMaxX(self.frame)-110, y: 15.0, width: 100.0, height: 20.0))
        timeLabel.font=UIFont.init(name: fontName, size: 12.0)
        timeLabel.textAlignment=NSTextAlignment.Right;
        timeLabel.textColor=UIColor.grayColor()
        
        
        descriptionLabel=UILabel.init(frame: CGRect(x: 10.0, y: CGRectGetMaxY(designerButton.frame)+5, width: self.frame.width, height: 20.0))
        descriptionLabel.font=UIFont.init(name: fontName, size: 12.0)
        descriptionLabel.textAlignment=NSTextAlignment.Left;
        descriptionLabel.textColor=UIColor.grayColor()
        
        descriptionImageView=UIImageView.init(frame: CGRect(x: 0.0, y: 75.0, width: self.frame.size.width, height: screenWidth))
        descriptionImageView.contentMode=UIViewContentMode.ScaleAspectFit;
        
        
        
        
        
        self.contentView.addSubview(designerButton)
        self.contentView.addSubview(nickNameLabel)
        self.contentView.addSubview(timeLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(descriptionImageView)
        

    }
    func fillDataWith(dict:JSON)
    {
        
         designerButton.sd_setImageWithURL(NSURL.init(string: imageBaseUrl+(dict["portraitPath"].stringValue)), forState: .Normal, placeholderImage: UIImage.init(named: "default_square"))
        
         nickNameLabel.text=dict["nickname"].stringValue
        
        timeLabel.text=dict["uploadTime"].stringValue

        descriptionLabel.text=dict["explain"].stringValue
        
        descriptionImageView .sd_setImageWithURL(NSURL.init(string: imageBaseUrl+(dict["sharePicUrl"].stringValue)), placeholderImage: UIImage.init(named: "default_square"))
        //descriptionImageView.backgroundColor=UIColor.orangeColor()
    }
    class func getHeightWith(dict:JSON)->CGFloat
    {
    
        return 75.0+screenWidth+5.0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     // MARK:---------Action-------
    
    
    func headerClick(sender:UIButton!)
    {
        print("headerClicked")
    }
}
