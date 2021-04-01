//
//  ZoneJeuxView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 01/04/2021.
//

import SwiftUI

struct ColorManager {
    static let fjmgreen =
        Color("Greenfjm")
    static let fjmblue = Color("Bluefjm")
}

struct ZoneJeuxView: View {
    @ObservedObject var zoneJeux: ZoneJeuxViewModel
    var intent : ZoneJeuxViewIntent
    
    var id_zone : Int
    
    init(zoneJeux: ZoneJeuxViewModel, id_zone: Int) {
        self.zoneJeux = zoneJeux
        self.id_zone = id_zone
        self.intent = ZoneJeuxViewIntent(zoneJeux: zoneJeux)
        
    }
    
    @State private var textfield: String = ""

    @State private var isSaisie = false
    
    func filterSearch(jeu: JeuViewModel) -> Bool {
            
            var res: Bool = true
            
            if (!textfield.isEmpty) {
                res = jeu.name_jeu.lowercased().contains(textfield.lowercased())
            }
                    
            return res
    }
    
    var body: some View {
        VStack {
            Text("Liste des jeux")
                .font(.largeTitle)
                .foregroundColor(ColorManager.fjmblue)
            TextField("Chercher un jeu", text: $textfield)
                                    .padding(7)
                                    .padding(.horizontal, 25)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal, 10)
                                    .onTapGesture {
                                        self.isSaisie = true
                                    }
            
            ZStack {
                List {
                    ForEach(self.zoneJeux.jeux.filter(filterSearch)) { jeu in
                        NavigationLink(
                            destination: JeuDetailView(jeu:jeu.model),
                            label: {
                                Text("\(jeu.name_jeu)")
                            }).navigationViewStyle(StackNavigationViewStyle())
                    }
                }
            }
        }.onAppear(perform: {
            self.intent.loadZoneJeux(surl: "http://localhost:8080/api/listjeu?id_zone=" + String(id_zone))
        })
    }
}

struct ZoneJeuxView_Previews: PreviewProvider {
    static var previews: some View {
        ZoneJeuxView(zoneJeux: ZoneJeuxViewModel(ZoneJeux()), id_zone: 1)
    }
}
