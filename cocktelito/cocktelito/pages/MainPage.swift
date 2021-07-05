//
//  MainPage.swift
//  cocktelito
//
//  Created by Paku on 3/07/21.
//

import SwiftUI

struct MainPage: View {
    
    @State var usuarioLoged: Usuario
    
    init(usuarioLoged: Usuario) {
        //Configuracion de la fuente del Navigation Bar Title
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: ConstantsCocktelito.font_berkshire, size: CGFloat(32))!]
        
        print("Usuario Logeado -> " + usuarioLoged.name)
        
        let service = CocktailService()
        service.getRandomCocktail()
        self.usuarioLoged = usuarioLoged
        
    }
    
    var body: some View {
        TabView {
            NavigationView{
                ScrollView{
                    VStack{
                        HeaderCocktailRandom()
                        Text("Usuario Loged .~ " + usuarioLoged.name)
                        Spacer()
                    }
                }
                .navigationBarTitle(Text(ConstantsCocktelito.string_app_name))
                .navigationBarTitleDisplayMode(.inline)
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
        MainPage(usuarioLoged: Usuario(mock: true))
    }
}
