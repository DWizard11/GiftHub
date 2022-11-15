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
}

class FetchContacts {
    
    func fetchingContacts() -> [ContactInfo]{
        var contacts = [ContactInfo]()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactBirthdayKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do {
            try CNContactStore().enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                contacts.append(ContactInfo(firstName: contact.givenName, lastName: contact.familyName, birthday: contact.birthday, isStarred: false))
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
