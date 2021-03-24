//
//  ZoneListView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 24/03/2021.
//

import SwiftUI

struct ZoneListView: View {
    var zone:Zone
    var body: some View {
        HStack(alignment: .center, spacing: 9){
            VStack{
                Text(String(zone.id_zone)).bold()
            }
            VStack{
                Text(String(zone.name_zone)).bold()
            }
        }
    }
}


