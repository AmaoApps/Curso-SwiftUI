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
        if(endSplash) {
            LoginPageView()
        } else {
            ZStack{
                Color(ConstantsCocktelito.color_background_splash)
                Image(ConstantsCocktelito.icon_splash_large)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : CGFloat(85.0), height: animate ? nil : CGFloat(85.0))
                
                // Scaling View
                    .scaleEffect(animate ? 3 : 1)
                // Setting width to avoid over size
                    .frame(width: UIScreen.main.bounds.width)
                
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
