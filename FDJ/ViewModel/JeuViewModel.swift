//
//  JeuViewModel.swift
//  FDJ
//
//  Created by etud on 23/03/2021.
//

import Foundation


class JeuViewModel : Identifiable, ObservableObject,Equatable{
    
    let id = UUID()
    private var model : Jeu
    
    static func == (lhs: JeuViewModel, rhs: JeuViewModel) -> Bool {
            return lhs.id == rhs.id
    }

    
    var id_jeu : Int {
        return model.id_jeu
    }
    
    var name_jeu : String {
        return model.name_jeu
    }
    
    var id_type : Int {
        return model.id_type
    }
    
    var libelle_type : String {
        return model.libelle_type
    }
    
    var duree : Int {
        return model.duree
    }
    
    var nb_joueurs_min : Int {
        return model.nb_joueurs_min
    }
    
    var nb_joueurs_max : Int {
        return model.nb_joueurs_max
    }
    
    var agemin : Int {
        return model.agemin
    }
    
    var editeurs : [Editeur] {
        return model.editeurs ?? []
    }
    
    init(_ jeu : Jeu) {
        self.model = jeu
    }
}
