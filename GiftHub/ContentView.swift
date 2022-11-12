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
            HomeCalendarView()
                .tabItem {
                    Label("Homepage", systemImage: "house.fill")
                }
            FriendListView(contact: ContactInfo.init(firstName: "", lastName: ""))
                .tabItem {
                    Label("Friends Search", systemImage: "person.fill")
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
