//
//  FriendListView.swift
//  GiftHub
//
//  Created by DWizard11 on 27/10/22.
//

import SwiftUI
import Contacts

struct FriendSearchView: View {
    
    @State var friends = [Friend(name: "Daniyal"),
                          Friend(name: "Felix"),
    ]
    
    var body: some View {
        Text("Hello World")
            .padding()
            .onAppear {
                
                Task.init {
                    await fetchAllContacts()
                }
                
            }
            
    }
    func fetchAllContacts() async {
        // Running in background async
        
        // Get access to Contacts store
        let store = CNContactStore()
        
        // Specify which data keys we want to fetch
        let keys = [CNContactGivenNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        
        // Create fetch request
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        
        // Call method to fetch all contacts
        do {
            try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, result in
                
                // do something with contact
                print(contact.givenName)
                
            })
        }
        catch {
            // If there is an error, handle it here
            print("Error")
        }
    }
}

struct FriendSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FriendSearchView()
    }
}
