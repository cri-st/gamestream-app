//
//  GameStreamApp.swift
//  GameStream
//
//  Created by Crist on 07/11/2022.
//

import SwiftUI
import Firebase

@main
struct GameStreamApp: App {
    var body: some Scene {
        WindowGroup {
            StartAppView()
        }
    }

    init() {
        FirebaseApp.configure()
    }
}
