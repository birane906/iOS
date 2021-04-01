import SwiftUI

struct EditorListView: View {
    var editorList : EditorListViewModel
    var body: some View {
        Text("Liste des Editeurs")
    }
}

struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        EditorListView()
    }
}
