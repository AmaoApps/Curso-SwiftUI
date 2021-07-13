//
//  MainPage.swift
//  cocktelito
//
//  Created by Paku on 3/07/21.
//

import SwiftUI
import CoreData
import URLImage

struct MainPage: View {
    
    @State var usuarioLoged: Usuario
    @ObservedObject var viewModel : MainViewModel
    
    init(usuarioLoged: Usuario) {
        //Configuracion de la fuente del Navigation Bar Title
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: ConstantsCocktelito.font_berkshire, size: CGFloat(32))!, .foregroundColor: UIColor(Color(ConstantsCocktelito.color_accent))]
        viewModel = MainViewModel(context: PersistenceController.shared.container.viewContext)
        
        //print("Usuario Logeado -> " + usuarioLoged.name)
        self.usuarioLoged = usuarioLoged
        self.viewModel.getRandomCocktail()
        self.viewModel.getListRestoBars()
    }
    
    var body: some View {
        TabView {
            NavigationView{
                ScrollView{
                    VStack{
                        HeaderCocktailRandom(viewModel: viewModel)
                        //Text("Usuario Loged .~ " + usuarioLoged.name)
                        RestoBarList(viewModel: viewModel)
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
            HStack{
                Text(ConstantsCocktelito.string_main_page_title_random).font(.title3).bold().padding(.top).padding(.leading)
                Spacer()
            }
            if viewModel.daylyRandomCocktail.id != "" {
                HStack{
                    let url : URL = URL(string: viewModel.daylyRandomCocktail.pathImage!)!
                        URLImage(url){ image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                                .padding(.leading)
                                .padding(.trailing)
                        }
                    VStack(alignment: .leading){
                        Text(viewModel.daylyRandomCocktail.name!).font(.custom(ConstantsCocktelito.font_berkshire, size: CGFloat(24)))
                        Text(viewModel.daylyRandomCocktail.instructions ?? "No tiene instruncciones").multilineTextAlignment(.leading)
                    }.padding(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                }
            } else {
                LoadingProgress(spinLoading: $spinLoading)
            }
        }
        
        
    }
}

struct LoadingProgress: View {
    
    @Binding var spinLoading : Bool
    
    var body: some View {
        
            Circle()
                .trim(from: 1/4, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(ConstantsCocktelito.color_accent))
                .frame(width: 40, height: 40)
                .rotationEffect(.degrees(spinLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear(){
                    self.spinLoading.toggle()
                }
    }
}

struct RestoBarList : View {
    
    @ObservedObject var viewModel : MainViewModel
    
    var body: some View{
        VStack{
            HStack{
                Text(ConstantsCocktelito.string_main_page_bars).font(.title3).bold().padding(.top).padding(.leading)
                Spacer()
            }
            
            ForEach(viewModel.listRestoBars){ restoBar in
                ZStack{
                    let url : URL = URL(string: restoBar.pathImage)!
                    URLImage(url){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .padding(.leading)
                            .padding(.trailing)
                            .overlay(Text(restoBar.name).font(.custom(ConstantsCocktelito.font_berkshire, size: CGFloat(24)))
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 0)),
                                     alignment: .bottomLeading)
                    }
                }
                HStack{
                    Label("\(restoBar.likes)", systemImage:"suit.heart.fill")
                    Spacer()
                    Label("\(restoBar.schedule)", systemImage:"timer")
                }
                .padding(EdgeInsets(top:0, leading:16, bottom:0, trailing:16))
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage(usuarioLoged: Usuario(mock: true))
    }
}
