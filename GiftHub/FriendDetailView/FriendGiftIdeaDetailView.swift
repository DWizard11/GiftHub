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
    @State var friendGiftIdeaSelectedQuantity = 1
    @State var friendGiftIdeaLocation = "Amazon"
    @State var friendGiftIdeaProduct = "https://www.amazon.com/s?k="
    @State var friendGiftIdeaSelectedMeans = "Online"
    @State var friendGiftIdeaMeans = ["Online", "Self-Pickup", "Offline In-shop"]
    @State var friendGiftIdeaNotes = ""
    @State var linkProductAppended = false
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
                Picker("Quantity", selection: $friendGiftIdeaSelectedQuantity) {
                    ForEach(1 ... 150, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            Section("Details") {
                Picker("Means of Purchase", selection: $friendGiftIdeaSelectedMeans) {
                    ForEach(friendGiftIdeaMeans, id: \.self) { friendGiftIdeaMean in
                        Text(friendGiftIdeaMean)
                    }
                }
                TextField("Intended Store of Purchase", text: $friendGiftIdeaLocation)
                    .font(.headline)
                Link(destination: URL(string: friendGiftIdeaProduct)!) {
                    TextField("Product URL", text: $friendGiftIdeaProduct)
                }
            }
            Section("More") {
                VStack {
                    TextField("Notes eg. Colour/Theme of Gift ", text: $friendGiftIdeaNotes, axis: .vertical)
                        .font(.headline)
                        .focused($isNotesShown)
                    Button("Done") {
                        isNotesShown = false
                        friendGiftIdeaProduct.append(giftIdea)
                        print("AAAAAAAAAAAA")
                    }
                }
            }
            Button("Has been \(contact.hasBeenBought ? "not bought" : "bought")") {
                contact.hasBeenBought.toggle()
            }
        }
        .onAppear() {
            if !linkProductAppended {
                friendGiftIdeaProduct.append(giftIdea)
                linkProductAppended.toggle()
            }
        }
    }
    
}


