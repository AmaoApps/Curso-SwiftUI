//
//  CocktailRandomResponse.swift
//  cocktelito
//
//  Created by Paku on 4/07/21.
//

import Foundation

struct CocktailResponse : Codable {
    
    enum CodingKeys : String, CodingKey {
        case drinks
    }
    var drinks: [Cocktail]
}
