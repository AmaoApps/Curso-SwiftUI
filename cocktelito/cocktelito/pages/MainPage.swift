//
//  MainPage.swift
//  cocktelito
//
//  Created by Paku on 3/07/21.
//

import SwiftUI
import CoreData

struct MainPage: View {
    
    @State var usuarioLoged: Usuario
    @ObservedObject var viewModel : MainViewModel
    
    init(usuarioLoged: Usuario) {
        //Configuracion de la fuente del Navigation Bar Title
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: ConstantsCocktelito.font_berkshire, size: CGFloat(32))!]
        
        viewModel = MainViewModel(context: PersistenceController.shared.container.viewContext)
        
        //print("Usuario Logeado -> " + usuarioLoged.name)
        self.usuarioLoged = usuarioLoged
        self.viewModel.getRandomCocktail()
    }
    
    var body: some View {
        TabView {
            NavigationView{
                ScrollView{
                    VStack{
                        HeaderCocktailRandom(viewModel: viewModel)
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
    
    @ObservedObject var viewModel : MainViewModel
    @State private var spinLoading = false
    
    var body: some View {
                
        VStack{
            Text("Tu cocktail del día")
            if viewModel.daylyRandomCocktail.id != "" {
                Text("Actualizado => " + (viewModel.daylyRandomCocktail.name ?? "Unknow"))
            } else {
                Text("Aun vacio")
                Circle()
                    .trim(from: 1/4, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color(ConstantsCocktelito.color_background_splash))
            }
        }
        
        
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage(usuarioLoged: Usuario(mock: true))
    }
}
