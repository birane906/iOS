//
//  ZoneJeux.swift
//  FDJ
//
//  Created by Jingjing XIANG on 01/04/2021.
//

import Foundation

protocol ZoneJeuxDelegate {
    func zoneJeuxModified(jeu: Jeu, index: Int)
    func newZoneJeux()
}

class ZoneJeux : ObservableObject{
    var delegate : ZoneJeuxDelegate?
    
    private(set) var jeux = [Jeu]()
    
    func new(jeux: [Jeu]) {
        self.jeux = jeux
        self.delegate?.newZoneJeux()
    }
}
