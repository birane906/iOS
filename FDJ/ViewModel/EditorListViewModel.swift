//
//  EditorListViewModel.swift
//  FDJ
//
//  Created by user190389 on 3/31/21.
//

import Foundation

enum EditorListState : CustomStringConvertible{
    case ready
    case loading(String)
    case loaded([Editor])
    case loadingError(Error)
    case newEditors([EditorViewModel])

    var description: String{
        switch self {
        case .ready                               : return "ready"
        case .loading(let s)                      : return "loading: \(s)"
        case .loaded(let editors)                 : return "loaded: \(editors.count) tracks"
        case .loadingError(let error)             : return "loadingError: Error loading -> \(error)"
        case .newEditors(let editors)             : return "newTracks: reset playlist with \(editors.count) tracks"
        }
    }
    
}

class EditorListViewModel: EditorListDelegate, ObservableObject{
    func editorListModified(editor: Editor, index: Int) {
        return
    }
    
    func newEditorList() {
        self.editors.removeAll()
        for editor in self.model.editors {
            self.editors.append(EditorViewModel(editor))
        }
        // state
    }
    
    private(set) var model: EditorList
    
    @Published private(set) var editors = [EditorViewModel]()
    
    @Published var editorListState : EditorListState = .ready{
            didSet{
                switch self.editorListState {
                case let .loaded(data):
                    self.model.new(editors: data)
                default:
                    return
                }
            }
        }
    
    init(_ editorList: EditorList) {
        self.model = editorList
        self.model.delegate = self
    }
    
    func new(editors: [Editor]) {
        self.model.new(editors: editors)
    }
}
