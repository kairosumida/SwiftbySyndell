//
//  GuideToTheSwiftUILayoutSystemView.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 12/05/22.
//

import SwiftUI

struct GuideToTheSwiftUILayoutSystemView: View {
    @ObservedObject var viewModel: GuideToTheSwiftUILayoutSystemViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GuideToTheSwiftUILayoutSystemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = GuideToTheSwiftUILayoutSystemViewModel()
        GuideToTheSwiftUILayoutSystemView(viewModel: viewModel)
    }
}
