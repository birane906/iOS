//
//  ZoneDetail.swift
//  FDJ
//
//  Created by Jingjing XIANG on 24/03/2021.
//

import SwiftUI

struct ZoneDetail: View {
    var zone:Zone
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .center, spacing: 6){
                Text(String(zone.id_zone))
            }
            VStack(alignment: .center, spacing: 6){
                Text(String(zone.name_zone))
            }
        }
    }
}

