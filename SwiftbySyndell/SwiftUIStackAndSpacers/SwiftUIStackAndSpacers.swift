//
//  SwiftUIStackAndSpacers.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 13/05/22.
//

import SwiftUI

struct SwiftUIStackAndSpacers: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing)
        {
            VStack{
                TopView()
                Spacer()
            }
            Text("A new layer")
        }.padding()
    }
    
    
    struct TopView: View{
        var body: some View{
            HStack{
                VStack{
                    Text("SwiftUI")
                    Text("Layout")
                    Spacer()
                    
                }
                Spacer()
                Image(systemName: "Star")
            }
        }
    }
}

struct SwiftUIStackAndSpacers_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStackAndSpacers()
    }
}
