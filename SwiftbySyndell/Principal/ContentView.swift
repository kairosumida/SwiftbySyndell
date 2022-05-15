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
        
        NavigationView{
            List(swiftbySyndells){ data in
                
                NavigationLink(destination: {
                    viewModel.RecebeUmExercicio(selecao: data.id)
                }, label: {
                    ContentRow(swiftbysindelData: data)
                }
                )
                               
                               
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
