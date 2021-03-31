import Foundation
import SwiftUI

class JeuViewModel: Identifiable, Equatable {
    static func == (lhs: JeuViewModel, rhs: JeuViewModel) -> Bool {
        return lhs.id_jeu == rhs.id_jeu
    }
    
    @ObservedObject private(set) var model : Jeu
    
    var id_jeu : Int {
        return model.id_jeu
    }
    var name_jeu : String {
        return model.name_jeu
    }
    
    init(_ jeu: Jeu) {
        self.model = jeu
    }
}