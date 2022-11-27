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
    @State var items: [String]
    @Binding var passedValue: Int
    @Environment(\.dismiss) var dismiss
    //@Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Form {
                Section("Add Liking") {
                    TextField("Add Liking", text: $friendLiking)
                        .font(.headline)
                    Button("Save Liking") {
                        items.append(friendLiking)
                        print(contact.likes)
                    }
                }
            }
            .padding()

            Button {
                //friendLikings.append(FriendLiking(title: friendLiking))
                contact.likes[contact.identifier] = items
                print(contact.likes)
                dismiss()
            } label: {
                Text("Save and Close")
            }
            .buttonStyle(.bordered)
            
        }
    }
}

