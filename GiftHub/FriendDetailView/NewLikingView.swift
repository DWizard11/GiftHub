//
//  NewLikingView.swift
//  GiftHub
//
//  Created by TinkerTanker on 15/11/22.
//
import SwiftUI

struct NewLikingView: View {
    
    @State var friendliking = ""
    @State var frienddislike = ""
    @State var friendgiftidea = ""
    @Binding var friendlikings: [FriendLiking]
    @Binding var frienddislikes: [FriendDislike]
    @Binding var friendgiftideas: [FriendGiftIdea]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section("Add Liking") {
                TextField("Add Liking", text: $friendliking)
                    .font(.headline)
                Button("Save Liking") {
                    friendlikings.append(FriendLiking(title: friendliking))
                }
            }
            Section("Add Dislike") {
                TextField("Add Dislike", text: $frienddislike)
                    .font(.headline)
                Button("Save Dislike") {
                    frienddislikes.append(FriendDislike(title: frienddislike))
                }
            }
            Section("Add Gift Idea") {
                TextField("Add Gift Idea", text: $friendgiftidea)
                    .font(.headline)
                Button("Save Gift Idea") {
                    friendgiftideas.append(FriendGiftIdea(title: friendgiftidea))
                }
            }
        }
    }
}

struct NewLikingView_Previews: PreviewProvider {
    static var previews: some View {
        NewLikingView(friendlikings: .constant([]), frienddislikes: .constant([]), friendgiftideas: .constant([]))
    }
}
