//
//  CocktailService.swift
//  cocktelito
//
//  Created by Paku on 4/07/21.
//

import Alamofire

enum Response<T> {
    case success([Cocktail])
    case failure(Error)
}

struct CocktailService {
    
    private let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"
    private let apiKey = ""
    
    
    //func getRandomCocktail(){
    func getRandomCocktail(completion: @escaping (Response<[Cocktail]>) -> Void ){
        let url = "\(baseURL)random.php"
        //let apikey
        print(url)
        let request = AF.request(url,
                                 method: .get)
                                 //parameters: ["apku": , apikey, "other": apijey],
                                 //encoding: JSONEncoding.default)
        /*
        request.responseJSON { response  in
            switch response.result {
            case .success(let json):
                print(json)
            case .failure(let error):
                print(error)
            }
        }
        */
        
        request.validate().responseDecodable(of: CocktailResponse.self) { response in
            print(response)
            switch response.result {
            case.success(let data):
                completion(.success(data.drinks))
                print(data)
            case.failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
        
        
    }
    
}
