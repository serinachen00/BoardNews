//
//  ShoppingViewController.swift
//  BoardNews
//
//  Created by JianQiao Xie on 5/17/20.
//  Copyright © 2020 Serina Chen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ShoppingViewController: UIViewController {
    @IBOutlet weak var ShoppingTableView: UITableView!
    var DescriptionList = [String]()
        var NameList = [String]()
        var imageURLList = [String]()
        var ProductURLList = [String]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            ShoppingTableView.delegate = self
            ShoppingTableView.dataSource = self
            
            self.ShoppingTableView.reloadData()
            
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            getProductData { (success) in
                if success {
                    print("connect perfectly")
               
                    self.ShoppingTableView.reloadData()
                    print(self.imageURLList.count)
                } else {
                    print("connect fail")
                }
            }
            
        }
    }

    extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource {
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
           return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return imageURLList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = ShoppingTableView.dequeueReusableCell(withIdentifier: "ProductListCell", for: indexPath) as? ProductListCell else { return UITableViewCell() }
            
            var Name = String()
            var Description = String()
            
            
            if DescriptionList.count > 0 {
                 Description = DescriptionList[indexPath.row]
            } else {
                 Description = ""
            }
            
            if NameList.count > 0 {
                Name = NameList[indexPath.row]
            } else {
                Name = ""
            }
        
            if imageURLList.count > 0 {
                
            cell.ProductImage.sd_setImage(with: URL(string: imageURLList[indexPath.row])) { (image, error, cache, urls) in
                if (error != nil) {
                        cell.ProductImage.image = UIImage(named: "newsPlaceholder")
                } else {
                      cell.ProductImage.image = image
                    }
                }
                
            } else {
                cell.ProductImage.image = UIImage(named: "newsPlaceholder")!
            }
            
            
            cell.ProductImage.layer.cornerRadius = 8
            
            cell.configureCell(ProductDescription: Description, ProductName: Name)
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let indexPath = tableView.indexPathForSelectedRow
            
            let urls = ProductURLList[(indexPath?.row)!]
        
            UIApplication.shared.open( URL(string: urls)!, options: [:] ) { (success) in
                if success {
                    print("go to the product link")
                }
            }
            
            
        }
        
    }

    extension ShoppingViewController {
        
        func getProductData(complete: @escaping (_ status: Bool) -> ()) {
          
            let url = "http://makeup-api.herokuapp.com/api/v1/products.json"
            AF.request(url, method: .get).responseJSON { (response) in
               
                switch response.result {
                  
                  case .success(let value):
                    let json = JSON(value)
                   
                    for item in json[].arrayValue {
                        self.DescriptionList.append(item["description"].stringValue)
                        self.NameList.append(item["name"].stringValue)
                        self.imageURLList.append(item["image_link"].stringValue)
                        self.ProductURLList.append(item["product_link"].stringValue)
                    }
                   complete(true)
                
                  case .failure(let error):
                    complete(false)
                    print(error)
               
               }
        
         }
      }
        
}
