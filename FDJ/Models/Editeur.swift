//
//  Editeur.swift
//  FDJ
//
//  Created by Jingjing XIANG on 25/03/2021.
//

import Foundation
import Combine

struct Editeur : Encodable,Decodable {
    public var id_editeur: Int
    public var nom_editeur : String
    
    init(id_editeur:Int,nom_editeur:String){
        self.id_editeur = id_editeur
        self.nom_editeur = nom_editeur
    }
}

