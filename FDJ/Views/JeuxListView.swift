//
//  JeuxListView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 01/04/2021.
//

import SwiftUI

struct JeuxListView: View {
    
    @ObservedObject var searchJeux : ListJeuxViewModel
    var jeuintent : JeuIntent
    
    @State private var textfield: String = ""

    @State private var isSaisie = false

    func filterSearch(jeu: JeuViewModel) -> Bool {

            var res: Bool = true

            if (!textfield.isEmpty) {
                res = jeu.name_jeu.lowercased().contains(textfield.lowercased())
            }

            return res
    }
    
    init(searchJeux : ListJeuxViewModel){
        self.searchJeux = searchJeux
        self.jeuintent = JeuIntent(jeuxlist : searchJeux)
        let _  = self.searchJeux.$jeuxListState.sink(receiveValue: stateChanged)
        if case .ready = self.searchJeux.jeuxListState {
            print("Ready")
            self.jeuintent.loadListJeuxFromApi()
        }
        print("Init jeuxlist")
    }
    
    private var searchState : SearchJeuxState{
        return self.searchJeux.jeuxListState
    }
    
    var jeux : [JeuViewModel] {
        return self.searchJeux.jeux
    }
    
    func stateChanged(state : SearchJeuxState){
        switch state {
        case let .loading(url):
            print("Loding: \(url)")
        case .newJeux:
            print("Charging")
        default:
            return
        }
    }
    var body: some View{
        ZStack{
            VStack{
                Text("Liste de jeux : ")
                    .font(.largeTitle)
                TextField("Chercher un zone", text: $textfield)
                                        .padding(7)
                                        .padding(.horizontal, 25)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(8)
                                        .padding(.horizontal, 10)
                                        .onTapGesture {
                                            self.isSaisie = true
                                        }
                Spacer()
                List{
                    ForEach(self.searchJeux.jeux.filter(filterSearch)){jeu in
                        NavigationLink(
                            destination: JeuDetailView(jeu:jeu.model),
                            label: {
                                Text("\(jeu.name_jeu)")
                            }).navigationViewStyle(StackNavigationViewStyle())
                    }
                }
            }
        }
    }
    
}

