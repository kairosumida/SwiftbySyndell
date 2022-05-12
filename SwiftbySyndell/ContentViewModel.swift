//
//  ContentViewModel.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 12/05/22.
//

import SwiftUI
//1Adicionar um if com o novo exercicio
//2Adicionar uma nova func dentro da extension com o nome do treinamento +View()
//3Criar no router o metodo make+"NomeDaView"
class ContentViewModel : ObservableObject{
    func RecebeUmExercicio(nome: String) -> some View{
        if(nome == "GuideToTheSwiftUILayoutSystem"){
            return GuideToTheSwiftUILayoutSystemView()
        }
        
        return GuideToTheSwiftUILayoutSystemView()
    }
}
extension ContentViewModel{
    func GuideToTheSwiftUILayoutSystemView() -> some View{
        return ContentViewRouter.makeGuideToTheSwiftUILayoutSystemView()
    }
    
}
