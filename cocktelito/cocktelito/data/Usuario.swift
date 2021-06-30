//
//  Usuario.swift
//  cocktelito
//
//  Created by Paku on 29/06/21.
//

import Foundation

struct Usuario : Identifiable {
    var id: UUID = UUID()
    var name: String
    var email: String
    var password: String
    
    var fullData: String {
        "\(name) - \(email)"
    }
    
    init(mock: Bool = false) {
        if mock {
            name = "Ulises Amao"
            email = "amao.apps@gmail.com"
            password = "pass123"
        } else {
            name = ""
            email = ""
            password = ""
        }
    }
    
    
    
}
