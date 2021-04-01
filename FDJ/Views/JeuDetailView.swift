//
//  JeuDetailView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 28/03/2021.
//

import SwiftUI


struct JeuDetailView: View {
    
    struct LogoImage: View {
        var body: some View {
            Image("logo")
                .resizable()
                .frame(width: 150, height: 80, alignment: .center)
                .clipped()
                .padding(.bottom,30)
        }
    }
    
    struct ColorManager {
        static let fjmgreen =
            Color("Greenfjm")
        static let fjmblue = Color("Bluefjm")
    }
    
    var jeu : Jeu
    
    init(jeu : Jeu){
        self.jeu = jeu
    }
    
    var body: some View {
        VStack {
            LogoImage()
            Text("Jeu : \(jeu.name_jeu)")
                .padding()
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(ColorManager.fjmblue)
            if(jeu.name_zone!==""){
                Text("Jeu pas encore disponible")
                    .padding()
                    .font(.system(size: 18, weight: .light, design: .default))
                    .foregroundColor(ColorManager.fjmblue)
            }
            else{
                Text("Jeu dans le zone: \(jeu.name_zone ?? "")")
                    .padding()
                    .font(.system(size: 18, weight: .light, design: .default))
                    .foregroundColor(ColorManager.fjmblue)
            }
            Text("Nombre joueur min : \(jeu.nb_joueurs_min)")
                .padding()
                .font(.system(size: 18, weight: .light, design: .default))
                .foregroundColor(ColorManager.fjmblue)
            Text("Nombre joueur max : \(jeu.nb_joueurs_max)")
                .padding()
                .font(.system(size: 18, weight: .light, design: .default))
                .foregroundColor(ColorManager.fjmblue)
            Text("Age minimum : \(jeu.agemin)")
                .padding()
                .font(.system(size: 18, weight: .light, design: .default))
                .foregroundColor(ColorManager.fjmblue)
            Text("Durée du jeu : \(jeu.duree)")
                .padding()
                .font(.system(size: 18, weight: .light, design: .default))
                .foregroundColor(ColorManager.fjmblue)
            Text("Type du jeu : \(jeu.libelle_type)")
                .padding()
                .font(.system(size: 18, weight: .light, design: .default))
                .foregroundColor(ColorManager.fjmblue)
        }
    }
}

//struct JeuDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        JeuDetailView()
//    }
//}
