//
//  MainGiftIdeaView.swift
//  GiftHub
//
//  Created by TinkerTanker on 13/11/22.
//

import SwiftUI

struct MainGiftIdeaView: View {
    
    @State var friendviewgiftideas = [FriendViewGiftIdea(title: "Airpods", hasBeenBought: true),
                        FriendViewGiftIdea(title: "Food"),
                        FriendViewGiftIdea(title: "Duck")]
    @State var isSheetPresented = false
    @StateObject var friendviewgiftideaManager = FriendViewGiftIdeaManager()
    
    var body: some View {
        NavigationView {
            List {
                ForEach($friendviewgiftideas) { $friendviewgiftidea in
                    NavigationLink {
                        GiftIdeaDetailView(friendviewgiftidea: $friendviewgiftidea)
                    } label: {
                        HStack{
                            Image(systemName: friendviewgiftidea.hasBeenBought ? "checkmark.circle.fill" : "circle")
                            Text(friendviewgiftidea.title)
                                .strikethrough(friendviewgiftidea.hasBeenBought)
                                .padding(.leading)
                        }
                    }
                }
                .onDelete { indexSet in
                    friendviewgiftideas.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    friendviewgiftideas.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .navigationTitle("Gift Ideas")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            NewGiftIdeaView(friendviewgiftideas: $friendviewgiftideas)
        }
    }
}

struct MainGiftIdeaView_Previews: PreviewProvider {
    static var previews: some View {
        MainGiftIdeaView()
    }
}
