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
    
    
    
    func RecebeUmExercicio(selecao: Int) -> some View{
        /*Sempre que um exercicio for realizado, adicione um case 'id':
         retorn AnyView('nomeDaView'())
         Pronto o exercicio está adicionado
         */
        switch(selecao){
        case 0:
            return AnyView(GuideToTheSwiftUILayoutSystem())
        case 1:
            return AnyView(SwiftUIStackAndSpacers())
        case 2:
            return AnyView(ExploreTheBasicOfSwiftUI())
        case 3:
            return AnyView(SbSCodable())
        case 4:
            return AnyView(SbSEquality())
        case 5:
            return AnyView(SbSLoops())
        case 6:
            return AnyView(SbSAvailabilityChecks())
        case 7:
            return AnyView(SbSAccessControl())
        default:
            return AnyView(EmptyView())
        }
       
    }
}




