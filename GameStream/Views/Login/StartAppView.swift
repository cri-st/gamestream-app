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
                Color("marine").ignoresSafeArea()
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
                    loginType = true
                }.textCase(.uppercase)
                    .foregroundColor(loginType ? .gray : .white)
                    .fontWeight(.bold)
                Spacer()
                Button("Sign Up") {
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
