import UIKit

struct Operacion{
    var symbol: String
    
    init(symbol: String){
        self.symbol=symbol
    }
    
    //Metodo ejecutar
    func operar(number1:String, number2:String){
        
        if number1.isEmpty || number2.isEmpty{
            print("Debe ingresar dos numeros")
            return
        }
        
        guard let num1 = Float(number1) else {
            print("el numero 1 no tiene un formato valido")
            return
        }
        
        guard let num2 = Float(number2) else {
            print("el numero 2 no tiene un formato valido")
            return
        }
        
        
        print("Numero 1 : \(num1)")
        print("Numero 2 : \(num2)")
        
        switch symbol {
        case "+":
            print("Sumamos")
            print(Float(num1+num2))
        case "-":
            print("Restamos")
            print(String(format: "%2f",(num1-num2)))
        case "*":
            print("Multiplicamos")
            print(String(format: "%2f", num1*num2))
        case "/":
            print("Dividimos")
            if(num2.isEqual(to: 0)){
                print("El divisor debe ser diferente a 0")
                return
            }
            print(String(format: "%2f", num1/num2))
        default:
            print("No se reconocio el simbolo")
        }
    }
    
}

let sumar = Operacion(symbol: "+")
sumar.operar(number1: "2.6", number2: "3.0")

let restar = Operacion(symbol: "-")
restar.operar(number1: "2.6", number2: "3.0")

let miltiplicar = Operacion(symbol: "*")
miltiplicar.operar(number1: "2.6", number2: "3")

let dividir = Operacion(symbol: "/")
dividir.operar(number1: "2.6", number2: "2")


print("Finalizo las Operaciones")
