//
//  SplashViewModel.swift
//  cocktelito
//
//  Created by Paku on 14/07/21.
//

import Foundation
import Combine
import CoreData

class SplashViewModel: ObservableObject {
    
    @Published var usuarioLogeado : Usuario?
    
    private var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func validarUsuarioLogeado(){
        let usuarioValido = obtenerUsuarioLogeado()
        self.usuarioLogeado = usuarioValido
    }
    
    private func obtenerUsuarioLogeado() -> Usuario? {
        let local = UsuarioLocalService(context: context)
        return local.getUserLogged()
    }
    
    
}
