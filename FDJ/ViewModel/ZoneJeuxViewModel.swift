//
//  ZoneJeuxViewModel.swift
//  FDJ
//
//  Created by Jingjing XIANG on 01/04/2021.
//

import Foundation

enum ZoneJeuxState : CustomStringConvertible{
    case ready
    case loading(String)
    case loaded([Jeu])
    case loadingError(Error)
    case newJeux([JeuViewModel])

    var description: String{
        switch self {
        case .ready                               : return "ready"
        case .loading(let s)                      : return "loading: \(s)"
        case .loaded(let jeux)                 : return "loaded: \(jeux.count) jeux"
        case .loadingError(let error)             : return "loadingError: Error loading -> \(error)"
        case .newJeux(let jeux)             : return "newJeux: reset Jeux with \(jeux.count) Jeux"
        }
    }
    
}

class ZoneJeuxViewModel: ZoneJeuxDelegate, ObservableObject{
    func zoneJeuxModified(jeu: Jeu, index: Int) {
        return
    }
    
    func newZoneJeux() {
        self.jeux.removeAll()
        for jeu in self.model.jeux {
            self.jeux.append(JeuViewModel(jeu))
        }
        // state
    }
    
    private(set) var model: ZoneJeux
    
    @Published private(set) var jeux = [JeuViewModel]()
    
    @Published var zoneJeuxState : ZoneJeuxState = .ready{
            didSet{
                switch self.zoneJeuxState {
                case let .loaded(data):
                    self.model.new(jeux: data)
                default:
                    return
                }
            }
        }
    
    init(_ zoneJeux: ZoneJeux) {
        self.model = zoneJeux
        self.model.delegate = self
    }
    
    func new(jeux: [Jeu]) {
        self.model.new(jeux: jeux)
    }
}
