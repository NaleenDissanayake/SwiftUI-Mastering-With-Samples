//
//  ContentView.swift
//  SwiftDataSampleApp
//
//  Created by Naleen Dissanayake on 2026/01/15.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishList: [WishModel]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishList) { wish in
                    Text(wish.title)
                        .padding(10)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Wish List")
            .overlay {
                if wishList.isEmpty {
                    ContentUnavailableView {
                        Label("No wishes to show.", systemImage: "heart.fill")
                    } description: {
                        Text("Add a new wish!")
                    }
                }
            }
        }
    }
}

#Preview("Wish List") {
    let container = try! ModelContainer(for: WishModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
                                             
    container.mainContext.insert(WishModel(title: "A very deep thought"))
    container.mainContext.insert(WishModel(title: "A very deep thought 2"))
    container.mainContext.insert(WishModel(title: "A very deep thought 3"))
    
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty Wish List") {
    ContentView()
        .modelContainer(for: WishModel.self, inMemory: true)
}
