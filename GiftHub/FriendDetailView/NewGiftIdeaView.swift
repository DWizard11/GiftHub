//
//  NewGiftIdeaView.swift
//  GiftHub
//
//  Created by DWizard11 on 25/11/22.
//

import SwiftUI



struct NewGiftIdeaView: View {
    
    @Binding var friendgiftideas: [FriendGiftIdea]
    @Binding var passedValue: Int
    @State var friendgiftidea = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Form {
                Section("Add Gift Idea") {
                    TextField("Add Gift Idea", text: $friendgiftidea)
                        .font(.headline)
                }
            }
            .padding()
            Button {
                friendgiftideas.append(FriendGiftIdea(title: friendgiftidea))
                dismiss()
            } label: {
                Text("Save and Close")
            }
            .buttonStyle(.bordered)
                
            
        }
    }
}


