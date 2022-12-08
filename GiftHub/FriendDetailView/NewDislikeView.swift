//
//  NewDislikeView.swift
//  GiftHub
//
//  Created by DWizard11 on 25/11/22.
//

import SwiftUI




struct NewDislikeView: View {
    
    @State var friendDislike = ""
    @ObservedObject var contactManager: ContactInfoManager
    @Binding var passedValue: Int
    @Binding var dislike: [String]
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ZStack {
            Form {
                Section("Add Dislikes") {
                    TextField("Add Dislikes", text: $friendDislike)
                        .font(.headline)
                    Button("Save Dislike") {
                        dislike.append(friendDislike)
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
