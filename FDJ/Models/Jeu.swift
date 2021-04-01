//
//  Jeu.swift
//  FDJ
//
//  Created by etud on 23/03/2021.
//

import Foundation

class Jeu : ObservableObject,Identifiable,Encodable,Decodable {
    
    public var id_jeu : Int
    public var name_jeu : String
    public var id_type : Int
    public var duree : Int
    public var nb_joueurs_min : Int
    public var nb_joueurs_max : Int
    public var agemin : Int
    public var name_zone : String
    public var editeurs : [Editeur]?
    
    init(id_jeu:Int,name_jeu:String,id_type:Int,libelle_type:String,duree:Int,nb_joueurs_min:Int,nb_joueurs_max:Int,agemin:Int,name_zone:String,editeurs:[Editeur]?){
        self.id_jeu = id_jeu
        self.name_jeu = name_jeu
        self.id_type = id_type
        self.duree = duree
        self.nb_joueurs_min = nb_joueurs_min
        self.nb_joueurs_max = nb_joueurs_max
        self.agemin = agemin
        self.name_zone = name_zone
        self.editeurs = editeurs!
    }
}


