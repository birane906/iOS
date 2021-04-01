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
