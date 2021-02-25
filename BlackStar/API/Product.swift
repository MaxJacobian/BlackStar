//
//  Product.swift
//  BlackStar
//
//  Created by Maksym on 25.02.2021.
//

import Foundation
import Alamofire

// MARK: - ProductValue
struct ProductValue: Codable {
    var name, productDescription, colorName, mainImage: String
    var productImages: [ProductImage]
    var offers: [Offer]
    var price: String

    enum CodingKeys: String, CodingKey {
        case name
        case productDescription = "description"
        case colorName, mainImage, productImages, offers, price
    }
}

// MARK: - Offer
struct Offer: Codable {
    var size, quantity: String
}

// MARK: - ProductImage
struct ProductImage: Codable {
    var imageURL: String
}

typealias Product = [String: ProductValue]





protocol ProductProtocol {
    func getProduct(product: Product)
}

class ProductModel{
    var delegate: ProductProtocol?
    var id: Int
    init(id: Int) {
        self.id = id
    }
    func loadedProduct(){
        AF.request("https://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(self.id)").responseJSON{
            response in guard let data = response.data else  {return}
            let product: Product = try! JSONDecoder().decode(Product.self, from: data)
            self.delegate?.getProduct(product: product)
        }
    }
}



