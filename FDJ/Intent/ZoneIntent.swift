import Foundation
import SwiftUI

class ZoneIntent {
    
    @ObservedObject var zonelist : SearchZoneViewModel
    
    init(zonelist: SearchZoneViewModel) {
        self.zonelist = zonelist
    }
    
    func loaded(zones:[Zone]){
        self.zonelist.zoneListState = .ready
    }
    
    func loaded(){
        self.zonelist.zoneListState = .ready
    }
    
    func loadZone(surl : String){
//        zonelist.zoneListState = .loading(surl)
//        ZoneListHelper.loadZonesFromAPI(url: surl, endofrequest: httpJsonLoaded)
        guard let url = URL(string: surl) else {
                    return
                }
                zonelist.zoneListState = .loading(surl)
                ApiHelper.getJsonData(from: url, endofrequest: httpJsonLoaded)
    }
    
    func httpJsonLoaded(result: Result<[Zone], HttpRequestError>){
        switch result{
        case let .success(data):
            print("success : \(data)")
            zonelist.zoneListState = .loaded(data)
        case let .failure(error):
            zonelist.zoneListState = .loadingError(error)
        }
    }
    
    func loadListZoneFromApi(){
        let apizone : String
        apizone = "http://localhost:8080/api/zone"
        guard let url = URL(string: apizone) else {
                    return
        }
        self.zonelist.zoneListState = .loading(apizone)
        //ZoneListHelper.loadZonesFromAPI(url: apizone, endofrequest: httpJsonLoaded)
        ApiHelper.getJsonData(from: url, endofrequest: httpJsonLoaded)
    }
}
