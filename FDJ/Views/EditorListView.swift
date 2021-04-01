//
//  EditorListView.swift
//  FDJ
//
//  Created by user190389 on 3/31/21.
//

import SwiftUI

struct EditorListView: View {
    
    struct ColorManager {
        static let fjmgreen =
            Color("Greenfjm")
        static let fjmblue = Color("Bluefjm")
    }
    
    @ObservedObject var editorList: EditorListViewModel
    var intent : EditorListViewIntent
    
    init(editorList: EditorListViewModel) {
        self.editorList = editorList
        self.intent = EditorListViewIntent(editorList: editorList)
        
    }
    
    @State private var textfield: String = ""

    @State private var isSaisie = false
    
    func filterSearch(editeur: EditorViewModel) -> Bool {
            
            var res: Bool = true
            
            if (!textfield.isEmpty) {
                res = editeur.nom_editeur.lowercased().contains(textfield.lowercased())
            }
                    
            return res
    }
    
    var body: some View {
        VStack {
            Text("Liste des éditeurs")
                .font(.largeTitle)
                .foregroundColor(ColorManager.fjmblue)
            TextField("Chercher un éditeur", text: $textfield)
                                    .padding(7)
                                    .padding(.horizontal, 25)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal, 10)
                                    .onTapGesture {
                                        self.isSaisie = true
                                    }
            Spacer()
            ZStack {
                List {
                    ForEach(self.editorList.editors.filter(filterSearch)) { editor in
                        NavigationLink(
                            destination: EditorJeuxView(editorJeux: EditorJeuxViewModel(EditorJeux()), id_editor: editor.id_editeur),
                            label: {
                                Text(editor.nom_editeur)
                            })
                    }
                }
            }
        }.onAppear(perform: {
            self.intent.loadEditorList(surl: "http://localhost:8080/api/editeur")
        })
    }
}

struct EditorListView_Previews: PreviewProvider {
    static var previews: some View {
        EditorListView(
            editorList: EditorListViewModel(EditorList())
        )
    }
}
