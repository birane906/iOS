//
//  EditorJeuxView.swift
//  FDJ
//
//  Created by etud on 01/04/2021.
//

import SwiftUI

struct EditorJeuxView: View {
    @ObservedObject var editorJeux: EditorJeuxViewModel
    var intent : EditorJeuxViewIntent
    
    var id_editor : Int
    
    init(editorJeux: EditorJeuxViewModel, id_editor: Int) {
        self.editorJeux = editorJeux
        self.id_editor = id_editor
        self.intent = EditorJeuxViewIntent(editorJeux: editorJeux)
        
    }
    
    var body: some View {
        VStack {
            Text("Liste des jeux")
            ZStack {
                List {
                    ForEach(self.editorJeux.jeux) { jeu in
                        Text(jeu.name_jeu)
                    }
                }
            }
        }.onAppear(perform: {
            self.intent.loadEditorJeux(surl: "http://localhost:8080/api/listjeu?id_editeur=" + String(id_editor))
        })
    }
}

struct EditorJeuxView_Previews: PreviewProvider {
    static var previews: some View {
        EditorJeuxView(editorJeux: EditorJeuxViewModel(EditorJeux()), id_editor: 1)
    }
}
