//
//  EditorJeux.swift
//  FDJ
//
//  Created by user190389 on 3/31/21.
//
import Foundation

protocol EditorJeuxDelegate {
    func editorJeuxModified(jeu: Jeu, index: Int)
    func newEditorJeux()
}

class EditorJeux : ObservableObject{
    var delegate : EditorJeuxDelegate?
    
    private(set) var jeux = [Jeu]()
    
    func new(jeux: [Jeu]) {
        self.jeux = jeux
        self.delegate?.newEditorJeux()
    }
}