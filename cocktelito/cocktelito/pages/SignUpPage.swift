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
            
            FormSignUp(usuario: $viewModel.newUsuario, vm: viewModel)
            Spacer()
            SignUpManager(usuarioToRegister: $viewModel.newUsuario, vm: viewModel)
        }
        .navigationBarTitle(ConstantsCocktelito.string_signup_nv_title, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
    
}

struct FormSignUp : View {
    
    @Binding var usuario : Usuario
    @ObservedObject var vm : SignUpViewModel
    @State var isPassShowed : Bool = false
    
    var body: some View {
        Form{
            Section(header:
                        VStack(alignment: .center){
                            Text(ConstantsCocktelito.string_signup_header)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .font(.custom(ConstantsCocktelito.font_berkshire, size: CGFloat(36)))
                                .padding(.top)
                                .padding(.bottom)
                            //Image(systemName: "star.fill")
                            Text(ConstantsCocktelito.string_signup_form_header)
                        }.frame(maxWidth: .infinity)
                ){
                TextField(ConstantsCocktelito.string_signup_form_name, text: $usuario.name)
                TextField(ConstantsCocktelito.string_signup_form_email, text: $usuario.email)
                ZStack(alignment: .trailing){
                    if !isPassShowed {
                        SecureField(ConstantsCocktelito.string_signup_form_pass, text: $usuario.password)
                    } else {
                        TextField(ConstantsCocktelito.string_signup_form_pass, text: $usuario.password)
                    }
                    Button(action: {
                        isPassShowed.toggle()
                    }, label: {
                        Image(systemName: self.isPassShowed ? "eye.slash" : "eye").accentColor(.gray)
                    })
                }
                
                //ButtonSignUp(usuarioToRegister: $usuario, vm: vm)
            }
        }
        
    }
}

struct SignUpManager : View {
    @State var isLoading : Bool = false
    @Binding var usuarioToRegister : Usuario
    @ObservedObject var vm : SignUpViewModel
    
    var body: some View {
        switch vm.state {
        case .idle:
            ButtonSignUpView(usuarioToRegister: $usuarioToRegister, vm: vm)
        case .loading:
            LoadingAnimation()
        case .failed(let mensaje):
            ButtonSignUpView(usuarioToRegister: $usuarioToRegister, vm: vm)
            Text(mensaje)
        case .loaded(let usuarioRegistrado):
            ButtonSignUpView(usuarioToRegister: $usuarioToRegister, vm: vm)
            Text("Usuario Registrado existosamente - " + usuarioRegistrado.email)
        }
    }
}

struct ButtonSignUpView : View {
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
        .foregroundColor(Color.white)
        .background(Color.green)
        .clipShape(Capsule())
        .shadow(radius: 10)
        .padding()
    }
}

struct LoadingAnimation : View {
    
    @State private var shouldAnimate = false
    
    var body: some View{
        HStack{
            Circle()
                .fill(Color.red)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever())
            Circle()
                .fill(Color.red)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3))
            Circle()
                .fill(Color.red)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.5))
        }
        .onAppear{
            self.shouldAnimate = true
        }
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
            .previewDevice("iPhone 11 Pro")
    }
}

