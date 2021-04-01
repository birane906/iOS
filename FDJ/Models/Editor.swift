//
//  Editor.swift
//  FDJ
//
//  Created by user190389 on 3/31/21.
//

import Foundation

class Editor : Identifiable, ObservableObject, Encodable, Equatable, Decodable {
    static func == (lhs: Editor, rhs: Editor) -> Bool {
        return lhs.id_editeur == rhs.id_editeur
    }
    
    private(set) var id_editeur: Int
    private(set) var nom_editeur: String
    
    init(id_editeur: Int, nom_editeur: String) {
        self.id_editeur = id_editeur
        self.nom_editeur = nom_editeur
    }
}
