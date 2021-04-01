import SwiftUI

struct JeuView: View {
    @ObservedObject var jeuList : JeuListViewModel
    var intent : JeuListViewIntent

    init(jeuList : JeuListViewModel){
        self.jeuList = jeuList
        self.intent = JeuListViewIntent(jeuList: jeuList)
    }
    
    var body: some View {
        VStack{
            Text("Liste de jeux ")
            List{
                ForEach(self.jeuList.jeux){jeu in
                    NavigationLink(
                        destination : JeuDetailView(jeu: jeu.model),
                        label : {
                            Text("\(jeu.name_jeu)")
                        }
                    ).navigationViewStyle(StackNavigationViewStyle())
                }
            }
        }
    }
}

struct JeuView_Previews: PreviewProvider {
    static var previews: some View {
        JeuListView(jeuList: JeuListViewModel(JeuList()))
    }
}
