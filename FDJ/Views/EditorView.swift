//
//  EditorView.swift
//  FDJ
//
//  Created by user190389 on 3/31/21.
//

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
