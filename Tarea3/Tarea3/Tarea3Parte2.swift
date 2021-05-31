//
//  Tarea3Parte2.swift
//  Tarea3
//
//  Created by Paku on 30/05/21.
//

import SwiftUI

struct Tarea3Parte2: View {
    
    @State var isLiked: Bool = false
    
    var body: some View {
        ZStack(alignment: .top){
            Color.purple
            VStack{
                //Boton Corazon - Menu Superior
                HStack{
                    Spacer()
                    ButtonHeartLiked(isLiked: $isLiked)
                }.padding(.init(top: 60, leading: 12, bottom: 24, trailing: 24))
                //Contenedor
                VStack{
                    RoundedRectangle(cornerRadius: 50.0)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .overlay(
                            MenuPrincipal(showAgregadoCarrito: false)
                        )
                }
                .padding(.top, 120)
            }
        }.ignoresSafeArea()
    }
}

struct MenuPrincipal: View {
    
    @State var showAgregadoCarrito: Bool
    
    var body: some View {
            VStack{
                //IMAGEN PLATO PRINCIPAL
                Image("ceviche")
                    .resizable()
                    .frame(width:250, height:250)
                    .clipShape(Circle())
                    .shadow(radius: 8)
                
                // TITULO - PRECIO
                PlatoYPrecio(nombrePlato: "Ceviche", tipoMoneda: "S/", precioPlato: "36,00")
                // TIEMPO Y CALIFICACION
                TagSpeciales()
                // DESCRIPCION
                ResumenPlato()
                // COMPRAR
                BtnCarrito(showAgregadoCarrito: $showAgregadoCarrito)
                Spacer()
            }
            .offset(y: -125)
            .padding(.bottom, -125)
    }
    
}

struct BtnCarrito : View {
    
    @Binding var showAgregadoCarrito: Bool
    
    var body: some View {
        VStack{
            Button(action: {
                showAgregadoCarrito.toggle()
            }, label: {
                Text("Agregar al carrito")
                    .font(.system(size: 18, weight: .medium))
            })
            .frame(maxWidth: .infinity, maxHeight: 60.0)
            .foregroundColor(.white)
            .background(Color.purple)
            .clipShape(Capsule())
            .alert(isPresented: $showAgregadoCarrito){
                Alert(title: Text("Excelente"),
                      message: Text("Lo agregaste al Carrito"),
                      dismissButton: .default(Text("Aceptar")))
            }
        }.padding()
    }
    
}

struct ResumenPlato: View {
    var body: some View {
        VStack{
            Text("Resumen")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("resumen_plato")
                .foregroundColor(.gray)
                .lineSpacing(10.0)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 8)
        }.padding()
    }
}

struct TagSpeciales: View {
    var body: some View {
        HStack{
            TemplateTag(nombreIcono: "timer", etiqueta: "30m")
            TemplateTag(nombreIcono: "star", etiqueta: "4.5")
            Spacer()
        }.padding()
    }
}

struct TemplateTag: View {
    
    var nombreIcono: String
    var etiqueta: String
    
    var body: some View {
        HStack{
        Image(systemName: nombreIcono)
            .resizable()
            .foregroundColor(.white)
            .frame(width: 24, height: 24, alignment: .leading)
        Text(etiqueta)
            .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
        }
        .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
        .background(Color.purple)
        .clipShape(
            Capsule()
        )
    }
}

struct PlatoYPrecio: View {
    
    var nombrePlato: String
    var tipoMoneda: String
    var precioPlato: String
    
    var body: some View {
        HStack(alignment: .top){
            Text(nombrePlato)
                .font(.system(size: 36))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,alignment: .leading)
            Text(tipoMoneda)
                .font(.system(size: 18))
                .foregroundColor(.yellow)
                .fontWeight(.bold)
                .frame(alignment: .leading)
            Text(precioPlato)
                .font(.system(size: 36))
                .foregroundColor(.yellow)
                .fontWeight(.bold)
                .frame(alignment: .leading)
        }.padding()
    }
    
}

struct ButtonHeartLiked: View {
    
    @Binding var isLiked : Bool
    
    var body: some View {
        Button(action: {
            isLiked.toggle()
        }, label: {
            if(isLiked){
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 36, height: 36, alignment: .center)
            }else{
                Image(systemName: "heart")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 36, height: 36, alignment: .center)
            }
        })
    }
}





struct Tarea3Parte2_Previews: PreviewProvider {
    static var previews: some View {
        Tarea3Parte2()
            .previewDevice("iPhone 12 Pro")
    }
}
