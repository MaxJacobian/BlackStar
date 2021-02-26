//
//  Persistance.swift
//  BlackStar
//
//  Created by Maksym on 25.02.2021.
//

import Foundation
import UIKit
import RealmSwift

class ProductData: Object {
    @objc dynamic var size = String()
    @objc dynamic var color = String()
    @objc dynamic var name = String()
    @objc dynamic var image = UIImage()
    @objc dynamic var price = String()
    @objc dynamic var id = Int()
    
    static func setProduct(size:String,color: String,name: String,image: UIImage,price: String, id: Int)->ProductData{
        let product = ProductData()
        product.color = color
        product.image = image
        product.name = name
        product.size = size
        product.price = price
        product.id = id

        return product
    }
}


class Persistance {
    
        static let shared = Persistance()
        let relam = try! Realm()
        var storage: [ProductData] = []
    
    func   add(product:[ProductData]){
            for prod in product {
                try! relam.write(){
                    relam.add(prod)
                }
            }
            
        }
        func loadedData() ->[ProductData]{
            for prod in relam.objects(ProductData.self){
                storage.append(prod)
            }
            return storage
        }
    func remove(idRemove: Int){
            let allProduct = relam.objects(ProductData.self)
            for product in  allProduct {
                if product.id == idRemove {
                    try! relam.write(){
                        relam.delete(product)
                    }
            
                }
            }
        } 
}
