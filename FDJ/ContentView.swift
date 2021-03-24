//
//  ContentView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 16/03/2021.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var zone = ZoneList()

    
    var body: some View {
        NavigationView{
            List(zone.listzone,id:\.id_zone){ zone in
                NavigationLink(destination: ZoneDetail(zone:zone)){
                    ZoneListView(zone:zone)
                }.navigationBarTitle("Liste de jeux")
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
