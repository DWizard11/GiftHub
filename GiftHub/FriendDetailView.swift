//
//  FriendDetailView.swift
//  GiftHub
//
//  Created by DWizard11 on 31/10/22.
//

import SwiftUI

struct FriendDetailView: View {
    
    @State var friendbirthday = ""
    @State var dates = ["1 day", "4 days", "1 week", "1 month"]
    @State var selectedDate = "1 week"
    @State var friendname = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Friend Name") {
                    TextField("Friend Name", text: $friendname)
                }
                Section("Friend Birthday") {
                    TextField("Birthday", text: $friendbirthday)
                       
                    }
                //
                Section("Alert") {
                    Picker("Notification", selection: $selectedDate) {
                        ForEach(dates, id: \.self) { date in
                            Text(date)
                        }
                    }
                }
                //
                Section("Friend Likings") {
                    NavigationLink("Add Friend Likings") {
                        MainFriendLikingView()
                    }
                }
                Section("Friend Dislikes") {
                    NavigationLink("Add Friend Dislikes") {
                        MainFriendDislikesView()
                    }
                }
                Section("Gift Ideas") {
                    NavigationLink("Add Gift Ideas") {
                        MainGiftIdeaView()
                    }
                }
                //
            }
        }
    }
}


struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView()
    }
}
