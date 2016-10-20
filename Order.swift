//
//  Order.swift
//  iosBenchmark
//
//  Created by SMG on 19/10/2016.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class Order: NSObject {
    var Id: Int
    var Account: String
    var Product: String
    var Price: Double
    
    init(id: Int, account: String, product: String, price: Double) {
        self.Id = id
        self.Account = account
        self.Product = product
        self.Price = price
    }
}
