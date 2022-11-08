//
//  StartAppView.swift
//  GameStream
//
//  Created by Crist on 07/11/2022.
//

import SwiftUI

struct StartAppView: View {
    var body: some View {
        NavigationView() {
            ZStack {
                Spacer()
                Color(red: 21/255, green: 31/255, blue: 59/255).ignoresSafeArea()
                VStack {
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 32)
                    StartAndRegisterView()
                }
            }.navigationBarHidden(true)
        }
    }
}

struct StartAndRegisterView: View {
    @State var loginType = true
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Login") {
                    print("Inicio de sesion")
                    loginType = true
                }.textCase(.uppercase)
                    .foregroundColor(loginType ? .gray : .white)
                    .fontWeight(.bold)
                Spacer()
                Button("Sign Up") {
                    print("Registro")
                    loginType = false
                }.textCase(.uppercase)
                    .foregroundColor(!loginType ? .gray : .white)
                    .fontWeight(.bold)
                Spacer()
            }
            if loginType == true {
                LoginView()
            } else {
                RegisterView()
            }
        }
    }
}

func register() {
    print("registrar")
}

func chossePhoto() {
    print("elegir foto")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartAppView()
    }
}
