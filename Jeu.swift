//
//  Jeu.swift
//  FDJ
//
//  Created by etud on 23/03/2021.
//

import Foundation

protocol JeuObserver {
    func name_jeu_changed(to name: String)
    func nbJoueurs_min_changed(to name: Int)
    func nbJoueurs_max_changed(to name: Int)
    func ageMin_changed(to name: Int)
    func Isprototype_changed(to name: Bool)
}


class Jeu {
    
    public var observer : JeuObserver?
    
    
    public var name_jeu : String{
        didSet {
            self.observer?.name_jeu_changed(to: self.name_jeu)
        }
    }
    public var nbJoueurs_min : Int{
        didSet {
            self.observer?.nbJoueurs_min_changed(to: self.nbJoueurs_min)
        }
    }
    public var nbJoueurs_max : Int{
        didSet {
            self.observer?.nbJoueurs_max_changed(to: self.nbJoueurs_max)
        }
    }
    public var ageMin : Int{
        didSet {
            self.observer?.ageMin_changed(to: self.ageMin)
        }
    }
    public var notice : String
    
    public var Isprototype : Bool{
        didSet {
            self.observer?.Isprototype_changed(to: self.Isprototype)
        }
    }
    
    init(name_jeu : String, nbJoueurs_min : Int, nbJoueurs_max : Int, ageMin : Int, notice : String, Isprototype : Bool){
        self.name_jeu = name_jeu
        self.nbJoueurs_min = nbJoueurs_min
        self.nbJoueurs_max = nbJoueurs_max
        self.ageMin = ageMin
        self.notice = notice
        self.Isprototype = Isprototype
        
    }
    
    
    
    
    
    
    
}
