//
//  DetailRestoBarPage.swift
//  cocktelito
//
//  Created by Paku on 13/07/21.
//

import SwiftUI
import URLImage

struct DetailRestoBarPage: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    @State var restobar: RestoBar
    
    var body: some View {
        VStack{
            HeaderRestoBar(restoBar: restobar)
            AddresRestoBar(restoBar: restobar)
            MenuRestoBar(restoBar: restobar)
        }.navigationBarTitle(restobar.name)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

struct AddresRestoBar: View {
    
    @State var restoBar: RestoBar
    
    var body: some View {
        VStack{
            HStack{
                Text(ConstantsCocktelito.string_detail_address).font(.title3).bold().padding()
                Spacer()
            }
            Text(restoBar.address)
        }
    }
}


struct MenuRestoBar: View {
    
    @State var restoBar: RestoBar
    
    var body: some View {
        VStack{
            HStack{
                Text(ConstantsCocktelito.string_detail_menu).font(.title3).bold().padding()
                Spacer()
            }
            ForEach(restoBar.menu, id: \.id){ prod in
                HStack{
                    Text("\(prod.name)").font(.title3).foregroundColor(Color(ConstantsCocktelito.color_accent))
                    Spacer()
                }.padding(.leading)
                .padding(.trailing)
                .padding(.top)
                HStack{
                    Text("\(prod.details)").fixedSize(horizontal:false, vertical: true)
                    Spacer()
                    Text("\(prod.price, specifier: "%.2f")")
                }.padding(.leading)
                .padding(.trailing)
            }
        }
    }
}

struct HeaderRestoBar: View {
    
    @State var restoBar: RestoBar
    
    var body: some View {
        VStack{
            let url : URL = URL(string: restoBar.pathImage)!
            URLImage(url){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .padding(.leading)
                    .padding(.trailing)
            }
            HStack{
                Label("\(restoBar.likes)", systemImage:"suit.heart.fill")
                Spacer()
                Label("\(restoBar.schedule)", systemImage:"timer")
            }
            .padding(EdgeInsets(top:0, leading:16, bottom:0, trailing:16))
        }
        
    }
}

struct DetailRestoBarPage_Previews: PreviewProvider {
    static var previews: some View {
        let restoBar =  RestoBar(id: 0, name: "Demo Resto Bar", likes: 100, schedule: "Horario", pathImage: "rutaImagen", address: "Direccion", menu: [])
        DetailRestoBarPage(restobar: restoBar)
    }
}
