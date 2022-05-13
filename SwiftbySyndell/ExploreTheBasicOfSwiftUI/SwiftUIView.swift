//
//  SwiftUIView.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 13/05/22.
//

import SwiftUI

struct SwiftUIView: View {
    
    
    var product: Product = Product(name: "teste", price: 100, image: UIImage(named: "teste.png")!)
    @State private var quantity = 1
    var body: some View {
        ZStack{
            ProductGradientView()
            VStack{
                ProductInfoView(product: product)
                Stepper("Quantity: \(quantity)", value: $quantity, in: 1...99)
            }.padding()
        }
    }
    
    
    
    struct Product{
        let name: String
        let price: Double
        let image: UIImage
    }
    struct ProductGradientView: View{
        var body: some View{
            LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
        }
    }
    struct ProductInfoView: View{
        var product: Product
        
        var body: some View{
            VStack{
                Image(uiImage: product.image).resizable().frame(width: 100, height: 100, alignment: .center)
                
                HStack{
                    Text(product.name).bold().lineLimit(2)
                    Text(String(product.price)).foregroundColor(.white)
                }
            }
        }
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
