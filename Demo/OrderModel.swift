//
//  OrderModel.swift
//  Demo
//
//  Created by D2V iMac on 02/10/19.
//  Copyright © 2019 D2V iMac. All rights reserved.
//

import Foundation

// assume this data from API
class OrderDetails {
    
    var orderID: String = ""
    var orderStatus: String = ""
    var orderDate: String = ""
    var orderPayType: String = ""
    
    init(orderID: String, orderStatus: String, orderDate: String, orderPayType: String) {
        
        self.orderID = orderID
        self.orderStatus = orderStatus
        self.orderDate = orderDate
        self.orderPayType = orderPayType
        
    }
}
