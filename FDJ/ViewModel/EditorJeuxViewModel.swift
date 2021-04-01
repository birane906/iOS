//
//  EditorJeuxViewModel.swift
//  FDJ
//
//  Created by user190389 on 3/31/21.
//

import Foundation

enum EditorJeuxState : CustomStringConvertible{
    case ready
    case loading(String)
    case loaded([Jeu])
    case loadingError(Error)
    case newJeux([JeuViewModel])

    var description: String{
        switch self {
        case .ready                             : return "ready"
        case .loading(let s)                    : return "loading: \(s)"
        case .loaded(let jeux)                  : return "loaded: \(jeux.count)"
        case .loadingError(let error)           : return "loadingError: Error loading -> \(error)"
        case .newJeux(let jeux)                 : return "reset with \(jeux.count)"
        }
    }
    
}

class EditorJeuxViewModel: EditorJeuxDelegate, ObservableObject{
    func editorJeuxModified(jeu: Jeu, index: Int) {
        return
    }
    
    func newEditorJeux() {
        self.jeux.removeAll()
        for jeu in self.model.jeux {
            self.jeux.append(JeuViewModel(jeu))
        }
        // state
    }
    
    private(set) var model: EditorJeux
    
    @Published private(set) var jeux = [JeuViewModel]()
    
    @Published var editorJeuxState : EditorJeuxState = .ready{
            didSet{
                switch self.editorJeuxState {
                case let .loaded(data):
                    self.model.new(jeux: data)
                default:
                    return
                }
            }
        }
    
    init(_ editorJeux: EditorJeux) {
        self.model = editorJeux
        self.model.delegate = self
    }
    
    func new(jeux: [Jeu]) {
        self.model.new(jeux: jeux)
    }
}
