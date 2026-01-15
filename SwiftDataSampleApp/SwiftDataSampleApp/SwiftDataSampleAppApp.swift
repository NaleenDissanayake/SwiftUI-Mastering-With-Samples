//
//  SwiftDataSampleAppApp.swift
//  SwiftDataSampleApp
//
//  Created by Naleen Dissanayake on 2026/01/15.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataSampleAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: WishModel.self)
        }
    }
}
