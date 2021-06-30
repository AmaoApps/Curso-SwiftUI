//
//  ContentView.swift
//  cocktelito
//
//  Created by Paku on 13/06/21.
//

import SwiftUI
import CoreData

struct LoginPageView: View {
    
    @State var usuario: Usuario = Usuario(mock: true)
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>

    var body: some View {
        NavigationView {
            ZStack{
                Color.white
                VStack(spacing: 10){
                    Image(ConstantsCocktelito.icon_splash_large)
                        .resizable()
                        .frame(width: 180, height: 180, alignment: .center)
                    Text(ConstantsCocktelito.string_app_name)
                        .font(.custom(ConstantsCocktelito.font_berkshire, size: CGFloat(48)))
                    Spacer().frame(height: 50)
                    //Formulario
                    FormLogin(iconName: "envelope", placeHolder: "Email", txtForm: $usuario.email)
                    FormLoginPass(iconName: "lock", placeHolder: "Contraseña", pass: $usuario.password)
                    ButtonLogin()
                    TextToRegisterUser()
                }.padding()
                
                
            }
        }
    }


}

struct FormLogin: View {
    
    var iconName : String
    var placeHolder: String
    @Binding var txtForm: String
    //var keyType: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName).padding(.leading)
            Divider()
            TextField(placeHolder, text: $txtForm)
                .frame(maxWidth: .infinity)
        }.frame(width: .infinity, height: 50, alignment: .center)
        .overlay(
            RoundedRectangle(cornerRadius: 10.0).stroke())
    }
}

struct FormLoginPass: View {
    
    var iconName : String
    var placeHolder: String
    @Binding var pass: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName).padding(.leading)
            Divider()
            SecureField(placeHolder, text: $pass)
                .frame(maxWidth: .infinity)
        }.frame(width: .infinity, height: 50, alignment: .center)
        .overlay(
            RoundedRectangle(cornerRadius: 10.0).stroke())
    }
    
}

struct ButtonLogin: View {
    
    var body: some View {
        
        Button(action: {
            //TODO
        }, label: {
            Text(ConstantsCocktelito.string_btn_login)
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
        
    }
    
}

struct TextToRegisterUser : View {
    var body : some View {
        NavigationLink(
            destination: SignUpPage(),
            label: {
                Text(ConstantsCocktelito.string_to_register)
                    .foregroundColor(.blue )
            }
        ).navigationBarBackButtonHidden(false)
    }
}



struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
            .previewDevice("iPhone 11 Pro")
    }
}
