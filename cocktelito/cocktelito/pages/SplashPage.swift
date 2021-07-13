//
//  SplashPage.swift
//  cocktelito
//
//  Created by Paku on 28/06/21.
//

import SwiftUI

struct SplashPage: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
            ZStack {
                
                LoginPageView()
                    .ignoresSafeArea(.all, edges: .top)
                    .background(Color.black.opacity(0.6).ignoresSafeArea(.all, edges: .all))
                ZStack{
                    Color(ConstantsCocktelito.color_background_splash)
                    Image(ConstantsCocktelito.icon_splash_large)
                        .resizable()
                        .frame(width:  CGFloat(85.0), height:  CGFloat(85.0))
                    
                }
                .ignoresSafeArea(.all, edges: .all)
                .onAppear(perform: animationSplash)
                // Hiding view after finished
                .opacity(endSplash ? 0 : 1)
            }
    }
    
    
    func animationSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeOut(duration: 0.25)){
                animate.toggle()
            }
            
            withAnimation(Animation.linear(duration: 0.15)){
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
