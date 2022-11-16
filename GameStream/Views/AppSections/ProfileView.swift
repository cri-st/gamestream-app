//
//  ProfileView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @ObservedObject var login: LoginViewModel
    @State var userName = "Lanie Janecki"
    @State var profilePhotoUrl: String = LoginViewModel.DefaultImage

    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            VStack {
                Text("Profile")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                ScrollView(showsIndicators: false) {
                    VStack {
                        KFImage(URL(string: self.profilePhotoUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 98, height: 98)
                            .clipShape(Circle())
                        Text(userName)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 6, leading: 0, bottom: 42, trailing: 0))
                    }
                    VStack {
                        Text("Settings")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 13)
                        SettingsView(login: self.login)
                    }
                }.padding(.bottom, 8)
            }.padding(.horizontal, 5)
        }.onAppear {
            userName = login.getUsername()
            profilePhotoUrl = login.getProfilePhoto()
        }
    }
}

struct SettingsView: View {
    @ObservedObject var login: LoginViewModel
    @State var isNotificationsOn = false
    @State var showRateAlert = false

    var body: some View {
        VStack(spacing: 3) {
            Button {
                self.login.signOut()
            } label: {
                HStack {
                    Text("Account").foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(.white)
                }
            }
            .padding()
            .frame(height: 65)
            .background(Color("blue-gray"))
            .clipShape(RoundedRectangle(cornerRadius: 5))

            HStack {
                Text("Notifications").foregroundColor(.white)
                Spacer()
                Toggle("", isOn: $isNotificationsOn)
            }
            .padding()
            .frame(height: 65)
            .background(Color("blue-gray"))
            .clipShape(RoundedRectangle(cornerRadius: 5))

            NavigationLink(destination: EditProfileView(login: self.login)) {
                HStack {
                    Text("Edit Profile").foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(.white)
                }
                .padding()
                .frame(height: 65)
            }
            .background(Color("blue-gray"))
            .clipShape(RoundedRectangle(cornerRadius: 5))

            HStack {
                Text("Rate this app").foregroundColor(.white)
                Spacer()
                Image(systemName: "chevron.right").foregroundColor(.white)
            }
            .padding()
            .frame(height: 65)
            .background(Color("blue-gray"))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .alert(isPresented: $showRateAlert) {
                Alert(title: Text("Rate App"), message: Text("Go to rate this app"), primaryButton: .default(Text ("Ok")) {
                    showRateAlert = false;
                }, secondaryButton: .cancel() {
                    showRateAlert = false;
                })
            }
            .onTapGesture {
                showRateAlert = true
            }

        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(login: LoginViewModel(signedIn: false))
    }
}
