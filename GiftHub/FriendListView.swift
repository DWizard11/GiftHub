//
//  FriendListView.swift
//  GiftHub
//
//  Created by DWizard11 on 27/10/22.
//

import SwiftUI
import Contacts



struct FriendListView: View {
    
    var contact: ContactInfo
    @State private var searchText = ""
    @State private var contacts = [ContactInfo.init(firstName: "", lastName: "", phoneNumber: nil)]
    @State private var showCancelButton: Bool = false
    
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    //search bar magnifying glass image
                    Image(systemName: "magnifyingglass").foregroundColor(.secondary)
                    
                    //search bar text field
                    TextField("Search", text: self.$searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    })
                    
                    // x Button
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                            .opacity(self.searchText == "" ? 0 : 1)
                    }
                }
                .padding(8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                
                // Cancel Button
                if self.showCancelButton  {
                    Button("Cancel") {
                        self.searchText = ""
                        self.showCancelButton = false
                    }
                }
            }
            .padding([.leading, .trailing,.top])
            
            NavigationView {
                Form {
                    Section("Others") {
                        List {
                            ForEach (self.contacts.filter({ (cont) -> Bool in self.searchText.isEmpty ? true : "\(cont)".lowercased().contains(self.searchText.lowercased())})) { contact in
                                NavigationLink {
                                    FriendDetailView()
                                } label: {
                                    Text("\(contact.firstName) \(contact.lastName)")
                                }
                                
                                
                            }
                        }
                        .onAppear() {
                            self.requestAccess()
                            
                    }
                    }
                }
            }
            
            
        }
        
    }
    
    func getContacts() {
        DispatchQueue.main.async {
            self.contacts = FetchContacts().fetchingContacts()
        }
    }
    
    func requestAccess() {
        let store = CNContactStore()
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            self.getContacts()
        case .denied:
            store.requestAccess(for: .contacts) { granted, error in
                if granted {
                    self.getContacts()
                }
            }
        case .restricted, .notDetermined:
            store.requestAccess(for: .contacts) { granted, error in
                if granted {
                    self.getContacts()
                }
            }
        @unknown default:
            print("error")
        }
    }
}


struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView(contact: ContactInfo.init(firstName: "", lastName: ""))
    }
}

