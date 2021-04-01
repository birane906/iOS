import SwiftUI

struct JeuView: View {
    
//    @ObservedObject var searchJeux : ListJeuxViewModel
//    var jeuintent : JeuIntent
//
//    init(searchJeux : ListJeuxViewModel){
//        self.searchJeux = searchJeux
//        self.jeuintent = JeuIntent(jeuxlist : searchJeux)
//        let _  = self.searchJeux.$jeuxListState.sink(receiveValue: stateChanged)
//        if case .ready = self.searchJeux.jeuxListState {
//            print("Ready")
//            self.jeuintent.loadListJeuxFromApi()
//        }
//        print("Init zonelist")
//    }
//
//    private var searchState : SearchJeuxState{
//        return self.searchJeux.jeuxListState
//    }
//
//    var jeux : [JeuViewModel] {
//        return self.searchJeux.jeux
//    }
//
//    func stateChanged(state : SearchJeuxState){
//        switch state {
//        case let .loading(url):
//            print("Loding: \(url)")
//        case .newJeux:
//            print("Charging")
//        default:
//            return
//        }
//    }
    
    var jeux : [Jeu]
    var jeuList : JeuListViewModel

    init(jeux:[Jeu]){
        self.jeux=jeux
    }
    
    var body: some View {
        VStack{
            Text("Liste de jeux ")
            List{
                ForEach(self.jeux){jeu in
                    NavigationLink(
                        destination : JeuDetailView(jeu:jeu),
                        label : {
                            Text("\(jeu.name_jeu)")
                        }
                    ).navigationViewStyle(StackNavigationViewStyle())
                }
            }
        }
}

struct JeuView_Previews: PreviewProvider {
    static var previews: some View {
        JeuListView(jeuList: JeuListViewModel(JeuList()))
    }
}
