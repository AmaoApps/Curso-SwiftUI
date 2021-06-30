//
//  SignUpPage.swift
//  cocktelito
//
//  Created by Paku on 29/06/21.
//

import SwiftUI

struct SignUpPage: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    @ObservedObject var viewModel : SignUpViewModel
    
    init() {
        viewModel = SignUpViewModel()
    }
    
    var body: some View {
        VStack{
            Text("Pagina de registro")
        }
        .navigationBarTitle("Registro", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
    
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
            .previewDevice("iPhone 11 Pro")
    }
}

