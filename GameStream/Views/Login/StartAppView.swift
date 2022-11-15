//
//  StartAppView.swift
//  GameStream
//
//  Created by Crist on 07/11/2022.
//

import SwiftUI

struct StartAppView: View {
    var maxWidth: CGFloat! = 450

    var body: some View {
        NavigationView() {
            ZStack {
                Spacer()
                Color("marine").ignoresSafeArea()
                VStack {
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 32)
                        .offset(x: 0, y: 10)
                    StartAndRegisterView()
                }.frame(width: maxWidth)
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
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
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                Button("Sign Up") {
                    loginType = false
                }.textCase(.uppercase)
                    .foregroundColor(!loginType ? .gray : .white)
                    .font(.system(size: 18, weight: .bold))
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
