//
//  ContentView.swift
//  FDJ
//
//  Created by Jingjing XIANG on 16/03/2021.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct ContentView: View {
    
    @State var username:String=""
    @State var password:String=""
    
    @State var authenticationFail:Bool=false
    @State var authenticationSuccessed:Bool=false
    var body: some View {
        ZStack{
            VStack{
                LogoImage()
                WelcomeText()
                UsernameTextField(username: $username)
                PasswordSecureField(password: $password)
                if authenticationFail {
                    Text("Nom d'utilisateur ou Mot de passe incorrete")
                        .offset(y:-10)
                        .foregroundColor(.red)
                }
                Button(action:{print("Boutton cliqué")}){
                    LoginButtom()
                        .padding(.bottom,50)
                }
                Button(action: {print("Boutton cliqué")}
                ){
                    Text("Accès visiteur")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                
            }
            .padding()
            if authenticationSuccessed{
                Text("Login succeded")
                    .font(.headline)
                    .frame(width: 250, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .animation(Animation.default)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Bienvenue")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom,30)
    }
}

struct LogoImage: View {
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: 150, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipped()
            .padding(.bottom,30)
    }
}

struct LoginButtom: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 180, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}

struct UsernameTextField: View {
    
    @Binding var username: String
    var body: some View {
        TextField("Nom d'utilisateur",text:$username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
    }
}

struct PasswordSecureField: View {
    
    @Binding var password:String
    var body: some View {
        SecureField("Mot de passe", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
    }
}
