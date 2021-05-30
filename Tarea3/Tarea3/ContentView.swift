//
//  ContentView.swift
//  Tarea3
//
//  Created by Paku on 24/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //CABECERA IMAGEN
            Image("portada")
                .resizable()
                .scaledToFit()
                .clipShape(
                    RoundedRectangle(cornerRadius: 20.0).inset(by: 5.0)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20.0)
                        .foregroundColor(.blue)
                        .opacity(0.3)
                        .overlay(
                            VStack{
                                Spacer()
                                Capsule()
                                    .foregroundColor(.white)
                                    .frame(width: .infinity, height: 80, alignment: .center)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .padding(10)
                                    .overlay(
                                        HStack(spacing: .some(15.0)){
                                            VStack{
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .foregroundColor(.yellow)
                                                    .frame(width: 24, height: 24, alignment: .center)
                                                Text("9.2/10")
                                                    .font(.system(size: 12))
                                                    .fontWeight(.bold)
                                                Text("350,215")
                                                    .font(.system(size: 10))
                                                    .fontWeight(.light)
                                                Spacer()
                                            }.frame(width: 70, height: 70, alignment: .center)
                                            .padding(.top, 15)
                                            VStack{
                                                Image(systemName: "star")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .foregroundColor(.black)
                                                    .frame(width: 24, height: 24, alignment: .center)
                                                Text("Rate this")
                                                    .font(.system(size: 12))
                                                    .fontWeight(.bold)
                                                Spacer()
                                            }.frame(width: 70, height: 70, alignment: .center)
                                            .padding(.top, 15)
                                            VStack{
                                                VStack{
                                                    Text("94")
                                                        .font(.system(size: 12))
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.bottom, 1)
                                                .frame(width: 35, height: 24, alignment: .center)
                                                .background(Color.green)
                                                Text("Metascore")
                                                    .font(.system(size: 12))
                                                    .fontWeight(.bold)
                                                Text("52 critics reviews")
                                                    .font(.system(size: 10))
                                                    .fontWeight(.light)
                                                Spacer()
                                            }.frame(width: 90, height: 70, alignment: .center)
                                            .padding(.top, 15)
                                        }
                                        
                                        .padding(5)
                                    )
                            }.offset(y:40)
                        )
                )
            //TITULO DESCRIPCION Y BOTON
            HStack(){
                VStack(alignment: .leading){
                    Text("John Wick")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    HStack(alignment: .top, spacing: 2){
                        Text("2019")
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .padding(.horizontal)
                        Text("PG-13")
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .padding(.horizontal)
                        Text("2h 32min")
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical, 8)
                Button(action: {
                    //TODO A ALERTADIALOG
                }, label: {
                    Text("+")
                        .font(.system(size: 24))
                        .frame(maxWidth: 50, maxHeight: 50, alignment: .center)
                })
                .foregroundColor(.white)
                .background(Color.pink)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding(10)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 20)
            
            //TAG LABELS
            HStack(spacing: 12){
                Text("Action")
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    .padding(.init(top: 5, leading: 8, bottom: 5, trailing: 8))
                    .overlay(
                        Capsule()
                            .stroke(lineWidth: 1.0)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                    )
                Text("Mafia")
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    .padding(.init(top: 5, leading: 8, bottom: 5, trailing: 8))
                    .overlay(
                        Capsule()
                            .stroke(lineWidth: 1.0)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                    )
                Text("Weapons")
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    .padding(.init(top: 5, leading: 8, bottom: 5, trailing: 8))
                    .overlay(
                        Capsule()
                            .stroke(lineWidth: 1.0)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                    )
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            //SUMMARY AND DESCRIPTION
            VStack{
                Text("Plot Summary")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                Text("summary")
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    .lineLimit(3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }.padding(.vertical, 8)
            //CAST AND CREW
            VStack{
                Text("Cast & Crew")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                HStack{
                    CastCrew(nombreImagen: "keanu", nombreActor: "Keanu Reeves", nombreRol: "Actor")
                    CastCrew(nombreImagen: "brigit", nombreActor: "Bridget Moynahan", nombreRol: "Actor")
                    CastCrew(nombreImagen: "shane", nombreActor: "Ian McShane", nombreRol: "Actor")
                    CastCrew(nombreImagen: "lance", nombreActor: "Lance Reddick", nombreRol: "Actor")
                }
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}


struct CastCrew : View {
    
    var nombreImagen: String
    var nombreActor: String
    var nombreRol: String
    
    var body: some View {
        VStack{
            Image(nombreImagen)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
            Text(nombreActor)
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
            Text(nombreRol)
                .font(.system(size: 12))
                .fontWeight(.light)
        }
        .frame(maxWidth: 70)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
