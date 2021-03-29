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
            Text("Nombre joueur min : \(jeu.nb_joueurs_min)")
        }
    }
}

//struct JeuDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        JeuDetailView()
//    }
//}
