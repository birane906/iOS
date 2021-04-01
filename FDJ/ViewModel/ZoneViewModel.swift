import Foundation

class ZoneViewModel: Identifiable, Equatable {
    static func == (lhs: ZoneViewModel, rhs: ZoneViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    private(set) var model : Zone
    
    var id_zone : Int{
        return model.id_zone
    }
    var id_espace: Int{
        return model.id_espace
    }
    var name_zone: String{
        return model.name_zone
    }
    
    
    init(_ zone: Zone){
        self.model = zone
    }
    
}