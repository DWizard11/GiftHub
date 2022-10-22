//
//  FriendSearchView.swift
//  GiftHub
//
//  Created by DWizard11 on 22/10/22.
//

import SwiftUI

struct FriendSearchView: View {
    
    @State private var searchText = ""
    
    @State var friends = [Friend(name: "Daniyal"),
                          Friend(name: "Felix"),
    ]
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { friend in
                    NavigationLink(destination: Text(friend)){
                        Text(friend)
                    }
                }
            }
            .searchable(text: $searchText)
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return friends
        } else {
            return friends.filter { $0.contains(searchText) }
        }
    }
}

struct FriendSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FriendSearchView()
    }
}
