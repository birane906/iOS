//
//  FDJApp.swift
//  FDJ
//
//  Created by Jingjing XIANG on 16/03/2021.
//

import SwiftUI

@main
struct FDJApp: App {
    
    @ObservedObject var searchZone = SearchZoneViewModel(Zonelist())
    
    init() {
        let zonelist = Zonelist()
        let searchZone = SearchZoneViewModel(zonelist)
        self.searchZone = searchZone
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(searchZone: searchZone)
        }
    }
}
