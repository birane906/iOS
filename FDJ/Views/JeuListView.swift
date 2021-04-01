import SwiftUI

struct JeuListView: View {
    @ObservedObject var jeuList: JeuListViewModel
    var intent : JeuListViewIntent
    
    init(jeuList: JeuListViewModel) {
        self.jeuList = jeuList
        self.intent = JeuListViewIntent(jeuList: jeuList)
        
    }
    
    var body: some View {
        VStack {
            Text("Liste des jeux")
            ZStack {
                List {
                    ForEach(self.jeuList.jeux) { jeu in
                        NavigationLink(
                            destination: Text(jeu.name_jeu),
                            label: {
                                Text(jeu.name_jeu)
                            })
                    }
                }
            }
        }.onAppear(perform: {
            self.intent.loadJeuList(surl: "http://localhost:8080/api/listjeu")
        })
    }
}

struct JeuListView_Previews: PreviewProvider {
    static var previews: some View {
        JeuListView(
            jeuList: JeuListViewModel(JeuList())
        )
    }
}
