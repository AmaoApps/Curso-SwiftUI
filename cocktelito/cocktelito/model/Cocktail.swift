//
//  Cocktail.swift
//  cocktelito
//
//  Created by Paku on 30/06/21.
//

import Foundation

struct Cocktail : Identifiable, Codable {
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case tags = "strTags"
        case category = "strCategory"
        case instructions = "strInstructions"
        case pathImage = "strDrinkThumb"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
    }
    
    var id: String? = ""
    var name: String? = ""
    var tags: String? = ""
    var category: String? = ""
    var instructions: String? = ""
    var pathImage: String? = ""
    var ingredient1: String? = ""
    var ingredient2: String? = ""
    var ingredient3: String? = ""
    var ingredient4: String? = ""
    var ingredient5: String? = ""
    var measure1: String? = ""
    var measure2: String? = ""
    var measure3: String? = ""
    var measure4: String? = ""
    var measure5: String? = ""
}
