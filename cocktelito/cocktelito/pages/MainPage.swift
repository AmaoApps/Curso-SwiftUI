//
//  MainPage.swift
//  cocktelito
//
//  Created by Paku on 3/07/21.
//

import SwiftUI

struct MainPage: View {
    
    @State var usuarioLoged: Usuario
    
    var body: some View {
        TabView {
            ScrollView{
                VStack{
                    HeaderCocktailRandom()
                    Spacer()
                }
            }.tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }
            Text("Search Screen")
                .tabItem {
                    Label("Busqueda", systemImage: "magnifyingglass.circle.fill")
                }
            Text("Profile Screen")
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
    }
}

struct HeaderCocktailRandom : View {
    
    var body: some View {
            Text("Cocktail ramdon Module")
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        let usuario : Usuario = Usuario(mock: true)
        MainPage(usuarioLoged: usuario)
    }
}
