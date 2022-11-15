//
//  DataSaver.swift
//  GameStream
//
//  Created by Crist on 12/11/2022.
//

import Foundation
import UIKit

class DataSaver {
    static let userEmailKey = "userEmail"
    static let userPassKey = "userPass"
    static let userNameKey = "userName"

    var email: String = ""
    var password: String = ""
    var userName: String = ""

    static let shared = DataSaver()

    private init() {}

    func saveData(email:String, password: String, userName: String) {
        UserDefaults.standard.set(email, forKey: DataSaver.userEmailKey)
        UserDefaults.standard.set(userName, forKey: DataSaver.userNameKey)
        if !password.isEmpty {
            UserDefaults.standard.set(password, forKey: DataSaver.userPassKey)
        }
    }
    
    func dataRecovery(key: String) -> String {
        if UserDefaults.standard.object(forKey: key) != nil {
            return UserDefaults.standard.string(forKey: key)!
        }
        return ""
    }

    func dataRecovery1() -> [String] {
        var data: [String] = [String]()
        if UserDefaults.standard.object(forKey: DataSaver.userEmailKey) != nil {
            data.append(UserDefaults.standard.string(forKey: DataSaver.userEmailKey)!)
        }
        if UserDefaults.standard.object(forKey: DataSaver.userNameKey) != nil {
            data.append(UserDefaults.standard.string(forKey: DataSaver.userNameKey)!)
        }
        if UserDefaults.standard.object(forKey: DataSaver.userPassKey) != nil {
            data.append(UserDefaults.standard.string(forKey: DataSaver.userPassKey)!)
        }
        return data
    }

    func validateLogin(email:String, password: String) -> Bool {
        return UserDefaults.standard.object(forKey: DataSaver.userEmailKey) != nil &&
        UserDefaults.standard.string(forKey: DataSaver.userEmailKey)! == email &&
        UserDefaults.standard.object(forKey: DataSaver.userPassKey) != nil &&
        UserDefaults.standard.string(forKey: DataSaver.userPassKey)! == password
    }

    func recoverProfilePhoto() -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            if #available(iOS 16.0, *) {
                return UIImage(contentsOfFile: URL(filePath: dir.absoluteString).appendingPathComponent("profilePhoto.png").path)
            } else {
                return UIImage(contentsOfFile: NSURL.fileURL(withPathComponents: [dir.absoluteString, "profilePhoto.png"])!.path)
            }
        }
        return nil
    }
}
