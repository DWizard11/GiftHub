//
//  FriendGiftIdeas.swift
//  GiftHub
//
//  Created by TinkerTanker on 15/11/22.
//

import Foundation

struct FriendGiftIdea: Identifiable, Codable {
    let id = UUID()
    var title: String
    var hasBeenBought = false
}
