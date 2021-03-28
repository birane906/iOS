//
//  SearchZoneViewModel.swift
//  FDJ
//
//  Created by Jingjing XIANG on 28/03/2021.
//

import Foundation
import Combine

enum SearchZoneState : CustomStringConvertible{
    case ready
    case loading(String)
    case loaded(Zone)
    case loadingError(Error)
    case new(Zone)

    var description: String{
        switch self {
        case .ready : return "ready"
        case .loading(let s) : return "loading: \(s)"
        case .loaded(let zone) : return "loaded: \(zone.name_zone)"
        case .loadingError(let error) : return "loadingError: Error loading -> \(error)"
        case .new(let zone) : return "zone list: \(zone)"
        }
    }
}

class SearchZoneViewModel: ObservableObject{
    
    private(set) var model: Zone
    
    @Published var searchZoneState : SearchZoneState = .ready{
        didSet{
            switch self.searchZoneState {
            case let .loaded(data):
                print(data)
                model.new(zone: data)
                searchZoneState = .new(model)
            case .loadingError:
                print("error")
            default:
                return
            }
        }
    }
    
    init(_ zone : Zone) {
        self.model = zone
    }
    
}

