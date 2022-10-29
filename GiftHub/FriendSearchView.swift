//
//  FriendListView.swift
//  GiftHub
//
//  Created by DWizard11 on 27/10/22.
//

import SwiftUI

struct FriendListView: View {
    
    @State var friends = [Friend(name: "Daniyal"),
                          Friend(name: "Felix"),
    ]
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .searchable(text: $searchText)
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}
