//
//  Jeu.swift
//  FDJ
//
//  Created by etud on 23/03/2021.
//

import Foundation

class Jeu : Identifiable, ObservableObject, Encodable, Equatable, Decodable {
    static func == (lhs: Jeu, rhs: Jeu) -> Bool {
        return lhs.id_jeu == rhs.id_jeu
    }
    
    private(set) var id_jeu: Int
    private(set) var name_jeu: String
    private(set) var nb_joueurs_min: Int
    
    init(id_jeu: Int, name_jeu: String, nb_joueurs_min: Int) {
        self.id_jeu = id_jeu
        self.name_jeu = name_jeu
        self.nb_joueurs_min = nb_joueurs_min
    }
}
