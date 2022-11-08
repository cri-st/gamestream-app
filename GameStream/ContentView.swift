//
//  ContentView.swift
//  GameStream
//
//  Created by Crist on 07/11/2022.
//

import SwiftUI

struct ContentView: View {
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
            Spacer(minLength: 42)
            if loginType == true {
                LoginView()
            } else {
                RegisterView()
            }
        }
    }
}

struct Company: Identifiable, Hashable {
    var id = UUID()
    let name: String
}

struct LoginView: View {
    @State var email = ""
    @State var password = ""

    @State var editingField = ""

    var body: some View {
        ScrollView() {
            VStack(alignment: .leading) {
                Text("Email").foregroundColor(Color("dark-cian"))
                ZStack(alignment: .leading) {
                    Text("mail" + "@cri.st")
                        .foregroundColor(Color("light-gray"))
                        .font(.caption)
                        .opacity(email.isEmpty ? 1 : 0)
                    TextField("", text: $email)
                        .disableAutocorrection(true)
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
                NavigationLink(destination: {Home()}) {
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
        }.padding(.horizontal, 77.0) 
    }
}

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @State var editingField = ""

    var body: some View {
        ScrollView() {
            VStack(alignment: .center) {
                Text("Choose a profile picture")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 2)
                Text("You can change or choose it later")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                Button(action: chossePhoto, label: {
                    ZStack {
                        Image("ExamplePhoto")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 85, height: 85)
                        Image(systemName: "camera").foregroundColor(.white)
                    }
                }).padding(.bottom)
            }
            VStack(alignment: .leading) {
                Text("Email*").foregroundColor(Color("dark-cian"))
                ZStack(alignment: .leading) {
                    Text("mail" + "@cri.st")
                        .disableAutocorrection(true)
                        .foregroundColor(Color("light-gray"))
                        .font(.caption)
                        .opacity(email.isEmpty ? 1 : 0)
                    TextField("", text: $email)
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
                Text("Password*").foregroundColor(.white)
                ZStack(alignment: .leading) {
                    Text("********")
                        .foregroundColor(Color("light-gray"))
                        .font(.caption)
                        .opacity(password.isEmpty ? 1 : 0)
                    SecureField("", text: $password)
                        .foregroundColor(.white)
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
                Text("Confirm Password*").foregroundColor(.white)
                ZStack(alignment: .leading) {
                    Text("********")
                        .foregroundColor(Color("light-gray"))
                        .font(.caption)
                        .opacity(confirmPassword.isEmpty ? 1 : 0)
                    SecureField("", text: $confirmPassword)
                        .foregroundColor(.white)
                        .onTapGesture {
                            editingField = "confirmPassword"
                        }
                        .overlay(
                            VStack{
                                Divider()
                                    .frame(height: 1)
                                    .background(editingField == "confirmPassword" ? Color("dark-cian") : .white)
                                    .padding(.bottom)
                                .offset(x: 0, y: 20)})
                }.padding(.bottom, 42).frame(width: 300)
                Button(action: register, label: {
                    Text("Sign Up")
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
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("dark-cian"), lineWidth: 1.0)
                                .shadow(color: .white, radius: 6)
                        )
                }).padding(.bottom, 42)
            }
            VStack {
                Text("Register with social network")
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
                            .frame(maxWidth: 100,
                                   alignment: .center)
                            .padding(
                                EdgeInsets(top: 11,
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
                            .frame(maxWidth: 100,
                                   alignment: .center)
                            .padding(
                                EdgeInsets(top: 11,
                                           leading: 18,
                                           bottom: 11, trailing: 18)
                            )
                    }.background(Color("blue-gray")).cornerRadius(6.0)
                    Spacer()
                }
            }
        }.padding(.horizontal, 77.0)
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
        Image("Pantalla2").resizable()
        ContentView()
    }
}
