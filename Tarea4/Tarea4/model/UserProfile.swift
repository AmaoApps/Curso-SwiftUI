//
//  UserProfile.swift
//  Tarea4
//
//  Created by Paku on 12/06/21.
//

import SwiftUI

struct UserProfile: Identifiable {
    
    var id = UUID()
    var names: String
    var email: String
    var password: String
    var listCourses: [Course]
    
    init(mock: Bool) {
        if(mock){
            names = "Ulises Amao"
            email = "amao.apps@gmail.com"
            password = "Ulises*123*"
            listCourses = []
        } else {
            names = ""
            email = ""
            password = ""
            listCourses = []
        }
    }
    
}
