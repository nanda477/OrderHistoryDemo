//
//  OrderHistoryCell.swift
//  Demo
//
//  Created by D2V iMac on 02/10/19.
//  Copyright © 2019 D2V iMac. All rights reserved.
//

import UIKit

class OrderHistoryCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var orderIDLbl: UILabel!
    @IBOutlet weak var orderDateLbl: UILabel!
    
    @IBOutlet weak var orderPaytypeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadOrderHistory(data: OrderDetails) {
        
        //shadow for backgroud view
           bgView.layer.shadowColor = UIColor.black.cgColor
           bgView.layer.shadowOpacity = 0.3
           bgView.layer.shadowOffset = CGSize(width: 1, height: 1)
           bgView.layer.shadowRadius = 5
           bgView.layer.masksToBounds = false
        
        //orderStatus
               //1- processing
               //2- shipped
               //3- Delivered
               
               //orderPayType
               //1- Cash
               //2- Online - DebitCard
               //3- Paypal
        
        var orderStatusStr = ""
        var orderPayTypeStr = ""
        
        if data.orderStatus == "1" {
            orderStatusStr = "Processing"
        }else if data.orderStatus == "2" {
            orderStatusStr = "Shipped"
        }else if data.orderStatus == "3" {
            orderStatusStr = "Delivered"
        }
        
        if data.orderPayType == "1" {
           orderPayTypeStr = "Cash"
       }else if data.orderPayType == "2" {
           orderPayTypeStr = "Online - DebitCard"
       }else if data.orderPayType == "3" {
           orderPayTypeStr = "Online - Paypal"
       }
        
        orderStatus.text = orderStatusStr
        orderPaytypeLbl.text = orderPayTypeStr
        orderDateLbl.text = data.orderDate
        orderIDLbl.text = data.orderID
        
    }

}
