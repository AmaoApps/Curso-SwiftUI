//
//  LoginViewModel.swift
//  cocktelito
//
//  Created by Paku on 2/07/21.
//

import Foundation
import Combine
import CoreData

class LoginViewModel : ObservableObject {
    
    enum State {
        case idle
        case loading
        case failed(String)
        case loaded(Usuario)
    }

    
    @Published private(set) var state = State.idle
    @Published var isLogin = false
    @Published var usuarioVerificado = Usuario()
    
    private var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func validarUsuario(email: String, pass:String){
        let usuarioValido = autenticarUsuario(email: email, pass: pass)
        if( usuarioValido == nil ){
            self.state = State.failed("Email y/o contrasenia incorrectos")
        } else {
            self.state = State.loaded(usuarioValido!)
            self.usuarioVerificado = usuarioValido!
            self.isLogin = true
        }
    }
    
    private func autenticarUsuario(email: String, pass: String) -> Usuario? {
        let local = UsuarioLocalService(context: context)
        return local.autenticarUsuario(email: email, pass: pass)
    }
}
