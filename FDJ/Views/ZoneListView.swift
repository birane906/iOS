//
//  ZoneListView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 24/03/2021.
//

import SwiftUI

struct ZoneListView: View {
    
    @ObservedObject var searchZone : SearchZoneViewModel
    var zoneintent : ZoneIntent
    
    init(searchZone : SearchZoneViewModel){
        self.searchZone = searchZone
        self.zoneintent = ZoneIntent(zonelist : searchZone)
        let _ = self.searchZone.$zoneListState.sink(receiveValue: stateChanged)
        self.zoneintent.loadListZoneFromApi()
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
                Spacer()
                List{
                    ForEach(self.searchZone.zones){zone in
                        NavigationLink(
                            destination: Text("nowhere"),
                            label: {
                                /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                            })
                    }
                }
            }
        }
    }
    
}


