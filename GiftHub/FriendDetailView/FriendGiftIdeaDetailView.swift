//
//  FriendGiftIdeaDetailView.swift
//  GiftHub
//
//  Created by TinkerTanker on 15/11/22.
//

import SwiftUI

struct FriendGiftIdeaDetailView: View {
    
    @State var giftIdea: String
    @Binding var contact: ContactInfo
    @ObservedObject var contactManager: ContactInfoManager
    @State var friendGiftIdeaPrice = ""
    @State var friendgiftideaselectedquantity = 1
    @State var friendgiftidealocation = ""
    @State var friendgiftideaproduct = ""
    @State var friendgiftideaselectedmeans = "Online"
    @State var friendgiftideameans = ["Online", "Self-Pickup", "Offline In-shop"]
    @State var friendgiftideanotes = ""
    @FocusState private var isNotesShown: Bool
    var friend: ContactInfo {
        get {
            let contactIndex = self.contactManager.contacts.firstIndex {
                $0.id == contact.id
            }!
            
            return self.contactManager.contacts[contactIndex]
        }
        set {
            let contactIndex = self.contactManager.contacts.firstIndex {
                $0.id == contact.id
            }!
            self.contactManager.contacts[contactIndex] = newValue
        }
    }
    
    var body: some View {
        Form {
            Section("About Gift") {
                TextField("Gift Idea Title", text: $giftIdea)
                TextField("Price", text: $friendGiftIdeaPrice)
                    .font(.headline)
                Picker("Quantity", selection: $friendgiftideaselectedquantity) {
                    ForEach(1 ... 150, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            Section("Details") {
                Picker("Means of Purchase", selection: $friendgiftideaselectedmeans) {
                    ForEach(friendgiftideameans, id: \.self) { friendgiftideameans in
                        Text(friendgiftideameans)
                    }
                }
                TextField("Intended Store of Purchase", text: $friendgiftidealocation)
                        .font(.headline)
                TextField("Product URL", text: $friendgiftideaproduct)
                        .font(.headline)
            }
            Section("More") {
                VStack {
                    TextField("Notes eg. Colour/Theme of Gift ", text: $friendgiftideanotes, axis: .vertical)
                        .font(.headline)
                        .focused($isNotesShown)
                    Button("Done") {
                        isNotesShown = false
                    }
                }
            }
            Button("Has been \(contact.hasBeenBought ? "not bought" : "bought")") {
                    contact.hasBeenBought.toggle()
            }
        }
    }
}


