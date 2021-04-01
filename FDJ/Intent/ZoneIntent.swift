import Foundation

class ZoneIntent {
    
    var zonelist : SearchZoneViewModel
    
    init(zonelist: SearchZoneViewModel) {
        self.zonelist = zonelist
    }
    
    func loaded(zones:[Zone]){
        self.zonelist.zoneListState = .ready
    }
    
    func loadZone(url : String){
        zonelist.zoneListState = .loading(url)
        ZoneListHelper.loadZonesFromAPI(url: url, endofrequest: httpJsonLoaded)
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
        var url = "http://localhost:8080/api/zone"
        self.zonelist.zoneListState = .loading(url)
        ZoneListHelper.loadZonesFromAPI(url: url, endofrequest: httpJsonLoaded)
    }
}
