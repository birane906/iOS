//
//  ZoneListView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 24/03/2021.
//

import SwiftUI

struct ZoneListView: View {
    
    @ObservedObject var searchZone : SearchZoneViewModel
    @StateObject var searchJeux : ListJeuxViewModel = ListJeuxViewModel(Jeuxlist())
    
    var zoneintent : ZoneIntent
    
    @State private var textfield: String = ""

    @State private var isSaisie = false
    
    func filterSearch(zone: ZoneViewModel) -> Bool {
            
            var res: Bool = true
            
            if (!textfield.isEmpty) {
                res = zone.name_zone.lowercased().contains(textfield.lowercased())
            }
                    
            return res
    }
    
    init(searchZone : SearchZoneViewModel){
        self.searchZone = searchZone
        self.zoneintent = ZoneIntent(zonelist : searchZone)
        let _  = self.searchZone.$zoneListState.sink(receiveValue: stateChanged)
        if case .ready = self.searchZone.zoneListState {
            print("Ready")
            self.zoneintent.loadListZoneFromApi()
        }
        print("Init zonelist")
    }
    
    private var searchState : SearchZoneState{
        return self.searchZone.zoneListState
    }
    
    var zones : [ZoneViewModel] {
        return self.searchZone.zones
    }
    
    func stateChanged(state : SearchZoneState){
        switch state {
        case let .loading(url):
            print("Loding: \(url)")
        case .newZones:
            print("Charging")
        default:
            return
        }
    }
    var body: some View{
        ZStack{
            VStack{
                Text("Liste de zone : ")
                    .font(.largeTitle)
                TextField("Chercher un zone", text: $textfield)
                                        .padding(7)
                                        .padding(.horizontal, 25)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(8)
                                        .padding(.horizontal, 10)
                                        .onTapGesture {
                                            self.isSaisie = true
                                        }
                Spacer()
                List{
                    ForEach(self.searchZone.zones.filter(filterSearch)){zone in
                        NavigationLink(
                            destination: ZoneJeuxView(zoneJeux: ZoneJeuxViewModel(ZoneJeux()), id_zone: zone.id_zone),
                            label: {
                                Text("\(zone.name_zone)")
                            }).navigationViewStyle(StackNavigationViewStyle())
                    }
                }
            }
        }
    }
    
}


