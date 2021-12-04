//
//  MemandaApp.swift
//  Memanda
//
//  Created by Thaís Fernandes on 01/12/21.
//

import SwiftUI

@main
struct MemandaApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MemesView()
            }
            .accentColor(Color.primary)
            .tint(Color.primary)
        }
    }
}
