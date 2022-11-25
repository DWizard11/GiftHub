//
//  FriendDetailManager.swift
//  GiftHub
//
//  Created by TinkerTanker on 15/11/22.
//
import Foundation
import SwiftUI

struct FriendLiking: Identifiable, Codable {
    var id = UUID()
    var title: String
}


class FriendLikingManager: ObservableObject {
    @Published var friendlikings: [FriendLiking] = [] {
        didSet {
            save()
        }
    }
    
    let sampleFriendLikings: [FriendLiking] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "friendlikings.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriendLikings = try? propertyListEncoder.encode(friendlikings)
        try? encodedFriendLikings?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalFriendLikings: [FriendLiking]!
        
        if let retrievedFriendLikingData = try? Data(contentsOf: archiveURL),
            let decodedFriendLikings = try? propertyListDecoder.decode([FriendLiking].self, from: retrievedFriendLikingData) {
            finalFriendLikings = decodedFriendLikings
        } else {
            finalFriendLikings = sampleFriendLikings
        }
        
        friendlikings = finalFriendLikings
    }
}


struct FriendDislike: Identifiable, Codable {
    var id = UUID()
    var title: String
}



class FriendDislikeManager: ObservableObject {
    @Published var frienddislikes: [FriendDislike] = [] {
        didSet {
            save()
        }
    }
    
    let sampleFriendDislikes: [FriendDislike] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "frienddislikes.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriendDislikes = try? propertyListEncoder.encode(frienddislikes)
        try? encodedFriendDislikes?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalFriendDislikes: [FriendDislike]!
        
        if let retrievedFriendDislikeData = try? Data(contentsOf: archiveURL),
            let decodedFriendDislikes = try? propertyListDecoder.decode([FriendDislike].self, from: retrievedFriendDislikeData) {
            finalFriendDislikes = decodedFriendDislikes
        } else {
            finalFriendDislikes = sampleFriendDislikes
        }
        
        frienddislikes = finalFriendDislikes
    }
}


struct FriendGiftIdea: Identifiable, Codable {
    var id = UUID()
    var title: String
    var hasBeenBought = false
}

class FriendGiftIdeaManager: ObservableObject {
    @Published var friendgiftideas: [FriendGiftIdea] = [] {
        didSet {
            save()
        }
    }
    
    let sampleFriendGiftIdeas: [FriendGiftIdea] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "giftideas.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriendGiftIdeas = try? propertyListEncoder.encode(friendgiftideas)
        try? encodedFriendGiftIdeas?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalFriendGiftIdeas: [FriendGiftIdea]!
        
        if let retrievedFriendGiftIdeaData = try? Data(contentsOf: archiveURL),
            let decodedFriendGiftIdeas = try? propertyListDecoder.decode([FriendGiftIdea].self, from: retrievedFriendGiftIdeaData) {
            finalFriendGiftIdeas = decodedFriendGiftIdeas
        } else {
            finalFriendGiftIdeas = sampleFriendGiftIdeas
        }
        
        friendgiftideas = finalFriendGiftIdeas
    }
}
