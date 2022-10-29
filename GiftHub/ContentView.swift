//
//  ContentView.swift
//  GiftHub
//
//  Created by DWizard11 on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()

    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Homepage", systemImage: "house.fill")
                }
            FriendSearchView()
                .tabItem {
                    Label("Stats", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
