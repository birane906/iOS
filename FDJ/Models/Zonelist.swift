import Foundation


protocol ZonelistDelegate {
    func zonelistModified(zone: Zone, index: Int)
    func newZonelist()
    func zonelistAdded(zones: [Zone])
    func zonelistDeleted()
    func zoneDeleted(at: Int)
    func zonesMoved(from source: IndexSet, to destination: Int)
}


class Zonelist : ObservableObject{
    
    var delegate : ZonelistDelegate?
    
    private(set) var zones = [Zone]()
    
    func add(zone: Zone){
        self.zones.append(zone)
        self.delegate?.zonelistModified(zone: zone, index: self.zones.count-1)
    }
    func new(zones: [Zone]){
        self.zones = zones
        self.delegate?.newZonelist()
    }
    func add(zones: [Zone]){
        self.zones.append(contentsOf: zones)
        self.delegate?.zonelistAdded(zones: zones)
    }
    func removeAllZones(){
        self.zones.removeAll()
        self.delegate?.zonelistDeleted()
    }
    func deleteZone(at index: Int){
        self.zones.remove(at: index)
        self.delegate?.zoneDeleted(at: index)
    }
    func moveZones(from source: IndexSet, to destination: Int){
        self.zones.move(fromOffsets: source, toOffset: destination)
        self.delegate?.zonesMoved(from: source, to: destination)
    }
}