import Foundation
import SwiftUI

class JeuViewModel : Identifiable, ObservableObject,Equatable{
    
    let id = UUID()
    var model : Jeu
    
    static func == (lhs: JeuViewModel, rhs: JeuViewModel) -> Bool {
            return lhs.id == rhs.id
    }

    @ObservedObject private(set) var model : Jeu
    
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
    
    var name_zone : String {
        return model.name_zone
    }
    
    var editeurs : [Editeur] {
        return model.editeurs ?? []
    }
    
    init(_ jeu : Jeu) {
        self.model = jeu
    }
}
