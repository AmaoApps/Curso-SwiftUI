//
//  ContentView.swift
//  Tarea2
//
//  Created by Paku on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var valorPrevio: String = ""
    @State var valorActual: String = "0"
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Text(valorPrevio)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 60, maxHeight: .infinity, alignment: .trailing)
                Text(valorActual)
                    .font(.system(size: 70))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .trailing)
                HStack{
                    ButtonCalculatorOperacionAC(txt: "AC", tipo: .advance,valorPrevio: $valorPrevio, valorActual: $valorActual)
                    ButtonCalculatorOperacionPlusMinus(txt: "±", tipo: .advance, valorActual: $valorActual)
                    ButtonCalculatorOperacionPercent(txt: "%", tipo: .advance, valorActual: $valorActual)
                    ButtonCalculatorOperacion(txt: "/", tipo: .operacion,valorAnterior: $valorPrevio, valorActual: $valorActual)
                }
                HStack{
                    ButtonCalculatorNumero(txt: "7", tipo: .numeral,valorActual: $valorActual)
                    ButtonCalculatorNumero(txt: "8", tipo: .numeral,valorActual: $valorActual)
                    ButtonCalculatorNumero(txt: "9", tipo: .numeral,valorActual: $valorActual)
                    ButtonCalculatorOperacion(txt: "x", tipo: .operacion,valorAnterior: $valorPrevio, valorActual: $valorActual)
                }
                HStack{
                    ButtonCalculatorNumero(txt: "4", tipo: .numeral,valorActual: $valorActual)
                    ButtonCalculatorNumero(txt: "5", tipo: .numeral,valorActual: $valorActual)
                    ButtonCalculatorNumero(txt: "6", tipo: .numeral,valorActual: $valorActual)
                    ButtonCalculatorOperacion(txt: "-", tipo: .operacion,valorAnterior: $valorPrevio, valorActual: $valorActual)
                }
                HStack{
                    ButtonCalculatorNumero(txt: "1", tipo: .numeral,valorActual: $valorActual)
                    ButtonCalculatorNumero(txt: "2", tipo: .numeral,valorActual: $valorActual)
                    ButtonCalculatorNumero(txt: "3", tipo: .numeral,valorActual: $valorActual)
                    ButtonCalculatorOperacion(txt: "+", tipo: .operacion,valorAnterior: $valorPrevio, valorActual: $valorActual)
                }
                HStack{
                    ButtonCalculatorLarge(txt: "0", tipo: .numeral,valorActual: $valorActual)
                    ButtonCalculatorDot(txt: ".", tipo: .numeral,valorActual: $valorActual)
                    ButtonCalculatorOperacionEquals(txt: "=", tipo: .operacion,valorPrevio: $valorPrevio, valorActual: $valorActual)
                }
            }
        }
    }
}

struct ButtonCalculatorOperacion : View {
    
    var txt: String
    var tipo: TipoBoton
    @Binding var valorAnterior: String
    @Binding var valorActual: String
    
    var body: some View {
        Button(
            action: {
                valorAnterior=valorActual.appending(txt)
                valorActual = "0"
            },
            label: {
                Text(txt)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.all, 15)
                    .foregroundColor(getColorLabel(tipoBoton: tipo))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
        ).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(getColorBackgroud(tipoBoton: tipo))
        .clipShape(Circle())
    }
}

struct ButtonCalculatorNumero : View {
    
    var txt: String
    var tipo: TipoBoton
    @Binding var valorActual: String
    
    var body: some View {
        Button(
            action: {
                if(valorActual == "0"){
                    valorActual = txt
                } else {
                    valorActual.append(txt)
                }
                
            },
            label: {
                Text(txt)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.all, 15)
                    .foregroundColor(getColorLabel(tipoBoton: tipo))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
        ).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(getColorBackgroud(tipoBoton: tipo))
        .clipShape(Circle())
    }
}

struct ButtonCalculatorLarge : View {
    
    var txt: String
    var tipo: TipoBoton
    @Binding var valorActual: String
    
    var body: some View {
        Button(
            action: {
                if(valorActual != "0"){
                    valorActual.append("0")
                }
            },
            label: {
                Text(txt)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.all, 15)
                    .foregroundColor(getColorLabel(tipoBoton: tipo))
            }
        ).frame(minWidth: 160, maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(getColorBackgroud(tipoBoton: tipo))
        .cornerRadius(50)
    }
}

//OPERACIONES ESPECIALES
struct ButtonCalculatorOperacionAC : View {
    
    var txt: String
    var tipo: TipoBoton
    @Binding var valorPrevio: String
    @Binding var valorActual: String
    
    var body: some View {
        Button(
            action: {
                valorPrevio = ""
                valorActual = "0"
            },
            label: {
                Text(txt)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.all, 15)
                    .foregroundColor(getColorLabel(tipoBoton: tipo))
            }
        ).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(getColorBackgroud(tipoBoton: tipo))
        .cornerRadius(50)
    }
}

struct ButtonCalculatorOperacionPlusMinus : View {
    
    var txt: String
    var tipo: TipoBoton
    @Binding var valorActual: String
    
    var body: some View {
        Button(
            action: {
                if(valorActual[valorActual.startIndex] == "-"){
                    let rango = valorActual.startIndex...
                    valorActual = String(valorActual[rango])
                }else {
                    valorActual.insert("-", at: valorActual.startIndex)
                }
            },
            label: {
                Text(txt)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.all, 15)
                    .foregroundColor(getColorLabel(tipoBoton: tipo))
            }
        ).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(getColorBackgroud(tipoBoton: tipo))
        .cornerRadius(50)
    }
}

struct ButtonCalculatorDot : View {
    
    var txt: String
    var tipo: TipoBoton
    @Binding var valorActual: String
    
    var body: some View {
        Button(
            action: {
                if(!valorActual.contains(".")){
                    valorActual.append(".")
                }
            },
            label: {
                Text(txt)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.all, 15)
                    .foregroundColor(getColorLabel(tipoBoton: tipo))
            }
        ).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(getColorBackgroud(tipoBoton: tipo))
        .cornerRadius(50)
    }
}

struct ButtonCalculatorOperacionPercent : View {
    
    var txt: String
    var tipo: TipoBoton
    @Binding var valorActual: String
    
    var body: some View {
        Button(
            action: {
                
            },
            label: {
                Text(txt)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.all, 15)
                    .foregroundColor(getColorLabel(tipoBoton: tipo))
            }
        ).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(getColorBackgroud(tipoBoton: tipo))
        .cornerRadius(50)
    }
}

struct ButtonCalculatorOperacionEquals : View {
    
    var txt: String
    var tipo: TipoBoton
    @Binding var valorPrevio: String
    @Binding var valorActual: String
    
    var body: some View {
        Button(
            action: {
                var resultado : Float = 0
                let rango = ..<valorActual.endIndex
                print(valorPrevio[rango])
                guard let num1 = Float(valorPrevio[rango]) else {
                    print("el numero 1 no tiene un formato valido")
                    return
                }
                guard let num2 = Float(valorActual) else {
                    print("el numero 2 no tiene un formato valido")
                    return
                }
                let operation = valorPrevio.last
                switch operation {
                case "+":
                    resultado = num1+num2
                case "-":
                    resultado = num1-num2
                case "x":
                    resultado = num1*num2
                case "/":
                    if(num2 == 0){
                        valorPrevio = ""
                        valorActual = "Error"
                        return
                    }
                    resultado = num1/num2
                default :
                    print("No se pudo realizar la operacion")
                }
                valorPrevio = valorPrevio.appending(valorActual)
                valorActual = String(resultado)
            },
            label: {
                Text(txt)
                    .font(.title)
                    .bold()
                    .padding(.all, 15)
                    .foregroundColor(getColorLabel(tipoBoton: tipo))
            }
        ).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(getColorBackgroud(tipoBoton: tipo))
        .cornerRadius(50)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

