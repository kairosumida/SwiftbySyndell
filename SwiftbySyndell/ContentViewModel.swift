//
//  ContentViewModel.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 12/05/22.
//

import SwiftUI

class ContentViewModel : ObservableObject{
    init(){
        
    }
}
extension ContentViewModel{
    func GuideToTheSwiftUILayoutSystemView() -> some View{
        return ContentViewRouter.makeGuideToTheSwiftUILayoutSystemView()
    }
}
