//
//  ContentRow.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 12/05/22.
//

import SwiftUI

struct ContentRow: View {
    var swiftbysindelData: SwiftBySindelModel
    var body: some View{
        HStack{
            
            Text(swiftbysindelData.name)
                
            VStack{
                Text(swiftbysindelData.startDate)
                Text(swiftbysindelData.finishedDate)
            }
        }.frame(width: .infinity, height: 50)
            .background(Color.green)
            .padding(.vertical, 5.0)
    }
}

struct ContentRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentRow(swiftbysindelData: swiftbySyndells[0])
    }
}
