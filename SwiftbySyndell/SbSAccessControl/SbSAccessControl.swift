//
//  SbSAccessControl.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 22/05/22.
//

import SwiftUI
//https://www.swiftbysundell.com/basics/access-control/
struct SbSAccessControl: View {
    var body: some View {
        ZStack{
            VStack{
                Text(Execucao1())
                Text(Execucao2())
                Text(Execucao3())
                
            }
        }
    }
}
func Execucao1() -> String{
    var prCalc = PriceCalculator()
    var prod: [Product] = []
    prod.append(Product(price: 10))
    prod.append(Product(price: 11))
    prod.append(Product(price: 21))
    return "Preco: " + String(prCalc.calculatePrice(for: prod))
}
func Execucao2() -> String{
    var pubPricCalc = PublicPriceCalculator()
    var prod: [Product] = []
    prod.append(Product(price: 30))
    prod.append(Product(price: 21))
    prod.append(Product(price: 51))
    return "Preco: " + String(pubPricCalc.calculatePrice(for: prod))
}
func Execucao3() -> String{
    var discPCalc = DiscountedPriceCalculator(discount: 10)
    var prod: [Product] = []
    prod.append(Product(price: 30))
    prod.append(Product(price: 21))
    prod.append(Product(price: 51))
    return "Preco: " + String(discPCalc.calculatePrice(for: prod))
}

struct SbSAccessControl_Previews: PreviewProvider {
    static var previews: some View {
        SbSAccessControl()
    }
}
class PriceCalculator {
    func calculatePrice(for products: [Product]) -> Int {
        products.reduce(into: 0) { totalPrice, product in
            totalPrice += product.price
        }
    }
}
public class PublicPriceCalculator {
    public init() {}

    public func calculatePrice(for products: [Product]) -> Int {
        products.reduce(into: 0) { totalPrice, product in
            totalPrice += product.price
        }
    }
}
class DiscountedPriceCalculator: PriceCalculator {
    fileprivate let discount: Int

    init(discount: Int) {
        self.discount = discount
        super.init()
    }

    override func calculatePrice(for products: [Product]) -> Int {
        let price = super.calculatePrice(for: products)
        return price - discount
    }
}
extension UIAlertController {
    func showPriceDescription(
        for products: [Product],
        calculator: DiscountedPriceCalculator
    ) {
        let price = calculator.calculatePrice(for: products)

        // We can now access 'discount' even outside of the type
        // that it's declared in, thanks to 'fileprivate':
        message = """
        Your \(products.count) product(s) will cost \(price).
        Including a discount of \(calculator.discount).
        """
    }
}
