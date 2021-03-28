//
//  Jeu.swift
//  FDJ
//
//  Created by etud on 23/03/2021.
//

import Foundation
import Combine
import SwiftUI

struct Jeu : Decodable, Identifiable {
    public var id: Int
    public var name_jeu : String
    public var id_type : Int
    public var libelle_type : String
    public var duree : Int
    public var nb_joueurs_min : Int
    public var nb_joueurs_max : Int
    public var agemin : Int
    public var editeur : Editeur
    
    init(id:Int,name_jeu:String,id_type:Int,libelle_type:String,duree:Int,nb_joueurs_min:Int,nb_joueurs_max:Int,agemin:Int,editeur:Editeur){
        self.id = id
        self.name_jeu = name_jeu
        self.id_type = id_type
        self.libelle_type = libelle_type
        self.duree = duree
        self.nb_joueurs_min = nb_joueurs_min
        self.nb_joueurs_max = nb_joueurs_max
        self.agemin = agemin
        self.editeur = editeur
    }
}



//protocol JeuObserver {
//    func name_jeu_changed(to name: String)
//    func nbJoueurs_min_changed(to name: Int)
//    func nbJoueurs_max_changed(to name: Int)
//    func ageMin_changed(to name: Int)
//    func Isprototype_changed(to name: Bool)
//}
//
//
//class Jeu {
//
//    public var observer : JeuObserver?
//
//
//    public var name_jeu : String{
//        didSet {
//            self.observer?.name_jeu_changed(to: self.name_jeu)
//        }
//    }
//    public var nbJoueurs_min : Int{
//        didSet {
//            self.observer?.nbJoueurs_min_changed(to: self.nbJoueurs_min)
//        }
//    }
//    public var nbJoueurs_max : Int{
//        didSet {
//            self.observer?.nbJoueurs_max_changed(to: self.nbJoueurs_max)
//        }
//    }
//    public var ageMin : Int{
//        didSet {
//            self.observer?.ageMin_changed(to: self.ageMin)
//        }
//    }
//    public var notice : String
//
//    public var Isprototype : Bool{
//        didSet {
//            self.observer?.Isprototype_changed(to: self.Isprototype)
//        }
//    }
//
//    init(name_jeu : String, nbJoueurs_min : Int, nbJoueurs_max : Int, ageMin : Int, notice : String, Isprototype : Bool){
//        self.name_jeu = name_jeu
//        self.nbJoueurs_min = nbJoueurs_min
//        self.nbJoueurs_max = nbJoueurs_max
//        self.ageMin = ageMin
//        self.notice = notice
//        self.Isprototype = Isprototype
//    }
//
//}
