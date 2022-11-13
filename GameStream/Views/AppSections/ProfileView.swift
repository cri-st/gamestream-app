//
//  ProfileView.swift
//  GameStream
//
//  Created by Crist on 08/11/2022.
//

import SwiftUI

struct ProfileView: View {
    @State var userName = "Lanie Janecki"
    @State var profilePhoto:UIImage! = UIImage(named: "ExamplePhoto")

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
                        Image(uiImage: profilePhoto)
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
                        SettingsView()
                    }
                }.padding(.bottom, 8)
            }.padding(.horizontal, 5)
        }.onAppear {
            let savedUserName = DataSaver.shared.dataRecovery(key: DataSaver.userNameKey)
            if savedUserName != "" {
                userName = DataSaver.shared.dataRecovery(key: DataSaver.userNameKey)
            }
            if DataSaver.shared.recoverProfilePhoto() != nil {
                profilePhoto = DataSaver.shared.recoverProfilePhoto()
            }
        }
    }
}

struct SettingsView: View {
    @State var isNotificationsOn = false
    @State var showRateAlert = false

    var body: some View {
        VStack(spacing: 3) {
            NavigationLink(destination: EmptyView()) {
                HStack {
                    Text("Account").foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(.white)
                }
                .padding()
                .frame(height: 65)
            }
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

            NavigationLink(destination: EditProfileView()) {
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
        ProfileView()
    }
}
