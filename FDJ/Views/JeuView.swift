import SwiftUI

struct JeuView: View {
    var jeuList : JeuListViewModel
    var body: some View {
        Text("Liste des jeux")
    }
}

struct JeuView_Previews: PreviewProvider {
    static var previews: some View {
        JeuListView(jeuList: JeuListViewModel(JeuList()))
    }
}
