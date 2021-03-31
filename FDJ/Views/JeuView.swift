//
//  JeuView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 28/03/2021.
//

import SwiftUI

struct JeuView: View {
    
    var zone : ZoneViewModel
    
    init(zone:ZoneViewModel){
        self.zone = zone
    }
    
    var body: some View {
        VStack{
            Text("Liste de jeux ")
//            List{
//                ForEach(self.zone.jeux!){jeu in
//                    NavigationLink(
//                        destination : JeuDetailView(jeu:jeu),
//                        label : {
//                            Text("\(jeu.name_jeu)")
//                        }
//                    )
//                }
//            }
        }
    }
}


