//
//  MainView.swift
//  SriLankaNature
//
//  Created by Naleen Dissanayake on 2026/01/16.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Browse", systemImage: "square.grid.2x2")
                }
            
            VideoListView()
                .tabItem {
                    Label("Watch", systemImage: "play.rectangle")
                }
            
            MapView()
                .tabItem {
                    Label("Locations", systemImage: "map")
                }
            
            GalleryView()
                .tabItem {
                    Label("Gallery", systemImage: "photo")
                }
        }
    }
}

#Preview {
    MainView()
}
