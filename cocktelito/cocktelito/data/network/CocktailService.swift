//
//  CocktailService.swift
//  cocktelito
//
//  Created by Paku on 4/07/21.
//

import Alamofire

struct CocktailService {
    
    private let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"
    private let apiKey = ""
    
    
    func getRandomCocktail(){
        let url = "\(baseURL)random"
        //let apikey
        let request = AF.request(url,
                                 method: .get)
                                 //parameters: ["apku": , apikey, "other": apijey],
                                 //encoder: JSONEncoding.default)
        request.validate().responseJSON { response in
            switch response.result {
            case.success(let data):
                print(data)
            case.failure(let error):
                print(error)
            }
        }
        
        
    }
    
}
