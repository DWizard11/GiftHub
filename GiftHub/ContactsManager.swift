//
//  ContactsManager.swift
//  GiftHub
//
//  Created by DWizard11 on 5/11/22.
//

import Foundation
import Contacts

struct ContactInfo : Identifiable, Codable{
    var id = UUID()
    var firstName: String
    var lastName: String
    var birthday: DateComponents?
    var isStarred: Bool
    var identifier: String
    var likes: [String]
    var dislikes: [String]
    var giftIdeas: [String]
    var hasBeenBought: Bool 
}

class FetchContacts {
    
    func fetchingContacts(currentContacts: [ContactInfo]) -> [ContactInfo]{
        var contacts = currentContacts
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactBirthdayKey, CNContactIdentifierKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do {
            try CNContactStore().enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
               var isNew = true
                for person in currentContacts {
                    if contact.identifier == person.identifier {
                        isNew = false
                        
                    }
                }
                
                if isNew && contact.birthday != nil {
                    contacts.append(ContactInfo(firstName: contact.givenName, lastName: contact.familyName, birthday: contact.birthday, isStarred: false, identifier: contact.identifier, likes: [], dislikes: [], giftIdeas: [], hasBeenBought: false))
                    
                    
                }
                
               
                
            })
        } catch let error {
            print("Failed", error)
        }
        contacts = contacts.sorted {
            $0.firstName < $1.firstName
        }
        return contacts
    }
}

class ContactInfoManager: ObservableObject {
    @Published var contacts: [ContactInfo] = [] {
        didSet {
            save()
        }
    }
    
    let sampleContactInfos: [ContactInfo] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "contacts.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedContactInfos = try? propertyListEncoder.encode(contacts)
        try? encodedContactInfos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalContactInfos: [ContactInfo]!
        
        if let retrievedContactInfoData = try? Data(contentsOf: archiveURL),
            let decodedContactInfos = try? propertyListDecoder.decode([ContactInfo].self, from: retrievedContactInfoData) {
            finalContactInfos = decodedContactInfos
        } else {
            finalContactInfos = sampleContactInfos
        }
        
        contacts = finalContactInfos
    }
}
