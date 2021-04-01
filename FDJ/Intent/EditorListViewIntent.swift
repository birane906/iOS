import Foundation
import SwiftUI

class EditorListViewIntent {
    @ObservedObject var editorList : EditorListViewModel
    
    init(editorList: EditorListViewModel) {
        self.editorList = editorList
    }
    
    func loadEditorList(surl: String) {
        guard let url = URL(string: surl) else {
            return
        }
        editorList.editorListState = .loading(surl)
        ApiHelper.getJsonData(from: url, endofrequest: httpJsonLoaded)
    }
    
    func httpJsonLoaded(result: Result<[Editor], HttpRequestError>){
        switch result{
        case let .success(data):
            print("success : \(data)")
            editorList.editorListState = .loaded(data)
        case let .failure(error):
            editorList.editorListState = .loadingError(error)
        }
    }
}