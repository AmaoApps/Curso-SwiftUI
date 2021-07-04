//
//  RestoBar.swift
//  cocktelito
//
//  Created by Paku on 4/07/21.
//

import Foundation

struct RestoBar : Identifiable {
    var id: Int
    var name : String
    var likes : Int
    var schedule : String
    var pathImage : String
    var address : String
    var menu : [Product]
}
