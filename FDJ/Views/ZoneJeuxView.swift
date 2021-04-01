//
//  ZoneJeuxView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 01/04/2021.
//

import SwiftUI

struct ZoneJeuxView: View {
    @ObservedObject var zoneJeux: ZoneJeuxViewModel
    var intent : ZoneJeuxViewIntent
    
    var id_zone : Int
    
    init(zoneJeux: ZoneJeuxViewModel, id_zone: Int) {
        self.zoneJeux = zoneJeux
        self.id_zone = id_zone
        self.intent = ZoneJeuxViewIntent(zoneJeux: zoneJeux)
        
    }
    
    var body: some View {
        VStack {
            Text("Liste des jeux")
            ZStack {
                List {
                    ForEach(self.zoneJeux.jeux) { jeu in
                        Text(jeu.name_jeu)
                    }
                }
            }
        }.onAppear(perform: {
            self.intent.loadZoneJeux(surl: "http://localhost:8080/api/listjeu?id_zone=" + String(id_zone))
        })
    }
}

struct EditorJeuxView_Previews: PreviewProvider {
    static var previews: some View {
        ZoneJeuxView(zoneJeux: ZoneJeuxViewModel(ZoneJeux()), id_zone: 1)
    }
}
