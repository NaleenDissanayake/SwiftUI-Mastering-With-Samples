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
    @State private var isAlertShown: Bool = false
    @State private var newWish: String = ""
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishList) { wish in
                    Text(wish.title)
                        .padding(10)
                        .swipeActions(edge: .trailing) {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Wish List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // add new wish item into the list
                        isAlertShown.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.medium)
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                if !wishList.isEmpty {
                    HStack {
                        Spacer()
                        Text("\(wishList.count) wish\(wishList.count > 1 ? "es" : "")")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .background(.ultraThinMaterial)
                }
            }
            .alert("Create a new wish", isPresented: $isAlertShown) {
                TextField("Add a new wish", text: $newWish)
                Button("Save") {
                    modelContext.insert(WishModel(title: newWish))
                    newWish = ""
                }
            }
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
