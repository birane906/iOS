//
//  EditorList.swift
//  FDJ
//
//  Created by user190389 on 3/31/21.
//

import Foundation

protocol EditorListDelegate {
    func editorListModified(editor: Editor, index: Int)
    func newEditorList()
}

class EditorList : ObservableObject{
    var delegate : EditorListDelegate?
    
    private(set) var editors = [Editor]()
    
    func new(editors: [Editor]) {
        self.editors = editors
        self.delegate?.newEditorList()
    }
}
