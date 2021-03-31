//
//  ListJeuxViewModel.swift
//  FDJ
//
//  Created by Jingjing XIANG on 31/03/2021.
//

import Foundation
import SwiftUI
import Combine

enum SearchJeuxState : CustomStringConvertible{
    case ready
    case loading(String)
    case loaded([Jeu])
    case loadingError(Error)
    case newJeux([JeuViewModel])

    var description: String{
        switch self {
        case .ready : return "ready"
        case .loading(let s) : return "loading: \(s)"
        case .loaded(let jeux) : return "loaded: \(jeux.count)"
        case .loadingError(let error) : return "loadingError: Error loading -> \(error)"
        case .newJeux(let jeux) : return "jeu list: \(jeux.count)"
        }
    }
}


class ListJeuxViewModel: JeuxlistDelegate,ObservableObject{
    
    private(set) var model: Jeuxlist

    @Published private(set) var jeux = [JeuViewModel]()
    
    func jeuxlistModified(jeu: Jeu, index: Int) {
        return
    }
    
    func newJeuxlist() {
        self.jeux.removeAll()
        for jeu in self.model.jeux{
            self.jeux.append(JeuViewModel(jeu))
        }
        self.jeuxListState = .newJeux(self.jeux)
    }
    
    func jeuxlistAdded(jeux: [Jeu]) {
        for jeu in jeux{
            self.jeux.append(JeuViewModel(jeu))
        }
        self.jeuxListState = .newJeux(self.jeux)
    }
    
    func jeuxlistDeleted() {
        self.jeux.removeAll()
    }
    
    func jeuDeleted(at: Int) {
        return
    }
    
    func jeuxMoved(from source: IndexSet, to destination: Int) {
        return
    }





@Published var jeuxAddingError : Bool = false{
    didSet{
        if !jeuxAddingError{
            jeuxListState = .ready
        }
    }
}

    @Published var jeuxListState : SearchJeuxState = .ready{
        didSet{
            #if DEBUG
                debugPrint("SearchPlvm : state.didSet = \(jeuxListState)")
            #endif
            switch self.jeuxListState {
            case let .loaded(data):
                print(data)
                self.model.new(jeux: data)
                //zoneListState = .new(model)
            case .loadingError:
                print("error loading")
            default:
                return
            }
        }
    }

    func add(jeux: [Jeu]){
       self.model.add(jeux: jeux)
    }

    init(_ jeuxlist : Jeuxlist) {
        self.model = jeuxlist
        self.model.delegate = self
    }

}

