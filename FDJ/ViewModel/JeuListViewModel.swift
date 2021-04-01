import Foundation

enum JeuListState : CustomStringConvertible{
    case ready
    case loading(String)
    case loaded([Jeu])
    case loadingError(Error)
    case newJeux([JeuViewModel])

    var description: String{
        switch self {
        case .ready                               : return "ready"
        case .loading(let s)                      : return "loading: \(s)"
        case .loaded(let jeux)                 : return "loaded: \(jeux.count) tracks"
        case .loadingError(let error)             : return "loadingError: Error loading -> \(error)"
        case .newJeux(let jeux)             : return "newTracks: reset playlist with \(jeux.count) tracks"
        }
    }
    
}

class JeuListViewModel: JeuListDelegate, ObservableObject{
    func jeuListModified(jeu: Jeu, index: Int) {
        return
    }
    
    func newJeuList() {
        self.jeux.removeAll()
        for jeu in self.model.jeux {
            self.jeux.append(JeuViewModel(jeu))
        }
        // state
    }
    
    private(set) var model: JeuList
    
    @Published private(set) var jeux = [JeuViewModel]()
    
    @Published var jeuListState : JeuListState = .ready{
            didSet{
                switch self.jeuListState {
                case let .loaded(data):
                    self.model.new(jeux: data)
                default:
                    return
                }
            }
        }
    
    init(_ jeuList: JeuList) {
        self.model = jeuList
        self.model.delegate = self
    }
    
    func new(jeux: [Jeu]) {
        self.model.new(jeux: jeux)
    }
}
