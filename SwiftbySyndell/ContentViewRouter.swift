//
//  ContentViewRouter.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 12/05/22.
//

import SwiftUI
enum ContentViewRouter{
    static func makeGuideToTheSwiftUILayoutSystemView() -> some View{
        let viewModel = GuideToTheSwiftUILayoutSystemViewModel()
        return GuideToTheSwiftUILayoutSystemView(viewModel: viewModel)
    }
}
