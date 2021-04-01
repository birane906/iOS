//
//  EditorJeuxView.swift
//  FDJ
//
//  Created by etud on 01/04/2021.
//
import SwiftUI

struct EditorJeuxView: View {
    
    struct ColorManager {
        static let fjmgreen =
            Color("Greenfjm")
        static let fjmblue = Color("Bluefjm")
    }
    
    @ObservedObject var editorJeux: EditorJeuxViewModel
    var intent : EditorJeuxViewIntent
    
    var id_editor : Int
    
    init(editorJeux: EditorJeuxViewModel, id_editor: Int) {
        self.editorJeux = editorJeux
        self.id_editor = id_editor
        self.intent = EditorJeuxViewIntent(editorJeux: editorJeux)
        
    }
    
    @State private var textfield: String = ""

    @State private var isSaisie = false
    
    func filterSearch(jeu: JeuViewModel) -> Bool {
            
            var res: Bool = true
            
            if (!textfield.isEmpty) {
                res = jeu.name_jeu.lowercased().contains(textfield.lowercased())
            }
                    
            return res
    }
    
    var body: some View {
        VStack {
            Text("Liste des jeux")
                .font(.largeTitle)
                .foregroundColor(ColorManager.fjmblue)
            TextField("Chercher un jeu", text: $textfield)
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
                    ForEach(self.editorJeux.jeux) { jeu in
                        NavigationLink(
                            destination: JeuDetailView(jeu:jeu.model),
                            label: {
                                Text("\(jeu.name_jeu)")
                            }).navigationViewStyle(StackNavigationViewStyle())
                    }
                }
            }
        }.onAppear(perform: {
            self.intent.loadEditorJeux(surl: "http://localhost:8080/api/jeu?id_editeur=" + String(id_editor))
        })
    }
}

struct EditorJeuxView_Previews: PreviewProvider {
    static var previews: some View {
        EditorJeuxView(editorJeux: EditorJeuxViewModel(EditorJeux()), id_editor: 1)
    }
}
