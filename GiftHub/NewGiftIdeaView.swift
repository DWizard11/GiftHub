//
//  NewGiftIdeaView.swift
//  GiftHub
//
//  Created by TinkerTanker on 13/11/22.
//

import SwiftUI

struct NewGiftIdeaView: View {
    
    @State var friendviewgiftidea = ""
    @State var giftCost = ""
    @Binding var friendviewgiftideas: [FriendViewGiftIdea]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section {
                TextField("Gift Idea", text: $friendviewgiftidea)
                TextField("Cost of Gift", text: $giftCost)
            }
            Button("Save Gift Idea") {
                // magic!
                friendviewgiftideas.append(FriendViewGiftIdea(title: friendviewgiftidea))
                presentationMode.wrappedValue.dismiss()
            }
        }
    }

}

struct NewGiftIdeaView_Previews: PreviewProvider {
    static var previews: some View {
        NewGiftIdeaView(friendviewgiftideas: .constant([]))
    }
}
