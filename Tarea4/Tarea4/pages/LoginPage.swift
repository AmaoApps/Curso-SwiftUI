//
//  LoginPage.swift
//  Tarea4
//
//  Created by Paku on 30/05/21.
//

import SwiftUI

struct LoginPage: View {
    
    @State var usuario : UserProfile = UserProfile.init(mock: true)
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .bottomLeading, endPoint: .topTrailing)
                VStack(){
                    HeaderLogin()
                    LoginMainForm(usuario: $usuario)
                }
            }.ignoresSafeArea()
        }
    }
}

struct LoginMainForm: View {
    
    @Binding var usuario : UserProfile
    
    var body: some View {
        VStack{
            //Form - TextField - Username
            HStack{
                Image(systemName: "envelope.fill").padding()
                TextField("Correo electrónico", text: $usuario.email)
                    .keyboardType(.emailAddress)
            }
            .background(Color.white)
            .cornerRadius(20)
            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            //Form - TextField - password
            HStack{
                Image(systemName: "key.fill").padding()
                SecureField("Contraseña", text: $usuario.password)
                    .keyboardType(.default)
            }
            .background(Color.white)
            .cornerRadius(20)
            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            //Form - TextField - ButtonLogin
            
            NavigationLink(destination: MainPage(usuario: usuario)){
                VStack{
                    Text("Ingresar")
                        .padding()
                        .frame(width: 150, height: 40, alignment: .center)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
            
        }
    }
}

struct HeaderLogin: View {
    var body: some View {
        VStack{
            Text("Bienvenido!")
                .font(Font.custom("Arial", size: 32.0 ))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Image("iconmain")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
        }.padding()
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
