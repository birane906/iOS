//
//  EditorJeuxViewIntent.swift
//  FDJ
//
//  Created by user190389 on 3/31/21.
//
import Foundation
import SwiftUI

class EditorJeuxViewIntent {
    @ObservedObject var editorJeux : EditorJeuxViewModel
    
    init(editorJeux: EditorJeuxViewModel) {
        self.editorJeux = editorJeux
    }
    
    func loadEditorJeux(surl: String) {
        guard let url = URL(string: surl) else {
            return
        }
        editorJeux.editorJeuxState = .loading(surl)
        ApiHelper.getJsonData(from: url, endofrequest: httpJsonLoaded)
    }
    
    func httpJsonLoaded(result: Result<[Jeu], HttpRequestError>){
        switch result{
        case let .success(data):
            print("success : \(data)")
            editorJeux.editorJeuxState = .loaded(data)
        case let .failure(error):
            editorJeux.editorJeuxState = .loadingError(error)
        }
    }
}