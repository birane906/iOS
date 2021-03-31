import Foundation
import SwiftUI

class JeuListViewIntent {
    @ObservedObject var jeuList : jeuListViewModel
    
    init(jeuList: jeuListViewModel) {
        self.jeuList = jeuList
    }
    
    func loadJeuList(surl: String) {
        guard let url = URL(string: surl) else {
            return
        }
        jeuList.jeuListState = .loading(surl)
        ApiHelper.getJsonData(from: url, endofrequest: httpJsonLoaded)
    }
    
    func httpJsonLoaded(result: Result<[jeu], HttpRequestError>){
        switch result{
        case let .success(data):
            print("success : \(data)")
            jeuList.jeuListState = .loaded(data)
        case let .failure(error):
            jeuList.jeuListState = .loadingError(error)
        }
    }
}