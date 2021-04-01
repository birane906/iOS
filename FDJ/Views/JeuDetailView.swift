//
//  JeuDetailView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 28/03/2021.
//

import SwiftUI

struct JeuDetailView: View {
    
    var jeu : Jeu
    
    init(jeu : Jeu){
        self.jeu = jeu
    }
    
    var body: some View {
        VStack {
            Text("Jeu : \(jeu.name_jeu)")
                .font(.largeTitle)
                .padding()
            Text("Jeu dans le zone: \(jeu.name_zone)")
                .font(.largeTitle)
                .padding()
            Text("Nombre joueur min : \(jeu.nb_joueurs_min)")
                .padding()
            Text("Nombre joueur max : \(jeu.nb_joueurs_max)")
                .padding()
            Text("Age minimum : \(jeu.agemin)")
                .padding()
            Text("Durée du jeu : \(jeu.duree)")
                .padding()
            Text("Type du jeu : \(jeu.libelle_type)")
                .padding()
        }
    }
}

//struct JeuDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        JeuDetailView()
//    }
//}
