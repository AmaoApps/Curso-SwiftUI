//
//  SignUpViewModel.swift
//  cocktelito
//
//  Created by Paku on 30/06/21.
//

import Foundation
import Combine
import CoreData

class SignUpViewModel: ObservableObject {
    
    @Published var newUsuario : Usuario = Usuario()
    
    @Published var showError : Bool = false
    @Published var loading : Bool = false
    private(set) var error: Error? {
        didSet {
            showError = error != nil
        }
    }
    
    //private var context : NSManagedObjectContext = PersistenceController.shared.container.viewContext
    
    private var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func registrarNuevoUsuario(usuario: Usuario){
        self.loading = true
        sleep(5)
        if(!existeUsuarioPorEmail(email: usuario.email)){
            newUsuario.id = obtenerIdNuevoUsuario()
            newUsuario.name = usuario.name
            newUsuario.email = usuario.email
            newUsuario.password = usuario.password
            registrarUsuario(usuario: newUsuario)
        } else {
            self.showError = true
        }
        
    }
    
    
    
    func registrarUsuario(usuario: Usuario){
        let local = UsuarioLocalService(context: context)
        local.store(usuario: usuario)
    }
    
    func existeUsuarioPorEmail(email: String) -> Bool {
        let local = UsuarioLocalService(context: context)
        return local.existeUsuarioPorEmail(email: email)
    }
    
    func obtenerIdNuevoUsuario() -> Int {
        let local = UsuarioLocalService(context: context)
        return local.obtenerCantidadUsuarioRegistrados()+1
    }
    
}
