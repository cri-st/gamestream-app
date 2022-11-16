//
//  RegisterView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var login: LoginViewModel

    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var editingField = ""
    
    @State private var passwordsDoNotMatch = false

    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Spacer(minLength: 32)
                    Text("Email*")
                        .foregroundColor(editingField == "email" ? Color("dark-cian") : .white)
                    ZStack(alignment: .leading) {
                        TextField("mail" + "@cri.st", text: $email)
                            .keyboardType(.emailAddress)
                            .foregroundColor(Color("light-gray"))
                            .textInputAutocapitalization(.never)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .autocorrectionDisabled()
                            .submitLabel(.next)
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
                    Text("Password*")
                        .foregroundColor(editingField == "password" ? Color("dark-cian") : .white)
                    ZStack(alignment: .leading) {
                        SecureField("********", text: $password)
                            .foregroundColor(Color("light-gray"))
                            .textInputAutocapitalization(.never)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .autocorrectionDisabled()
                            .submitLabel(.next)
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
                    Text("Confirm Password*")
                        .foregroundColor(editingField == "confirmPassword" ? Color("dark-cian") : .white)
                    ZStack(alignment: .leading) {
                        SecureField("********", text: $confirmPassword)
                            .foregroundColor(Color("light-gray"))
                            .textInputAutocapitalization(.never)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .autocorrectionDisabled()
                            .submitLabel(.done)
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
                            .font(.system(size: 17, weight: .bold, design: .rounded))
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
        .alert("Passwords do not match.", isPresented: $passwordsDoNotMatch) {
            Button("Ok", role: .cancel) {}
        }
        .alert(login.alertMessage, isPresented: $login.showAlert) {
            Button("Ok", role: .cancel) {}
        }
    }
    
    func register() {
        if (self.password == self.confirmPassword) {
            self.passwordsDoNotMatch = false
            login.signUp(email: self.email, password: self.password)
        } else {
            self.passwordsDoNotMatch = true
        }
    }
}

struct ProfilePictureView: View {
    @State var isCameraActive = false
    @State var profilePhotoImage: Image? = Image("ExamplePhoto")

    var body: some View {
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
            Button(action: { isCameraActive = true }, label: {
                ZStack {
                    self.profilePhotoImage!
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                        .clipShape(Circle())
                        .sheet(isPresented: $isCameraActive) {
                            SUImagePickerView(image: $profilePhotoImage, isPresented: $isCameraActive)
                        }
                    Image(systemName: "camera").foregroundColor(.white)
                }
            }).padding(.bottom)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(login: LoginViewModel(signedIn: false))
    }
}
