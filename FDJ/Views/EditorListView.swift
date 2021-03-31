//
//  EditorListView.swift
//  FDJ
//
//  Created by user190389 on 3/31/21.
//

import SwiftUI

struct EditorListView: View {
    @ObservedObject var editorList: EditorListViewModel
    var intent : EditorListViewIntent
    
    init(editorList: EditorListViewModel) {
        self.editorList = editorList
        self.intent = EditorListViewIntent(editorList: editorList)
        self.intent.loadEditorList(surl: "http://176.136.177.203:18080/api/editeur")
    }
    
    var body: some View {
        VStack {
            Text("Liste des éditeurs")
            ZStack {
                List {
                    ForEach(self.editorList.editors) { editor in
                        NavigationLink(
                            destination: Text(editor.nom_editeur),
                            label: {
                                Text(editor.nom_editeur)
                            })
                    }
                }
            }
        }
    }
}

struct EditorListView_Previews: PreviewProvider {
    static var previews: some View {
        EditorListView(
            editorList: EditorListViewModel(EditorList())
        )
    }
}
