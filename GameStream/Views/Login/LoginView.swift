//
//  LoginView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var login: LoginViewModel

    @State private var email = ""
    @State private var password = ""

    @State private var editingField = ""

    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Spacer(minLength: 32)
                    Text("Email")
                        .foregroundColor(editingField == "email" ? Color("dark-cian") : .white)
                    ZStack(alignment: .leading) {
                        TextField("mail" + "@cri.st", text: $email)
                            .keyboardType(.emailAddress)
                            .foregroundColor(Color("light-gray"))
                            .textInputAutocapitalization(.never)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .autocorrectionDisabled()
                            .font(.caption)
                            .foregroundColor(.white)
                            .submitLabel(.next)
                            .onTapGesture {
                                editingField = "email"
                            }
                            .overlay(
                                VStack{
                                    Divider()
                                        .frame(height: 1)
                                        .background(editingField == "email" ? Color("dark-cian") : .white)
                                        .padding(.bottom)
                                    .offset(x: 0, y: 20)})
                    }.padding(.bottom)
                    Text("Password")
                        .foregroundColor(editingField == "password" ? Color("dark-cian") : .white)
                    ZStack(alignment: .leading) {
                        SecureField("********", text: $password)
                            .foregroundColor(Color("light-gray"))
                            .textInputAutocapitalization(.never)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .foregroundColor(.white)
                            .font(.caption)
                            .submitLabel(.done)
                            .onTapGesture {
                                editingField = "password"
                            }
                            .overlay(
                                VStack{
                                    Divider()
                                        .frame(height: 1)
                                        .background(editingField == "password" ? Color("dark-cian") : .white)
                                        .padding(.bottom)
                                    .offset(x: 0, y: 20)})
                    }.padding(.bottom)
                    Button("Forgot your password") {
                        print("Olvidaste")
                    }.font(.footnote)
                        .frame(width: 300,
                               alignment: .trailing)
                        .foregroundColor(Color("dark-cian"))
                        .padding(.bottom)
                    Button {
                        validateLogin()
                    } label: {
                        LoginText()
                    }
                    .padding(.bottom, 42)
                    Text("Social network's login")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                        .padding(.bottom, 6)
                    HStack {
                        Spacer()
                        Button {
                            print("facebook")
                        } label: {
                            Text("Facebook")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: 100, alignment: .center)
                                .padding(
                                    EdgeInsets(
                                        top: 11,
                                        leading: 18,
                                        bottom: 11,
                                        trailing: 18)
                                )
                        }.background(Color("blue-gray")).cornerRadius(6.0)
                        Spacer()
                        Button {
                            print("twitter")
                        } label: {
                            Text("Twitter")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(
                                    maxWidth: 100,
                                    alignment: .center)
                                .padding(
                                    EdgeInsets(
                                        top: 11,
                                        leading: 18,
                                        bottom: 11,
                                        trailing: 18
                                    )
                                )
                        }.background(Color("blue-gray")).cornerRadius(6.0)
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 77.0)
        }
        .alert(login.alertMessage, isPresented: $login.showAlert) {
            Button("Ok", role: .cancel) {}
        }
    }

    func validateLogin() {
        guard !self.email.isEmpty, !self.password.isEmpty else {
            return
        }
        login.signIn(email: email, password: password)
    }
}

struct LoginText: View {
    var body: some View {
        Text("Login")
            .textCase(.uppercase)
            .font(.system(size: 17, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity,
                   alignment: .center)
            .padding(
                EdgeInsets(top: 11,
                           leading: 18,
                           bottom: 11,
                           trailing: 18))
            .overlay(
                RoundedRectangle(cornerRadius: 6.0)
                    .stroke(Color("dark-cian"), lineWidth: 1.0)
                    .shadow(color: .white, radius: 6))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(login: LoginViewModel(signedIn: false))
    }
}
