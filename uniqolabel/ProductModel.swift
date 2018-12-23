//
//  ProductModel.swift
//  uniqolabel
//
//  Created by Choudhary, Subham on 23/12/18.
//  Copyright © 2018 Choudhary, Subham. All rights reserved.
//

import Foundation
import UIKit

class ProductModel {
    
    var image: UIImage
    var title: String
    var details: String
    
    init(image: UIImage, title: String, details: String) {
        self.image = image
        self.title = title
        self.details = details
    }
}
struct ProductModelData {
    
    var products = [ProductModel]()
    init() {
        update()
    }
    private mutating func update() {
        products.append(ProductModel(image: UIImage.init(imageLiteralResourceName: "chair"),
                                     title: "Chair",
                                     details: "You can view this chair in Augmented Reality"))
        products.append(ProductModel(image: UIImage.init(imageLiteralResourceName: "tv"),
                                     title: "TV",
                                     details: "This TV is made of German Technology"))
        products.append(ProductModel(image: UIImage.init(imageLiteralResourceName: "sofa"),
                                     title: "Sofa",
                                     details: "This sofa is made from Japanese Spring"))
        products.append(ProductModel(image: UIImage.init(imageLiteralResourceName: "bed"),
                                     title: "Bed",
                                     details: "Supperb bed with back pain asssistance"))
        products.append(ProductModel(image: UIImage.init(imageLiteralResourceName: "wardrobe"),
                                     title: "Wardrobe",
                                     details: "Made of Segun Wood, Hight quality wood"))
        
    }
}
