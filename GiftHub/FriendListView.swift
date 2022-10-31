//
//  FriendListView.swift
//  GiftHub
//
//  Created by DWizard11 on 27/10/22.
//

import SwiftUI


struct FriendListView: View {
    
    @State var friends = ["Daniyal", "Felix"]
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { friend in
                    NavigationLink {
                        FriendDetailView()
                    } label: {
                        Text(friend)
                    }

                }
            }
            .searchable(text: $searchText, prompt: "Search Friends")
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
    
    struct FriendListView_Previews: PreviewProvider {
        static var previews: some View {
            FriendListView()
        }
    }
}
