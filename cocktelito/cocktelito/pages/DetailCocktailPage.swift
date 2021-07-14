//
//  DetailCocktailPage.swift
//  cocktelito
//
//  Created by Paku on 12/07/21.
//

import SwiftUI
import URLImage

struct DetailCocktailPage: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    @State var cocktail : Cocktail
    
    var body: some View {
        VStack{
            HeaderDetailCocktail(cocktail: cocktail)
            ReceiptBody(cocktail: cocktail)
        }.navigationBarTitle(cocktail.name ?? "Detalle")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

struct HeaderDetailCocktail: View {
    
    @State var cocktail: Cocktail
    
    var body: some View {
        let url : URL = URL(string: cocktail.pathImage!)!
            URLImage(url){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .padding(.leading)
                    .padding(.trailing)
            }
    }
}

struct ReceiptBody: View {
    
    @State var cocktail: Cocktail
    
    var body: some View {
        VStack{
            HStack{
                Text(ConstantsCocktelito.string_detail_ingredients).font(.title3).bold().padding()
                Spacer()
            }
            if(validateExists(measure: cocktail.measure1, ingredient: cocktail.ingredient1)){
                Text("\(cocktail.measure1!) \(cocktail.ingredient1!)")
            }
            if(validateExists(measure: cocktail.measure2, ingredient: cocktail.ingredient2)){
                Text("\(cocktail.measure2!) \(cocktail.ingredient2!)")
            }
            if(validateExists(measure: cocktail.measure3, ingredient: cocktail.ingredient3)){
                Text("\(cocktail.measure3!) \(cocktail.ingredient3!)")
            }
            if(validateExists(measure: cocktail.measure4, ingredient: cocktail.ingredient4)){
                Text("\(cocktail.measure4!) \(cocktail.ingredient4!)")
            }
            if(validateExists(measure: cocktail.measure5, ingredient: cocktail.ingredient5)){
                Text("\(cocktail.measure5!) \(cocktail.ingredient5!)")
            }
            HStack{
                Text(ConstantsCocktelito.string_detail_instructions).font(.title3).bold().padding(.top).padding(.leading)
                Spacer()
            }
            Text(cocktail.instructions ?? "Instrucciones no encontradas").padding()
            Spacer()
        }
    }
}

func validateExists(measure: String?, ingredient: String?) -> Bool {
    let cleanCadena = measure?.trimmingCharacters(in: .whitespacesAndNewlines)
    let cleanCadenaIngredient = ingredient?.trimmingCharacters(in: .whitespacesAndNewlines)
    return cleanCadena != nil && cleanCadenaIngredient != nil
}

struct DetailCocktailPage_Previews: PreviewProvider {
    static var previews: some View {
        let cocktailMock = Cocktail()
        DetailCocktailPage(cocktail: cocktailMock)
    }
}
