//
//  ProfileViewModel.swift
//  cocktelito
//
//  Created by Paku on 14/07/21.
//

import Foundation
import Combine
import CoreData

class ProfileViewModel: ObservableObject {
    
    @Published var userSignOut : Bool = false
    
    private var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    
    func cerrarSesion(email: String){
        let _ = cerrarSesionBD(email:email)
        self.userSignOut = true
    }
    
    private func cerrarSesionBD(email:String) {
        let local = UsuarioLocalService(context: context)
        return local.closeSession(email: email)
    }
}
