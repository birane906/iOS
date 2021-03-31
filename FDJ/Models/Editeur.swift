//
//  Editeur.swift
//  FDJ
//
//  Created by user190389 on 3/31/21.
//

import Foundation
import Combine

struct Editeur : Decodable {
    public var id_editeur: Int
    public var nom_editeur : String
    
    init(id_editeur:Int,nom_editeur:String){
        self.id_editeur = id_editeur
        self.nom_editeur = nom_editeur
    }
}
