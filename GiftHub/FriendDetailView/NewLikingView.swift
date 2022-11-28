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
    @ObservedObject var contactManager: ContactInfoManager
    @Binding var passedValue: Int
    @Binding var likes: [String]
    @Environment(\.dismiss) var dismiss
    //@Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Form {
                Section("Add Liking") {
                    TextField("Add Liking", text: $friendLiking)
                        .font(.headline)
                    Button("Save Liking") {
                        likes.append(friendLiking)
//                        print(likes)
                    }
                }
            }
            .padding()

            Button {
//                print(likes)
                dismiss()
            } label: {
                Text("Close")
            }
            .buttonStyle(.bordered)
            
        }
    }
}

