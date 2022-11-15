//
//  RegisterView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @State var editingField = ""
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center) {
                    Spacer(minLength: 32)
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
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .foregroundColor(Color("light-gray"))
                            .font(.caption)
                            .opacity(email.isEmpty ? 1 : 0)
                        TextField("", text: $email)
                            .foregroundColor(.white)
                            .font(.caption)
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
                    Text("Confirm Password*").foregroundColor(.white)
                    ZStack(alignment: .leading) {
                        Text("********")
                            .foregroundColor(Color("light-gray"))
                            .font(.caption)
                            .opacity(confirmPassword.isEmpty ? 1 : 0)
                        SecureField("", text: $confirmPassword)
                            .foregroundColor(.white)
                            .font(.caption)
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
                            .font(.system(size: 17, weight: .bold))
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
                    Spacer(minLength: 42)
                }
            }
            .padding(.horizontal, 77.0)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
