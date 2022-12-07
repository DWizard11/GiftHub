//
//  FriendListView.swift
//  GiftHub
//
//  Created by DWizard11 on 27/10/22.
//

import SwiftUI
import Contacts



struct FriendListView: View {
    
    @ObservedObject var contactsManager: ContactInfoManager
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var showContacts = true
    
    
    var body: some View {
        NavigationView {
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
                .scrollDismissesKeyboard(.interactively)
                
                
                Form {
                    Section("Starred") {
                        ForEach ($contactsManager.contacts) { $contact in
                            if searchText.isEmpty ? true : "\(contact)".lowercased().contains(self.searchText.lowercased()) {
                                if contact.isStarred {
                                    NavigationLink {
                                        FriendDetailView(contact: $contact, contactManager: contactsManager)
                                    } label: {
                                        Image(systemName: "star.fill")
                                            .onTapGesture {
                                                let contactIndex = self.contactsManager.contacts.firstIndex {
                                                    $0.id == contact.id
                                                }!
                                                withAnimation {
                                                    contactsManager.contacts[contactIndex].isStarred.toggle()
                                                }
                                            }
                                        Text("\(contact.firstName) \(contact.lastName)")
                                        
                                    }
                                }
                            }
                        }
                    }
                    
                    Section("Others") {
                        ForEach ($contactsManager.contacts) { $contact in
                            if self.searchText.isEmpty ? true : "\(contact)".lowercased().contains(self.searchText.lowercased()) && !contact.isStarred {
                                if !contact.isStarred{
                                    NavigationLink {
                                        FriendDetailView(contact: $contact, contactManager: contactsManager)
                                    } label: {
                                        Image(systemName: "star")
                                            .onTapGesture {
                                                let contactIndex = self.contactsManager.contacts.firstIndex {
                                                    $0.id == contact.id
                                                }!
                                                withAnimation {
                                                    contactsManager.contacts[contactIndex].isStarred.toggle()
                                                }
                                            }
                                        Text("\(contact.firstName) \(contact.lastName)")
                                    }
                                }
                            }
                        }
                    }
                    .onAppear {
                        Task{
                            await self.requestAccess()
                        }
                    }
                }
            }
            .navigationTitle("Contacts")
        }
    }
    func getContacts() async {
        Task {
            await FetchContacts().fetchingContacts(contactInfoManager: contactsManager, currentContacts: contactsManager.contacts)
            print("Test")
        }
    }
    
    func requestAccess() async {
        print("Test 2")
        let store = CNContactStore()
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            await self.getContacts()
        case .denied:
            do {
                let granted = try await store.requestAccess(for: .contacts)
                if granted {
                    await self.getContacts()
                }
            } catch let error {
                print("Failed", error)
            }
        case .restricted, .notDetermined:
            do {
                let granted = try await store.requestAccess(for: .contacts)
                if granted {
                    await self.getContacts()
                }
            } catch let error {
                print("Failed", error)
            }
        @unknown default:
            print("error")
        }
    }
}


struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView(contactsManager: ContactInfoManager())
    }
}

