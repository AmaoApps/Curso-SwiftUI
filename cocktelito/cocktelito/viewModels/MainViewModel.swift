//
//  MainViewModel.swift
//  cocktelito
//
//  Created by Paku on 3/07/21.
//

import Foundation
import CoreData

class MainViewModel : ObservableObject {
    
    @Published var daylyRandomCocktail = Cocktail()
    @Published var listRestoBars = []
    
    private var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getRandomCocktail(){
        
        
        
    }
    
    func getListRestoBars(){
        let restoBar1 = RestoBar(id: 1, name: "La Taberna Limenia", likes: 546, schedule: "13:00 - 01:00", pathImage: "https://res.cloudinary.com/tf-lab/image/upload/w_600,h_337,c_fill,g_auto:subject,q_auto,f_auto/restaurant/0fa7206f-0da9-4fd7-991a-c30fe8bdef97/24c333ee-5d64-407f-a79c-1a02d7d2a265.jpg", address: "Av. Miraflores 512, Altura Parke Kennedy, espaldas del Hotel Sheraton", menu:
                                    [Product(name: "Gin Tonic", details: "Bebida Especialidad de la casa", price: 22.0),
                                     Product(name: "Blue Island", details: "Bebida con Vodka, surtido con un limon", price: 24.0),
                                     Product(name: "Macchu Picchu", details: "Bebida de todos los colores y sabores", price: 24.0)
                                    ])
        let restoBar2 = RestoBar(id: 2, name: "El Bar de Arturo", likes: 4152, schedule: "20:00 - 04:00", pathImage: "https://edge.alluremedia.com.au/uploads/businessinsider/2018/07/Bentley-bar.jpg", address: "Av. Miraflores 512, Altura Parke Kennedy, espaldas del Hotel Sheraton", menu:
                                    [Product(name: "Cerveza Artesanal", details: "Bebida elaborado por nosotros", price: 22.0),
                                     Product(name: "Whiskey shot", details: "Un shot de nuestro mas fino Whiskey", price: 24.0),
                                     Product(name: "Pisco Sour", details: "Lo clasico nunca muere", price: 24.0)
                                    ])
        let restoBar3 = RestoBar(id: 3, name: "El Toma Corazon", likes: 6585, schedule: "17:00 - 3:00", pathImage: "https://thisisreno.com/wp-content/uploads/2020/05/Phase-1-Reopening-Nevada_Eric-Marks-14-scaled.jpg", address: "Av. Miraflores 512, Altura Parke Kennedy, espaldas del Hotel Sheraton", menu:
                                    [Product(name: "La Ex", details: "Te dejara un sabor amargo", price: 22.0),
                                     Product(name: "La Muerte", details: "Un shot puro random", price: 24.0),
                                     Product(name: "Los Patas", details: "Bebidas mixtas para compartir con amigos", price: 24.0)
                                    ])
        let listResto = [restoBar1, restoBar2, restoBar3]
        self.listRestoBars = listResto
    }
    
    private func autenticarUsuario(email: String, pass: String) -> Usuario? {
        let local = UsuarioLocalService(context: context)
        return local.autenticarUsuario(email: email, pass: pass)
    }
}
