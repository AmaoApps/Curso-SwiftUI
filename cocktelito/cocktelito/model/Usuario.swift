//
//  Usuario.swift
//  cocktelito
//
//  Created by Paku on 29/06/21.
//

import Foundation

struct Usuario : Identifiable {
    var id: Int
    var name: String
    var email: String
    var password: String
    var isLogged: Bool
    
    var fullData: String {
        "\(name) - \(email)"
    }
    
    init(mock: Bool = false) {
        if mock {
            id = 1
            name = "Ulises Amao"
            email = "amao.apps@gmail.com"
            password = "pass123"
            isLogged = false
        } else {
            id = 0
            name = ""
            email = ""
            password = ""
            isLogged = false
        }
    }
    
    
    
}
