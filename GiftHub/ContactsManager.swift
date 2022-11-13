//
//  ContactsManager.swift
//  GiftHub
//
//  Created by DWizard11 on 5/11/22.
//

import Foundation
import Contacts

struct ContactInfo : Identifiable{
    let id = UUID()
    var firstName: String
    var lastName: String
    var phoneNumber: CNPhoneNumber?
    var isStarred: Bool
}

class FetchContacts {
    
    func fetchingContacts() -> [ContactInfo]{
        var contacts = [ContactInfo]()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do {
            try CNContactStore().enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                contacts.append(ContactInfo(firstName: contact.givenName, lastName: contact.familyName, phoneNumber: contact.phoneNumbers.first?.value, isStarred: false))
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


