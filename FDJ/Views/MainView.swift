//
//  MainView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 31/03/2021.
//

import SwiftUI
struct MainView: View {
   // @ObservedObject var zone = ZoneList()
    @StateObject var searchZone = SearchZoneViewModel(Zonelist())
    
    var body: some View {
        NavigationView{
            VStack{
                LogoImage()
                NavigationLink(
                    destination : TestView()
                ){
                    Text("Search Zone")
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding()
                        .foregroundColor(.black)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(.white),Color(.gray)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
//                    Button(action:{print("Redirect page zone")}){
//                                       ZoneButtom()
//                                           .padding(.bottom,50)
//                    }
                }
                Button(action:{print("Boutton cliqué")}){
                                   EditeurButtom()
                                       .padding(.bottom,50)
                }
                Button(action:{print("Boutton cliqué")}){
                                   JeuButtom()
                                       .padding(.bottom,50)
                }
            }
    
        }
        
            
    }

}

struct LogoImage: View {
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: 150, height: 80, alignment: .center)
            .clipped()
            .padding(.bottom,30)
    }
}

struct ZoneButtom: View {
    var body: some View {
        Text("Zone")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 180, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}

struct EditeurButtom: View {
    var body: some View {
        Text("Editeur")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 180, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}

struct JeuButtom: View {
    var body: some View {
        Text("Jeu")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 180, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}
