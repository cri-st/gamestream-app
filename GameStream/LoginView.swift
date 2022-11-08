//
//  LoginView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    @State var editingField = ""
    
    var body: some View {
        ZStack {
            Color(red: 21/255, green: 31/255, blue: 59/255).ignoresSafeArea()
            ScrollView() {
                VStack(alignment: .leading) {
                    Spacer(minLength: 32)
                    Text("Email").foregroundColor(Color("dark-cian"))
                    ZStack(alignment: .leading) {
                        Text("mail" + "@cri.st")
                            .foregroundColor(Color("light-gray"))
                            .font(.caption)
                            .opacity(email.isEmpty ? 1 : 0)
                        TextField("", text: $email)
                            .disableAutocorrection(true)
                            .font(.caption)
                            .foregroundColor(.white)
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
                    Text("Password").foregroundColor(.white)
                    ZStack(alignment: .leading) {
                        Text("********")
                            .foregroundColor(Color("light-gray"))
                            .font(.caption)
                            .opacity(password.isEmpty ? 1 : 0)
                        SecureField("", text: $password)
                            .foregroundColor(.white)
                            .font(.caption)
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
                    NavigationLink(destination: {AppTabView()}) {
                        Text("Login")
                            .textCase(.uppercase)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,
                                   alignment: .center)
                            .padding(
                                EdgeInsets(top: 11,
                                           leading: 18,
                                           bottom: 11,
                                           trailing: 18)
                            ).overlay(
                                RoundedRectangle(cornerRadius: 6.0)
                                    .stroke(Color("dark-cian"), lineWidth: 1.0)
                                    .shadow(color: .white, radius: 6))
                    }.padding(.bottom, 42)
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
            }.padding(.horizontal, 77.0).scrollIndicators(.hidden)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
