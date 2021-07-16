//
//  SplashPage.swift
//  cocktelito
//
//  Created by Paku on 28/06/21.
//

import SwiftUI
import CoreData

struct SplashPage: View {
    
    @State var animate = false
    @State var endSplash = false
    
    @ObservedObject var viewModel : SplashViewModel
    
    init() {
        viewModel = SplashViewModel(context: PersistenceController.shared.container.viewContext)
    }
    
    var body: some View {
            ZStack {
                if(viewModel.usuarioLogeado != nil){
                    MainPage(usuarioLoged: viewModel.usuarioLogeado!)
                        .ignoresSafeArea(.all)
                } else {
                    LoginPageView()
                        .ignoresSafeArea(.all)
                        .background(Color.black.opacity(0.6).ignoresSafeArea(.all))
                }
                ZStack{
                    Color(ConstantsCocktelito.color_background_splash)
                    Image(ConstantsCocktelito.icon_splash_large)
                        .resizable()
                        .frame(width:  CGFloat(85.0), height:  CGFloat(85.0))
                    
                }
                .ignoresSafeArea(.all)
                .onAppear(perform: animationSplash)
                // Hiding view after finished
                .opacity(endSplash ? 0 : 1)
            }
    }
    
    
    func animationSplash(){
        viewModel.validarUsuarioLogeado()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeOut(duration: 0.45)){
                animate.toggle()
            }
            
            withAnimation(Animation.linear(duration: 0.25)){
                endSplash.toggle()
            }
        }
    }
    
}

struct SplashPage_Previews: PreviewProvider {
    static var previews: some View {
        SplashPage()
    }
}
