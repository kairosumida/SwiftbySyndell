//
//  Product.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 23/05/22.
//

import Foundation

public struct Product{
    public var price: Int
}
open class OpenPriceCalculator{
    public init(){}
    
    open func calculatePrice(for products: [Product]) -> Int{
        products.reduce(into: 0) {totalPrice, product in
            totalPrice += product.price
            
        }
    }
}
