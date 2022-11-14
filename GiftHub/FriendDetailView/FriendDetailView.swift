//
//  FriendDetailView.swift
//  GiftHub
//
//  Created by DWizard11 on 31/10/22.
//

import SwiftUI
import Contacts

struct FriendDetailView: View {
    
    @State var friendbirthday = ""
    @State var dates = ["1 day", "4 days", "1 week", "1 month"]
    @State var selectedDate = "1 week"
    @State var friendname = ""
    var contact: ContactInfo
    
    var body: some View {
            Form {
                Section("Friend Name") {
                    Text("\(contact.firstName) \(contact.lastName)")
                }
                Section("Friend Birthday") {
                    Text(verbatim: "\(contact.birthday?.day ?? 0)/\(contact.birthday?.month ?? 0)/\(contact.birthday?.year ?? 0)")
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
                Section("Gift Ideas") {
                    NavigationLink("Add Gift Ideas") {
                        MainGiftIdeaView()
                    }
                }
                // 
            }
        
    }
}


struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(contact: .init(firstName: "", lastName: "", isStarred: true))
    }
}
