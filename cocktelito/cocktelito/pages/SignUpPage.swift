//
//  SignUpPage.swift
//  cocktelito
//
//  Created by Paku on 29/06/21.
//

import SwiftUI

struct SignUpPage: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    @ObservedObject var viewModel : SignUpViewModel
    
    init() {
        viewModel = SignUpViewModel(context: PersistenceController.shared.container.viewContext)
    }
    
    var body: some View {
        VStack{
            Text(ConstantsCocktelito.string_signup_header)
                .multilineTextAlignment(.center)
                .font(.custom(ConstantsCocktelito.font_berkshire, size: CGFloat(48)))
                .padding(.top)
                .padding(.bottom)
            
            FormSignUp(usuario: $viewModel.newUsuario, vm: viewModel)
        }
        .navigationBarTitle(ConstantsCocktelito.string_signup_nv_title, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
    
}

struct FormSignUp : View {
    
    @Binding var usuario : Usuario
    @ObservedObject var vm : SignUpViewModel
    
    var body: some View {
        Form{
            Section(header: Text(ConstantsCocktelito.string_signup_form_header)){
                TextField(ConstantsCocktelito.string_signup_form_name, text: $usuario.name)
                TextField(ConstantsCocktelito.string_signup_form_email, text: $usuario.email)
                SecureField(ConstantsCocktelito.string_signup_form_pass, text: $usuario.password)
                SecureField(ConstantsCocktelito.string_signup_form_repass, text: $usuario.password)
                ButtonSignUp(usuarioToRegister: $usuario, vm: vm)
            }
        }
        
    }
}

struct ButtonSignUp : View {
    @Binding var usuarioToRegister : Usuario
    @ObservedObject var vm : SignUpViewModel
    
    var body: some View {
        Button(action: {
            vm.registrarNuevoUsuario(usuario: usuarioToRegister)
        }, label: {
            Text(ConstantsCocktelito.string_signup_form_signup)
                .font(.title3)
                .bold()
                .textCase(.uppercase)
                .padding(.vertical)
                .frame(maxWidth:.infinity)
        })
        .foregroundColor(.white)
        .background(vm.loading ? Color.gray : Color.green)
        .clipShape(Capsule())
        .shadow(radius: 10)
        .padding()
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
            .previewDevice("iPhone 11 Pro")
    }
}

