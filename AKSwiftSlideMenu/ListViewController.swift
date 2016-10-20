//
//  ListViewController.swift
//  iosBenchmark
//
//  Created by SMG on 17/10/2016.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class ListViewController: BaseViewController, UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var txtCount: UITextField!
    @IBOutlet weak var btnLoad: UIButton!
    
    @IBOutlet weak var tblList: UITableView!
    
    var orderItems = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        
        tblList.dataSource = self
        tblList.delegate = self
        
        loadData()
    }
    
    @IBAction func loadData(_ sender: UIButton) {
        loadData()
    }
    
    func loadData(){
        orderItems.removeAll()
        
        let count : Int = Int(txtCount.text!)!
        
        for i in 1..<count+1 {
            orderItems.append(Order(id: i, account: "Fatih Şimşek", product: "Computer", price: 25.5))
        }
        
        self.tblList.reloadData()
        txtCount.resignFirstResponder()
    }
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderItems.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath as IndexPath) as! MyCustomCell
        let item = orderItems[indexPath.row]
        
        cell.lblId.text = String(item.Id)
        cell.lblAccount.text = item.Account
        cell.lblProduct.text = item.Product
        cell.lblPrice.text = String(format:"%.2f", item.Price)
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
