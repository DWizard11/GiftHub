//
//  FriendListView.swift
//  GiftHub
//
//  Created by DWizard11 on 27/10/22.
//

import SwiftUI
import Contacts

struct FriendListView: View {
    
    @State var friends = ["Daniyal", "Felix"]
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { friend in
                    Text(friend)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Friends")
        }
    }
    
    var searchResults : [String] {
        if searchText.isEmpty {
            return friends
        } else {
            return friends.filter { $0.contains(searchText)}
        }
    }
    
    struct FriendSearchView_Previews: PreviewProvider {
        static var previews: some View {
            FriendListView()
        }
    }
}
