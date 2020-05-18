//
//  ProductListCell.swift
//  BoardNews
//
//  Created by JianQiao Xie on 5/17/20.
//  Copyright © 2020 Serina Chen. All rights reserved.
//

import UIKit

class ProductListCell: UITableViewCell {

//    @IBOutlet weak var ProductName: UILabel!
//    @IBOutlet weak var ProductDescription: UILabel!
//    @IBOutlet weak var ProductImage: UIImageView!
    
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductDescription: UILabel!
    
    @IBOutlet weak var ProductImage: UIImageView!
    func configureCell( ProductDescription: String, ProductName: String) {
        
        self.ProductName.text = ProductName
        self.ProductDescription.text = ProductDescription
        
    }
}
