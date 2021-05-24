//
//  ViewUtils.swift
//  Tarea2
//
//  Created by Paku on 21/05/21.
//

import SwiftUI


//Recurso para crear boton - Numero
struct ButtonLabel : View{
    
    var label: String
    let tipo: TipoBoton
    
    var body : some View {
        ZStack{
            Text(label)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.all, 15)
                .background(getColorBackgroud(tipoBoton: tipo))
                .foregroundColor(getColorLabel(tipoBoton: tipo))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
    
}

func getColorBackgroud(tipoBoton: TipoBoton) -> Color {
    switch tipoBoton {
    case .numeral:
        return Color("ColorBtnNumeral")
    case .operacion:
        return Color("ColorBtnOperacion")
    case .advance:
        return Color("ColorBtnAdvance")
    }
}

func getColorLabel(tipoBoton: TipoBoton) -> Color {
    switch tipoBoton {
    case .numeral:
        return Color("ColorTxtWhite")
    case .operacion:
        return Color("ColorTxtWhite")
    case .advance:
        return Color("ColorTxtBlack")
    }
}

enum TipoBoton {
    case numeral
    case operacion
    case advance
}

struct ViewUtils_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(label: "%", tipo: .advance)
    }
}
