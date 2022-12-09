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
            HomeCalendarView(contactsManager: contactsManager)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            FriendListView(contactsManager: contactsManager)
                .tabItem {
                    Label("Contacts", systemImage: "person.fill")
                }
            GiftGuideView()
                .tabItem {
                    Label("Gift Suggestions", systemImage: "book")
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
