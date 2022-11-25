//
//  NewLikingView.swift
//  GiftHub
//
//  Created by TinkerTanker on 15/11/22.
//
import SwiftUI
import Foundation

struct FriendLiking: Identifiable, Codable {
    var id = UUID()
    var title: String
}


struct NewLikingView: View {
    
    @State var friendLiking = ""
    @Binding var friendLikings: [FriendLiking]
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
                        friendLikings.append(FriendLiking(title: friendLiking))
                    }
                }
            }
            .padding()

            Button {
                friendLikings.append(FriendLiking(title: friendLiking))
                dismiss()
            } label: {
                Text("Save and Close")
            }
            .buttonStyle(.bordered)
            
        }
    }
}

