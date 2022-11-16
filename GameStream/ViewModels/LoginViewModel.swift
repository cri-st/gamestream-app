//
//  LoginViewModel.swift
//  GameStream
//
//  Created by Crist on 15/11/2022.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var signedIn: Bool = false
    @Published var alertMessage = ""
    @Published var showAlert = false

    init(signedIn: Bool) {
        self.signedIn = signedIn
    }
    var isSignIn: Bool {
        return auth.currentUser != nil
    }

    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.alertMessage = "Loggin Error: \(error.localizedDescription)"
                self?.showAlert = true
            }
            DispatchQueue.main.async {
                if (error == nil) {
                    self?.signedIn = true
                }
            }
        }
    }

    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.alertMessage = "Register Error: \(error.localizedDescription)"
                self?.showAlert = true
            }
            DispatchQueue.main.async {
                if (error == nil) {
                    self?.signedIn = true
                }
            }
        }
    }

    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }

    func getEmail() -> String {
        return auth.currentUser?.email ?? ""
    }

    func update(email: String, password: String, userName: String) {
        let user = auth.currentUser
        user?.updateEmail(to: email) { [weak self] error in
            if let error = error {
                self?.alertMessage = "Update Email Error: \(error.localizedDescription)"
                self?.showAlert = true
            }
        }
        if !userName.isEmpty {
            if let currentUser = user?.createProfileChangeRequest() {
                currentUser.displayName = userName
                currentUser.commitChanges() { [weak self] error in
                    if let error = error {
                        self?.alertMessage = "Update Display Name Error: \(error.localizedDescription)"
                        self?.showAlert = true
                    }
                }
            }
        }
        if !password.isEmpty {
            user?.updatePassword(to: password) { [weak self] error in
                if let error = error {
                    self?.alertMessage = "Update Password Error: \(error.localizedDescription)"
                    self?.showAlert = true
                }
            }
        }
    }

    func getUsername() -> String {
        return auth.currentUser?.displayName ?? ""
    }
}
