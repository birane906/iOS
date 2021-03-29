//
//  ZoneListHelper.swift
//  FDJ
//
//  Created by Jingjing XIANG on 27/03/2021.
//

import Foundation

struct ZoneData: Codable{
    public var id_zone: Int
    public var id_espace : Int
    public var name_zone : String
}

struct ZoneListHelper {
    static func zoneData2Zone(data: ZoneData) -> [Zone]?{
        var zones = [Zone]()
        for zdata in data{
            let id : Int = zdata.id_zone
            let zone = Zone(id_zone: id, id_espace: zdata.id_espace,name_zone: zdata.name_zone)
            zones.append(zone)
        }
        return zones
    }
    
//    static func loadZones(fromFileUrl url: URL) -> Result<[Zone],HttpRequestError>{
//        let result = ApiHelper.loadJsonFile(from: url, dataType: [ZoneData].self)
//        switch result{
//        case let .success(data):
//            guard let zones = self.zoneData2Zone(data: data) else { return .failure(.JsonDecodingFailed) }
//            return .success(zones)
//        case let .failure(error):
//            return .failure(error)
//        }
//    }
    
    static func loadZonesFromAPI(url surl: String, endofrequest: @escaping (Result<[Zone],HttpRequestError>) -> Void){
        guard let url = URL(string: surl) else {
            endofrequest(.failure(.badURL(surl)))
            return
        }
        self.loadZonesFromAPI(url: url, endofrequest: endofrequest)
    }
    
    
    static func loadZonesFromAPI(url: URL, endofrequest: @escaping (Result<[Zone],HttpRequestError>) -> Void){
        self.loadZonesFromJsonData(url: url, endofrequest: endofrequest, ItuneApiRequest: true)
    }
    
    private static func loadZonesFromJsonData(url: URL, endofrequest: @escaping (Result<[Zone],HttpRequestError>) -> Void, ItuneApiRequest: Bool = true){
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decodedData : Decodable?
             
                decodedData = try? JSONDecoder().decode(ZoneData.self, from: data)
                
                guard let decodedResponse = decodedData else {
                    DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                    return
                }
                var zonesData : [ZoneData]
               
                zonesData = (decodedResponse as! [ZoneData])
                
                guard let zones = self.zoneData2Zone(data: zonesData) else{
                    DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                    return
                }
                
                DispatchQueue.main.async {
                    endofrequest(.success(zones))
                }
            }
            else{
                DispatchQueue.main.async {
                    if let error = error {
                        guard let error = error as? URLError else {
                            endofrequest(.failure(.unknown))
                            return
                        }
                        endofrequest(.failure(.failingURL(error)))
                    }
                    else{
                        guard let response = response as? HTTPURLResponse else{
                            endofrequest(.failure(.unknown))
                            return
                        }
                        guard response.statusCode == 200 else {
                            endofrequest(.failure(.requestFailed))
                            return
                        }
                        endofrequest(.failure(.unknown))
                    }
                }
            }
        }.resume()
    }

}
