//
//  ContentView.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 12/05/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    var body: some View {
        ZStack{
            VStack{
                NavigationView{
                    ScrollView{
                        VStack{
                            NavigationLink(destination: viewModel.GuideToTheSwiftUILayoutSystemView, label: {Text("A guide to the SwiftUI layout system")})
                            
                        }
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ContentViewModel()
        ContentView(viewModel: viewModel)
    }
}
