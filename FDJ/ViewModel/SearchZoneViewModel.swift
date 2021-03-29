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
    case loaded([Zone])
    case loadingError(Error)
    case newZones([ZoneViewModel])

    var description: String{
        switch self {
        case .ready : return "ready"
        case .loading(let s) : return "loading: \(s)"
        case .loaded(let zones) : return "loaded: \(zones.count)"
        case .loadingError(let error) : return "loadingError: Error loading -> \(error)"
        case .newZones(let zones) : return "zone list: \(zones.count)"
        }
    }
}

class SearchZoneViewModel: ZonelistDelegate,ObservableObject{
    
    private(set) var model: Zonelist
    
    @Published private(set) var zones = [ZoneViewModel]()
    
    func zonelistModified(zone: Zone, index: Int) {
        return
    }
    
    func newZonelist() {
        self.zones.removeAll()
        for zone in self.model.zones{
            self.zones.append(ZoneViewModel(zone))
        }
        self.zoneListState = .newZones(self.zones)
    }
    
    func zonelistAdded(zones: [Zone]) {
        for zone in zones{
            self.zones.append(ZoneViewModel(zone))
        }
        self.zoneListState = .newZones(self.zones)
    }
    
    func zonelistDeleted() {
        self.zones.removeAll()
    }
    
    func zoneDeleted(at: Int) {
        return
    }
    
    func zonesMoved(from source: IndexSet, to destination: Int) {
        return
    }
    
    
//    @Published var zoneAddingError : Bool = false{
//        didSet{
//            if !zoneAddingError{
//                zoneListState = .ready
//            }
//        }
//    }
    
    @Published var zoneListState : SearchZoneState = .ready{
        didSet{
            switch self.zoneListState {
            case let .loaded(data):
                print(data)
                self.model.new(zones: data)
                //zoneListState = .new(model)
            case .loadingError:
                print("error")
            default:
                return
            }
        }
    }
    
    init(_ zonelist : Zonelist) {
        self.model = zonelist
        self.model.delegate = self
    }
    
}

