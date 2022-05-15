//
//  ContentViewRouter.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 12/05/22.
//

import SwiftUI
enum ContentViewRouter{
    static func makeGuideToTheSwiftUILayoutSystemView() -> some View{
        return GuideToTheSwiftUILayoutSystem()
    }
    static func makeSwiftUIStackAndSpacersView() -> some View{
        return SwiftUIStackAndSpacers()
    }
    static func makeExploreTheBasicOfSwiftUIView() -> some View{
        return ExploreTheBasicOfSwiftUI()
    }
}
