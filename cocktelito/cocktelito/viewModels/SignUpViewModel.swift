//
//  SignUpViewModel.swift
//  cocktelito
//
//  Created by Paku on 30/06/21.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var newUsuario : Usuario = Usuario()
    
    @Published var showError : Bool = false
    private(set) var error: Error? {
        didSet {
            showError = error != nil
        }
    }
    
    
    
    func registrarUsuario(usuario: Usuario){
        
    }
    
}
