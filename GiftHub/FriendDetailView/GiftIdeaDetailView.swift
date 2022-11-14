//
//  GiftIdeaDetailView.swift
//  GiftHub
//
//  Created by TinkerTanker on 13/11/22.
//

import SwiftUI

struct GiftIdeaDetailView: View {
    @Binding var friendviewgiftidea: FriendViewGiftIdea
    
    var body: some View {
        Form {
            TextField("Gift Idea Title", text: $friendviewgiftidea.title)
                .multilineTextAlignment(.leading)
           
            Button ("Has been \(friendviewgiftidea.hasBeenBought ? "not bought" : "bought")") {
                friendviewgiftidea.hasBeenBought.toggle()
            } // label: {
//                Text("Has been \(todo.hasBeenBought ? "not bought" : "bought")")
  //                  .padding()
    //                .background(Color.yellow)
      //              .foregroundColor(.white)
        //            .cornerRadius(8)
            }
        }
}

struct GiftIdeaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GiftIdeaDetailView(friendviewgiftidea: .constant(FriendViewGiftIdea(title: "Cake")))
    }
}
