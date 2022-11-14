//
//  DetailsGiftIdeas.swift
//  GiftHub
//
//  Created by TinkerTanker on 13/11/22.
//

import Foundation


struct FriendViewGiftIdea: Identifiable, Codable {
    var id = UUID()
    var title: String
    var hasBeenBought: Bool = false
}
