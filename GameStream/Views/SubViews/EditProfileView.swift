//
//  EditProfileView.swift
//  GameStream
//
//  Created by Crist on 11/11/2022.
//

import SwiftUI

struct EditProfileView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var userName = ""
    
    @State var editingField = ""
    @State var passwordsDoNotMatch = false
    @State var dataSaved = false

    @State var profilePhoto: Image? = Image("ExamplePhoto")
    @State var isCameraActive = false

    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center) {
                    Text("Edit Profile")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                    Button(action: { isCameraActive = true }, label: {
                        ZStack {
                            profilePhoto!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 85, height: 85)
                                .clipShape(Circle())
                                .sheet(isPresented: $isCameraActive) {
                                    SUImagePickerView(image: self.$profilePhoto, isPresented: $isCameraActive)
                                }
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                    }).padding(.bottom)
                }
                VStack(alignment: .leading) {
                    Text("Email").foregroundColor(editingField == "email" ? Color("dark-cian") : .white)
                    ZStack(alignment: .leading) {
                        Text("mail" + "@cri.st")
                            .disableAutocorrection(true)
                            .foregroundColor(Color("light-gray"))
                            .font(.caption)
                            .opacity(email.isEmpty ? 1 : 0)
                        TextField("", text: $email, onEditingChanged: { focused in
                            if focused {
                                editingField = "email"
                            } else {
                                editingField = ""
                            }
                        })
                        .autocapitalization(.none)
                        .foregroundColor(.white)
                        .font(.caption)
                        .overlay(
                            VStack{
                                Divider()
                                    .frame(height: 1)
                                    .background(editingField == "email" ? Color("dark-cian") : .white)
                                    .padding(.bottom)
                                .offset(x: 0, y: 20)})
                    }.padding(.bottom)
                    Text("Name").foregroundColor(editingField == "userName" ? Color("dark-cian") : .white)
                    ZStack(alignment: .leading) {
                        Text("User Name")
                            .disableAutocorrection(true)
                            .foregroundColor(Color("light-gray"))
                            .font(.caption)
                            .opacity(userName.isEmpty ? 1 : 0)
                        TextField("", text: $userName, onEditingChanged: { focused in
                            if focused {
                                editingField = "userName"
                            } else {
                                editingField = ""
                            }
                        })
                        .foregroundColor(.white)
                        .font(.caption)
                        .overlay(
                            VStack{
                                Divider()
                                    .frame(height: 1)
                                    .background(editingField == "userName" ? Color("dark-cian") : .white)
                                    .padding(.bottom)
                                .offset(x: 0, y: 20)})
                    }.padding(.bottom)
                    Text("New Password").foregroundColor(editingField == "password" ? Color("dark-cian") : .white)
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
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded {
                                        editingField = "password"
                                    }
                            )
                            .overlay(
                                VStack{
                                    Divider()
                                        .frame(height: 1)
                                        .background(editingField == "password" ? Color("dark-cian") : .white)
                                        .padding(.bottom)
                                    .offset(x: 0, y: 20)})
                    }.padding(.bottom)
                    Text("Confirm New Password").foregroundColor(editingField == "confirmPassword" ? Color("dark-cian") : .white)
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
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded {
                                        editingField = "confirmPassword"
                                    }
                            )
                            .overlay(
                                VStack{
                                    Divider()
                                        .frame(height: 1)
                                        .background(editingField == "confirmPassword" ? Color("dark-cian") : .white)
                                        .padding(.bottom)
                                    .offset(x: 0, y: 20)})
                    }.padding(.bottom).frame(width: 300)
                    Button(action: {
                        if (password == confirmPassword) {
                            updateData()
                            passwordsDoNotMatch = false
                            dataSaved = true
                        } else {
                            passwordsDoNotMatch = true
                        }
                    }, label: {
                        Text("Update")
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
                    })
                    .alert(isPresented: $passwordsDoNotMatch) {
                        Alert(title: Text("Passwords do not match"), message: Text("Passwords do not match"), dismissButton: .default(Text("Ok")))
                    }
                    .alert(isPresented: $dataSaved) {
                        Alert(title: Text("Data saved correctly"), message: Text("Data saved correctly"), dismissButton: .default(Text("Ok")))
                    }
                    .padding(.bottom, 42)
                }
            }
            .padding(.horizontal, 77.0)
        }
        .onAppear(perform: {
            let email = DataSaver.shared.dataRecovery(key: DataSaver.userEmailKey)
            let userName = DataSaver.shared.dataRecovery(key: DataSaver.userNameKey)
            if !email.isEmpty {
                self.email = email
            }
            if !userName.isEmpty {
                self.userName = userName
            }
            
            if DataSaver.shared.recoverProfilePhoto() != nil {
                profilePhoto = Image(uiImage: DataSaver.shared.recoverProfilePhoto()!)
            }
        })
    }

    func updateData() {
        DataSaver.shared.saveData(email: email, password: password, userName: userName)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
