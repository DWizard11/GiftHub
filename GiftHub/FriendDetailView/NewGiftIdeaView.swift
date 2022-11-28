//
//  NewGiftIdeaView.swift
//  GiftHub
//
//  Created by DWizard11 on 25/11/22.
//

import SwiftUI



struct NewGiftIdeaView: View {
    
    @Binding var passedValue: Int
    @State var friendGiftIdea = ""
    @Binding var giftIdeas: [String]
    @ObservedObject var contactManager: ContactInfoManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Form {
                Section("Add Gift Idea") {
                    TextField("Add Gift Idea", text: $friendGiftIdea)
                        .font(.headline)
                    Button("Save Gift Idea") {
                        giftIdeas.append(friendGiftIdea)
//                        print(likes)
                    }
                }
            }
            .padding()
            Button {
                dismiss()
            } label: {
                Text("Close")
            }
            .buttonStyle(.bordered)
                
            
        }
    }
}


