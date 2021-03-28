//
//  JeuViewModel.swift
//  FDJ
//
//  Created by etud on 23/03/2021.
//

import Foundation


//class JeuViewModel : Identifiable, ObservableObject, JeuObserver{
//    
//    let id = UUID()
//    private var model : Jeu
//    
//    @Published private(set) var name_jeu : String
//    @Published private(set) var  nbJoueurs_min : Int
//    @Published private(set) var  nbJoueurs_max : Int
//    @Published private(set) var  ageMin : Int
//    @Published private(set) var notice : String
//    @Published private(set) var Isprototype : Bool
//
//    init(_ jeu : Jeu) {
//        self.model = jeu
//        self.name_jeu = jeu.name_jeu
//        self.nbJoueurs_min = jeu.nbJoueurs_min
//        self.nbJoueurs_max = jeu.nbJoueurs_max
//        self.ageMin = jeu.ageMin
//        self.notice = jeu.notice
//        self.Isprototype = jeu.Isprototype
//        jeu.observer = self
//    }
//    
//    func name_jeu_changed(to name: String) {
//        self.name_jeu = name
//    }
//    
//    func nbJoueurs_min_changed(to name: Int) {
//        self.nbJoueurs_min = name
//    }
//    
//    func nbJoueurs_max_changed(to name: Int) {
//        self.nbJoueurs_max = name
//    }
//    
//    func ageMin_changed(to name: Int) {
//        self.ageMin = name
//    }
//    
//    func Isprototype_changed(to name: Bool) {
//        self.Isprototype = name
//    }
//    
//    
//}
