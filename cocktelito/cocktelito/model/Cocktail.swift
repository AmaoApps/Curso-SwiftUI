//
//  Cocktail.swift
//  cocktelito
//
//  Created by Paku on 30/06/21.
//

import Foundation

struct Cocktail : Identifiable {
    var id: Int
    var name: String
    var tags: String
    var category: String
    var instructions: String
    var pathImage: String
    var ingredients: [Ingredient]
        
    
    init(mock: Bool = false) {
        if mock {
            id = 1
            name = "Pink Moon"
            tags = "Fresh, Summer, colourful, Nature"
            category = "Cocktail"
            instructions = "Slowly shake in a shaker with Ice, strain into a square whiskey glass."
            pathImage = "https://www.thecocktaildb.com/images/media/drink/lnjoc81619696191.jpg"
            ingredients = [
                Ingredient(name: "Gin", measure: "1 shot"),
                Ingredient(name: "Coconout Liqueur", measure: "1 shot"),
                Ingredient(name: "ElderFlower cordial", measure: "25 ml")
                ]
        } else {
            id = 0
            name = ""
            tags = ""
            category = ""
            instructions = ""
            pathImage = ""
            ingredients = []
        }
    }
}
