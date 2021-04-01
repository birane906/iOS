//
//  EditorViewModel.swift
//  FDJ
//
//  Created by user190389 on 3/31/21.
//

import Foundation
import SwiftUI

class EditorViewModel: Identifiable, Equatable {
    static func == (lhs: EditorViewModel, rhs: EditorViewModel) -> Bool {
        return lhs.id_editeur == rhs.id_editeur
    }
    
    @ObservedObject private(set) var model : Editor
    
    var id_editeur : Int {
        return model.id_editeur
    }
    var nom_editeur : String {
        return model.nom_editeur
    }
    
    init(_ editor: Editor) {
        self.model = editor
    }
}
