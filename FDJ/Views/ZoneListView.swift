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
    private var url : String = "http://localhost:8080/api/zone"
    
    init(searchZone : SearchZoneViewModel){
        self.searchZone = searchZone
        self.zoneintent = ZoneIntent(zone : searchZone)
        let _ = self.searchZone.$searchZoneState.sink(receiveValue: stateChanged)
        self.zoneintent.loadZone(url: url)
    }
    
    
    func stateChanged(state : SearchZoneState){
        switch state {
        case let .loading(url):
            print("Loding: \(url)")
        case .new:
            print("Charging")
        default:
            return
        }
    }
    var body: some View{
        ZStack{
            VStack{
                Text("Liste de zone :  \(searchZone.model.name_zone)")
                    .font(.largeTitle)
                Spacer()
                List{
                    ForEach(self.searchZone.model){zone in
                        NavigationLink(
                            destination: JeuView(zone: zone),
                            label: {
                                /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                            })
                    }
                }
            }
        }
    }
    
}


