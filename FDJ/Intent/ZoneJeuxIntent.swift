//
//  ZoneJeuxIntent.swift
//  FDJ
//
//  Created by Jingjing XIANG on 01/04/2021.
//

import Foundation
import SwiftUI

class ZoneJeuxViewIntent {
    @ObservedObject var zoneJeux : ZoneJeuxViewModel

    init(zoneJeux: ZoneJeuxViewModel) {
        self.zoneJeux = zoneJeux
    }

    func loadZoneJeux(surl: String) {
        guard let url = URL(string: surl) else {
            return
        }
        zoneJeux.zoneJeuxState = .loading(surl)
        ApiHelper.getJsonData(from: url, endofrequest: httpJsonLoaded)
    }

    func httpJsonLoaded(result: Result<[Jeu], HttpRequestError>){
        switch result{
        case let .success(data):
            print("success : \(data)")
            zoneJeux.zoneJeuxState = .loaded(data)
        case let .failure(error):
            zoneJeux.zoneJeuxState = .loadingError(error)
        }
    }
}
