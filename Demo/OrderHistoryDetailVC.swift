//
//  OrderHistoryDetailVC.swift
//  Demo
//
//  Created by D2V iMac on 02/10/19.
//  Copyright © 2019 D2V iMac. All rights reserved.
//

import UIKit

protocol OrderStatusDelegate {
    func orderStatusChanged(id: String, row: Int)
   }

class OrderHistoryDetailVC: UIViewController {
    
   
    var orderDelegate: OrderStatusDelegate?

    var orderDetailData: OrderDetails! = nil
    var orderRow = Int()
    var orderStatusNow = ""
    
    @IBOutlet weak var orderIDLbl: UILabel!
    @IBOutlet weak var pricessingCircle: UILabel!
    @IBOutlet weak var processingPipe: UIView!
    @IBOutlet weak var shippingCircle: UILabel!
    @IBOutlet weak var shippingPipe: UIView!
    @IBOutlet weak var deliveryCircle: UILabel!
    @IBOutlet weak var deliveryPipe: UIView!
    
    @IBOutlet weak var processingBtn: UIButton!
    @IBOutlet weak var shippingBtn: UIButton!
    @IBOutlet weak var deliveryBtn: UIButton!
    
    @IBOutlet weak var receivedLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderIDLbl.text = orderDetailData.orderID
        
        if orderDetailData.orderStatus == "1" {
            loadProcessing()
        }else if orderDetailData.orderStatus == "2" {
            loadShipped()
        }else if orderDetailData.orderStatus == "3" {
            loadDelivery()
        }

    }
    @IBAction func processingAction(_ sender: Any) {
        loadProcessing()
        
    }
    
    @IBAction func shippingAction(_ sender: Any) {
        loadShipped()
    }
    @IBAction func deliveryAction(_ sender: Any) {
        loadDelivery()
    }
    
    func loadProcessing() {
        
        pricessingCircle.backgroundColor = .green
        processingPipe.backgroundColor = .green
        processingBtn.backgroundColor = .green
        
        shippingCircle.backgroundColor = .lightGray
        shippingPipe.backgroundColor = .lightGray
        shippingBtn.backgroundColor = .lightGray
        
        deliveryCircle.backgroundColor = .lightGray
        deliveryPipe.backgroundColor = .lightGray
        deliveryBtn.backgroundColor = .lightGray
        
        receivedLbl.text = "Order Processing"
        receivedLbl.backgroundColor = .lightGray
        
        orderStatusNow = "1"
        
        
    }
    
    func loadShipped() {
        
        pricessingCircle.backgroundColor = .green
        processingPipe.backgroundColor = .green
        processingBtn.backgroundColor = .green
        
        shippingCircle.backgroundColor = .green
        shippingPipe.backgroundColor = .green
        shippingBtn.backgroundColor = .green
        
        deliveryCircle.backgroundColor = .lightGray
        deliveryPipe.backgroundColor = .lightGray
        deliveryBtn.backgroundColor = .lightGray
        
        receivedLbl.text = "Order Shipping"
        receivedLbl.backgroundColor = .lightGray
        
        orderStatusNow = "2"
    }
    
    func loadDelivery() {
        
        pricessingCircle.backgroundColor = .green
        processingPipe.backgroundColor = .green
        processingBtn.backgroundColor = .green
        
        shippingCircle.backgroundColor = .green
        shippingPipe.backgroundColor = .green
        shippingBtn.backgroundColor = .green
        
        deliveryCircle.backgroundColor = .green
        deliveryPipe.backgroundColor = .green
        deliveryBtn.backgroundColor = .green
        
        receivedLbl.text = "Order Delivered"
        receivedLbl.backgroundColor = .green
        
        orderStatusNow = "3"
    }
    
    @IBAction func continueAction(_ sender: Any) {

        orderDelegate?.orderStatusChanged(id: orderStatusNow, row: orderRow)
        self.navigationController?.popViewController(animated: true)
    }
}
