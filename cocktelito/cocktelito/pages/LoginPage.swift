//
//  ContentView.swift
//  cocktelito
//
//  Created by Paku on 13/06/21.
//

import SwiftUI
import CoreData

struct LoginPageView: View {
    
    @State var usuario: Usuario = Usuario(mock: false)
    
    @ObservedObject var viewModel : LoginViewModel
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>

    init() {
        viewModel = LoginViewModel(context: PersistenceController.shared.container.viewContext)
    }
    
    var body: some View {
        
        if viewModel.isLogin {
            MainPage(usuarioLoged: viewModel.usuarioVerificado)
        } else {
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
                        LoginManager(viewModel: viewModel, usuarioParaValidar: $usuario)
                        TextToRegisterUser()
                    }.padding()
                    
                    
                }
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

struct LoginManager: View {
    
    @ObservedObject var viewModel : LoginViewModel
    @Binding var usuarioParaValidar : Usuario
    
    var body: some View {
        
        switch viewModel.state {
            case .idle:
                ButtonLogin(viewModel: viewModel, usuarioParaValidar: $usuarioParaValidar, isDisabled: false)
            case .loading:
                ButtonLogin(viewModel: viewModel, usuarioParaValidar: $usuarioParaValidar, isDisabled: true)
            case .loaded(let usuarioVerificado):
                //TODO GO TO MAIN SCREEN
                Text("Usuario Encontrado con ID -> \(usuarioVerificado.id) con nombre de \(usuarioVerificado.name) ")
                    
            case .failed(let mensaje):
                ButtonLogin(viewModel: viewModel, usuarioParaValidar: $usuarioParaValidar, isDisabled: false)
                Text(mensaje)
        }
    }
    
}

struct ButtonLogin: View {
    
    @ObservedObject var viewModel : LoginViewModel
    @Binding var usuarioParaValidar : Usuario
    @State var isDisabled : Bool
        
    var body: some View {
        
        Button(action: {
            viewModel.validarUsuario(email: usuarioParaValidar.email, pass: usuarioParaValidar.password)
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
        .disabled(isDisabled)
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
