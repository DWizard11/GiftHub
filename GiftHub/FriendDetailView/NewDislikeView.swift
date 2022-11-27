//
//  NewDislikeView.swift
//  GiftHub
//
//  Created by DWizard11 on 25/11/22.
//

import SwiftUI




struct NewDislikeView: View {
    
    @State var friendDislike = ""
    @Binding var passedValue: Int
    @Binding var friendDislikes: [FriendDislike]
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        ZStack {
            Form {
                Section("Add Dislike") {
                    TextField("Add Dislike", text: $friendDislike)
                        .font(.headline)
                }
            }
            .padding()
            Button {
                friendDislikes.append(FriendDislike(title: friendDislike))
                dismiss()
            } label: {
                Text("Save and Close")
            }
            .buttonStyle(.bordered)
                
            
        }
    }
}

