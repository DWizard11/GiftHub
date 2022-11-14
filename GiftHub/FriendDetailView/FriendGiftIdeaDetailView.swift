//
//  FriendGiftIdeaDetailView.swift
//  GiftHub
//
//  Created by TinkerTanker on 15/11/22.
//

import SwiftUI

struct FriendGiftIdeaDetailView: View {
    
    @Binding var friendgiftidea: FriendGiftIdea
    @State var friendgiftideaprice = ""
    @State var friendgiftideaselectedquantity = 1
    @State var friendgiftidealocation = ""
    @State var friendgiftideaproduct = ""
    @State var friendgiftideaselectedmeans = "Online"
    @State var friendgiftideameans = ["Online", "In-person Visit", "Via Amazon"]
    @State var friendgiftideanotes = ""
    
    var body: some View {
        Form {
            Section("About Gift") {
                TextField("Gift Idea Title", text: $friendgiftidea.title)
                TextField("Price", text: $friendgiftideaprice)
                    .font(.headline)
                Picker("Quantity", selection: $friendgiftideaselectedquantity) {
                    ForEach(1 ... 150, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            Section("Details") {
                Picker("Means of Purchase", selection: $friendgiftideaselectedmeans) {
                    ForEach(friendgiftideameans, id: \.self) { friendgiftideameans in
                        Text(friendgiftideameans)
                    }
                }
                TextField("Intended Store of Purchase", text: $friendgiftidealocation)
                        .font(.headline)
                TextField("Product URL", text: $friendgiftideaproduct)
                        .font(.headline)
            }
            Section("More") {
                TextField("Notes eg. Colour/Theme of Gift ", text: $friendgiftideanotes)
                    .font(.headline)
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)
            }
            Button("Has been \(friendgiftidea.hasBeenBought ? "not bought" : "bought")") {
                    friendgiftidea.hasBeenBought.toggle()
            }
        }
    }
}


struct FriendGiftIdeaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendGiftIdeaDetailView(friendgiftidea: .constant(FriendGiftIdea(title: "Cake")))
    }
}
