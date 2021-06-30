//
//  ViewUtils.swift
//  cocktelito
//
//  Created by Paku on 29/06/21.
//

import SwiftUI

struct ViewUtils: View {
    var body: some View {
        VStack{
            BackButton()
        }
    }
}

//Boton para volver en navigation view
struct BackButton: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var body : some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                Text(ConstantsCocktelito.string_back)
                    .foregroundColor(.blue)
            }
        }
    }
}



struct ViewUtils_Previews: PreviewProvider {
    static var previews: some View {
        ViewUtils()
    }
}
