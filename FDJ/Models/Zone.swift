import Foundation
import Combine

struct SZone: Decodable {
    private(set) var id_zone: Int
    private(set) var id_espace : Int
    private(set) var name_zone : String
}

class Zone : Decodable,ObservableObject,Identifiable {
    private(set) var id_zone: Int
    private(set) var id_espace : Int
    private(set) var name_zone : String
    private(set) var jeux : [Jeu]?
    
    init(id_zone : Int, id_espace :Int, name_zone : String, jeux : [Jeu]?){
        self.id_zone = id_zone
        self.id_espace = id_espace
        self.name_zone = name_zone
        self.jeux = jeux
    }
    
    func new (zone: Zone) {
        self.id_zone = zone.id_zone
        self.id_espace = zone.id_espace
        self.name_zone = zone.name_zone
        self.jeux = zone.jeux
    }
}

