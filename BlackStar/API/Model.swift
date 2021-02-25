//
//  Model.swift
//  BlackStar
//
//  Created by Maksym on 25.02.2021.
//

import Foundation
import Alamofire


// MARK: - CategoryValue
struct CategoryValue: Codable {
    let name: String
    let sortOrder: SortOrder
    let image, iconImage, iconImageActive: String
    let subcategories: [Subcategory]
}

enum SortOrder: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(SortOrder.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SortOrder"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Subcategory
struct Subcategory: Codable {
    let id: SortOrder
    let iconImage: String
    let sortOrder: SortOrder
    let name: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case category = "Category"
    case collection = "Collection"
}

typealias Category = [String: CategoryValue]

protocol CategoryProtocol {
   func getCategory(category: Category)
}

class Model {
    
    var delegate: CategoryProtocol?
    
    func loadedCategory(){
        AF.request("https://blackstarshop.ru/index.php?route=api/v1/categories").responseJSON{
            response in guard let data = response.data else {return}
            let category = try! JSONDecoder().decode(Category.self, from: data)
            self.delegate?.getCategory(category: category)
        }
    }
}
