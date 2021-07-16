//
//  ProfilePage.swift
//  cocktelito
//
//  Created by Paku on 14/07/21.
//

import SwiftUI

struct ProfilePage: View {
    
    @State var usuarioLogged : Usuario
    @ObservedObject var viewModel : ProfileViewModel
    
    init(usuarioLogged: Usuario) {
        viewModel = ProfileViewModel(context: PersistenceController.shared.container.viewContext)
        self.usuarioLogged = usuarioLogged
    }
    
    var body: some View {
        VStack{
            Text("Perfil").font(.title2)
            Text(usuarioLogged.name)
            Text(usuarioLogged.email)
            
            Button(action: {
                viewModel.cerrarSesion(email: usuarioLogged.email)
            }, label: {
                Text("Cerrar sesión")
                    .font(.title3)
                    .bold()
                    .textCase(.uppercase)
                    .padding(.vertical)
                    .frame(maxWidth:.infinity)
            })
            .foregroundColor(.white)
            .background(Color.green)
            .clipShape(Capsule())
            .shadow(radius: 10)
            .padding()
            
            Spacer()
            
            
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        let user = Usuario()
        ProfilePage(usuarioLogged: user)
    }
}
