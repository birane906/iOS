//
//  ContentView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 16/03/2021.
//

import SwiftUI
struct ContentView: View {
    //@ObservedObject var zone = ZoneList()

    
    var body: some View {
        ZStack{
            VStack{
                LogoImage()
                Button(action:{print("Boutton cliqué")}){
                                   ZoneButtom()
                                       .padding(.bottom,50)
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
