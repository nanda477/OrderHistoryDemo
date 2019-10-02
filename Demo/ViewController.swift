//
//  ViewController.swift
//  Demo
//
//  Created by D2V iMac on 02/10/19.
//  Copyright © 2019 D2V iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orderHistoryTableView: UITableView!
    var orderHistory = [OrderDetails]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Order History"
        //orderStatus
        //1- processing
        //2- shipped
        //3- Delivered
        
        //orderPayType
        //1- Cash
        //2- Online - DebitCard
        //3- Paypal
        
        let order1 = OrderDetails(orderID: "#PND12345", orderStatus: "1", orderDate: String(describing: Date()), orderPayType: "1")
        let order2 = OrderDetails(orderID: "#PND67890", orderStatus: "2", orderDate: String(describing: Date()), orderPayType: "2")
        let order3 = OrderDetails(orderID: "#PND54321", orderStatus: "3", orderDate: String(describing: Date()), orderPayType: "3")
        orderHistory.append(order1)
        orderHistory.append(order2)
        orderHistory.append(order3)
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource, OrderStatusDelegate {
    func orderStatusChanged(id: String, row: Int) {
        orderHistory[row].orderStatus = id
        // for reload one record
        let inPath = IndexPath(row: row, section: 0)
        orderHistoryTableView.reloadRows(at: [inPath], with: .fade)
        
        // for reload total tableview
            //orderHistoryTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let orderCell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryCell_ID") as! OrderHistoryCell
        orderCell.loadOrderHistory(data: orderHistory[indexPath.row])
        return orderCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let orderDetailVC = storyboard?.instantiateViewController(withIdentifier: "OrderHistoryDetailVC_ID") as! OrderHistoryDetailVC
        orderDetailVC.orderDetailData = orderHistory[indexPath.row]
        orderDetailVC.orderDelegate = self
        orderDetailVC.orderRow = indexPath.row
        self.navigationController?.pushViewController(orderDetailVC, animated: true)
    }
    
}

