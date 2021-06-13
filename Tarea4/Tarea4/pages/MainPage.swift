//
//  MainPage.swift
//  Tarea4
//
//  Created by Paku on 13/06/21.
//

import SwiftUI

struct MainPage: View {
    
    @State var usuario : UserProfile
    
    var body: some View {
        NavigationView{
            VStack{
                Text("\(usuario.names)")
                Spacer()
            }
            .navigationBarTitle("Perú's Schools")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: ViewerProfile(usuario: usuario))
        }
    }
}

struct ViewerProfile: View {
    
    var usuario : UserProfile
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "person.fill")
        })
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage(usuario: UserProfile.init(mock: true))
    }
}
