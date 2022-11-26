//
//  ContentView.swift
//  GiftHub
//
//  Created by DWizard11 on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    @StateObject var contactsManager = ContactInfoManager()
    
    var body: some View {
        TabView {
            HomeCalendarView(contactsManager: ContactInfoManager())
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            FriendListView(contactsManager: ContactInfoManager())
                .tabItem {
                    Label("Friends Search", systemImage: "person.fill")
                }
            GiftGuideView()
                .tabItem {
                    Label("Gift Guides", systemImage: "book")
                }
            GiftSearchView()
                .tabItem {
                    Label("Gift Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
