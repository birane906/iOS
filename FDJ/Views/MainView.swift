import SwiftUI

struct MainView: View {
    
    struct ColorManager {
        static let fjmgreen =
            Color("Greenfjm")
        static let fjmblue = Color("Bluefjm")
    }
    
    @StateObject var editorList: EditorListViewModel = EditorListViewModel(EditorList())
    @StateObject var searchZone : SearchZoneViewModel = SearchZoneViewModel(Zonelist())
    @StateObject var searchJeux : JeuListViewModel = JeuListViewModel(JeuList())
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    LogoImage()
                }
                ZStack{
                    Text("Bienvenu dans le festival du jeu 2020")
                        .padding()
                        .font(.system(size: 22, weight: .bold, design: .default))
                        .foregroundColor(ColorManager.fjmblue)
                }
                Text("Recherche une zone")
                    .padding()
                    .font(.system(size: 19, weight: .light, design: .default))
                    .foregroundColor(ColorManager.fjmgreen)
                ZStack{
                    NavigationLink(
                        destination : ZoneListView(searchZone: searchZone)
                    ){
                        ZoneButtom()
                    }
                }
                Text("Recherche un editeur")
                    .padding()
                    .font(.system(size: 19, weight: .light, design: .default))
                    .foregroundColor(ColorManager.fjmgreen)
                ZStack{
                    NavigationLink(
                        destination: EditorListView(editorList: editorList)
                    ){
                        EditeurButtom()
                    }
                }
                Text("Recherche un jeu")
                    .padding()
                    .font(.system(size: 19, weight: .light, design: .default))
                    .foregroundColor(ColorManager.fjmgreen)
                ZStack{
                    NavigationLink(
                        destination: JeuListView(jeuList: searchJeux)
                    ){
                        JeuButtom()
                    }
                }
            }
    
        }
    }

}

struct LogoImage: View {
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: 150, height: 80, alignment: .center)
            .clipped()
            .padding(.bottom,30)
    }
}

struct ZoneButtom: View {
    var body: some View {
        Text("Zone")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 180, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.blue)
            .cornerRadius(35.0)
    }
}

struct EditeurButtom: View {
    var body: some View {
        Text("Editeur")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 180, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.blue)
            .cornerRadius(35.0)
    }
}

struct JeuButtom: View {
    var body: some View {
        Text("Jeu")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 180, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.blue)
            .cornerRadius(35.0)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
