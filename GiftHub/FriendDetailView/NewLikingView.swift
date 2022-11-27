//
//  NewLikingView.swift
//  GiftHub
//
//  Created by TinkerTanker on 15/11/22.
//
import SwiftUI
import Foundation


struct NewLikingView: View {
    
    @State var friendLiking = ""
    @State var contact: ContactInfo
    @ObservedObject var contactManager: ContactInfoManager
    @Binding var passedValue: Int
    @Environment(\.dismiss) var dismiss
    //@Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        let contactIndex = self.contactManager.contacts.firstIndex {
            $0.id == contact.id
        }!
        
        var friend = self.contactManager.contacts[contactIndex]
        
        ZStack {
            Form {
                Section("Add Liking") {
                    TextField("Add Liking", text: $friendLiking)
                        .font(.headline)
                    Button("Save Liking") {
                        friend.likes[friend.identifier]?.append(friendLiking)
                        print(friend.likes)
                    }
                }
            }
            .padding()

            Button {
                friend.likes[friend.identifier]?.append(friendLiking)
                print(contact.likes)
                dismiss()
            } label: {
                Text("Save and Close")
            }
            .buttonStyle(.bordered)
            
        }
    }
}

