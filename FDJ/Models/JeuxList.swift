//
//  JeuxList.swift
//  FDJ
//
//  Created by Jingjing XIANG on 31/03/2021.
//

import Foundation

protocol JeuxlistDelegate {
    func jeuxlistModified(jeu: Jeu, index: Int)
    func newJeuxlist()
    func jeuxlistAdded(jeux: [Jeu])
    func jeuxlistDeleted()
    func jeuDeleted(at: Int)
    func jeuxMoved(from source: IndexSet, to destination: Int)
}


class Jeuxlist : ObservableObject{
    
    var delegate : JeuxlistDelegate?
    
    private(set) var jeux = [Jeu]()
    
    func add(jeu: Jeu){
        self.jeux.append(jeu)
        self.delegate?.jeuxlistModified(jeu: jeu, index: self.jeux.count-1)
    }
    func new(jeux: [Jeu]){
        self.jeux = jeux
        self.delegate?.newJeuxlist()
    }
    func add(jeux: [Jeu]){
        self.jeux.append(contentsOf: jeux)
        self.delegate?.jeuxlistAdded(jeux: jeux)
    }
    func removeAllJeux(){
        self.jeux.removeAll()
        self.delegate?.jeuxlistDeleted()
    }
    func deleteJeu(at index: Int){
        self.jeux.remove(at: index)
        self.delegate?.jeuDeleted(at: index)
    }
    func moveJeux(from source: IndexSet, to destination: Int){
        self.jeux.move(fromOffsets: source, toOffset: destination)
        self.delegate?.jeuxMoved(from: source, to: destination)
    }
}
