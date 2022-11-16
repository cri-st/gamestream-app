//
//  StartAppView.swift
//  GameStream
//
//  Created by Crist on 07/11/2022.
//

import SwiftUI

struct StartAppView: View {
    var maxWidth: CGFloat! = 450
    @ObservedObject var login = LoginViewModel(signedIn: false)
    @State private var loginType = true

    var body: some View {
        NavigationView() {
            if login.signedIn || login.isSignIn {
                AppTabView(login: self.login)
            } else {
                ZStack {
                    Spacer()
                    Color("marine").ignoresSafeArea()
                    VStack {
                        Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 32)
                            .offset(x: 0, y: 10)
                        VStack {
                            HStack {
                                Spacer()
                                Button("Login") {
                                    loginType = true
                                }.textCase(.uppercase)
                                    .foregroundColor(loginType ? .white : .gray)
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                Spacer()
                                Button("Sign Up") {
                                    loginType = false
                                }.textCase(.uppercase)
                                    .foregroundColor(!loginType ? .white : .gray)
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                Spacer()
                            }
                            if loginType == true {
                                LoginView(login: self.login)
                            } else {
                                RegisterView(login: self.login)
                            }
                        }.preferredColorScheme(.dark)
                    }.frame(width: maxWidth)
                }.navigationBarHidden(true)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

func chossePhoto() {
    print("elegir foto")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartAppView()
    }
}
