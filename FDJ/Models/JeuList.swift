import Foundation

protocol JeuListDelegate {
    func jeuListModified(jeu: Jeu, index: Int)
    func newJeuList()
}

class JeuList : ObservableObject{
    var delegate : JeuListDelegate?
    
    private(set) var jeux = [Jeu]()
    
    func new(jeux: [Jeu]) {
        self.jeux = jeux
        self.delegate?.newJeuList()
    }
}