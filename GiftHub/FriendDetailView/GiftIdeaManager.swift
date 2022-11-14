//
//  GiftIdeaManager.swift
//  GiftHub
//
//  Created by TinkerTanker on 13/11/22.
//

import Foundation
import SwiftUI

class FriendViewGiftIdeaManager: ObservableObject {
    @Published var friendviewgiftideas: [FriendViewGiftIdea] = [] {
        didSet {
            save()
        }
    }
    
    let sampleFriendViewGiftIdeas: [FriendViewGiftIdea] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "friendviewgiftideas.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriendViewGiftIdeas = try? propertyListEncoder.encode(friendviewgiftideas)
        try? encodedFriendViewGiftIdeas?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalFriendViewGiftIdeas: [FriendViewGiftIdea]!
        
        if let retrievedFriendViewGiftIdeaData = try? Data(contentsOf: archiveURL),
            let decodedFriendViewGiftIdeas = try? propertyListDecoder.decode([FriendViewGiftIdea].self, from: retrievedFriendViewGiftIdeaData) {
            finalFriendViewGiftIdeas = decodedFriendViewGiftIdeas
        } else {
            finalFriendViewGiftIdeas = sampleFriendViewGiftIdeas
        }
        
        friendviewgiftideas = finalFriendViewGiftIdeas
    }
}
