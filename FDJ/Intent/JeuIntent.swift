//
//  JeuIntent.swift
//  FDJ
//
//  Created by etud on 23/03/2021.
//

import Foundation
import SwiftUI

class JeuIntent {
    @ObservedObject var jeuxlist : ListJeuxViewModel
    
    init(jeuxlist: ListJeuxViewModel) {
        self.jeuxlist = jeuxlist
    }
    
    func loaded(jeux:[Jeu]){
        self.jeuxlist.jeuxListState = .ready
    }
    
    func loaded(){
        self.jeuxlist.jeuxListState = .ready
    }
    
    func loadJeux(surl : String){
//        zonelist.zoneListState = .loading(surl)
//        ZoneListHelper.loadZonesFromAPI(url: surl, endofrequest: httpJsonLoaded)
        guard let url = URL(string: surl) else {
                    return
        }
        jeuxlist.jeuxListState = .loading(surl)
        ApiHelper.getJsonData(from: url, endofrequest: httpJsonLoaded)
    }
    
    func httpJsonLoaded(result: Result<[Jeu], HttpRequestError>){
        switch result{
        case let .success(data):
            print("success : \(data)")
            jeuxlist.jeuxListState = .loaded(data)
        case let .failure(error):
            jeuxlist.jeuxListState = .loadingError(error)
        }
    }
    
    func loadListJeuxFromApi(){
        let apijeu : String
        apijeu = "http://localhost:8080/api/listjeu"
        guard let url = URL(string: apijeu) else {
            return
        }
        self.jeuxlist.jeuxListState = .loading(apijeu)
        //ZoneListHelper.loadZonesFromAPI(url: apizone, endofrequest: httpJsonLoaded)
        ApiHelper.getJsonData(from: url, endofrequest: httpJsonLoaded)
    }
}
