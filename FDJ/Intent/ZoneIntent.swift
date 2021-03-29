//
//  ZoneIntent.swift
//  FDJ
//
//  Created by Jingjing XIANG on 28/03/2021.
//

import Foundation

class ZoneIntent {
    
    @ObservedObject var zone : SearchZoneViewModel
    
    init(zone: SearchZoneViewModel) {
        self.zone = zone
    }
    
    func loadZone(url : String){
        zone.searchZoneState = .loading(url)
        ZoneListHelper.loadZonesFromAPI(url: url, endofrequest: httpJsonLoaded)
    }
    
    func httpJsonLoaded(result: Result<Zone, HttpRequestError>){
        switch result{
        case let .success(data):
            print("success : \(data)")
            zone.searchZoneState = .loaded(data)
        case let .failure(error):
            zone.searchZoneState = .loadingError(error)
        }
    }
}
