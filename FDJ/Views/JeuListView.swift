import SwiftUI

struct JeuListView: View {
    
    struct ColorManager {
        static let fjmgreen =
            Color("Greenfjm")
        static let fjmblue = Color("Bluefjm")
    }
    
    @ObservedObject var jeuList: JeuListViewModel
    var intent : JeuListViewIntent
    
    init(jeuList: JeuListViewModel) {
        self.jeuList = jeuList
        self.intent = JeuListViewIntent(jeuList: jeuList)
        
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
                    ForEach(self.jeuList.jeux.filter(filterSearch)) { jeu in
                        NavigationLink(
                            destination: JeuDetailView(jeu:jeu.model),
                            label: {
                                Text("\(jeu.name_jeu)")
                            }).navigationViewStyle(StackNavigationViewStyle())
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
