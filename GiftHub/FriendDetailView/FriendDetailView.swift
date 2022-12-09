//
//  FriendDetailView.swift
//  GiftHub
//
//  Created by DWizard11 on 31/10/22.
//

import SwiftUI
import Contacts

enum Page: Identifiable {
    case likes, dislikes, giftIdeas
    var id: Int {
        hashValue
    }
}


struct FriendDetailView: View {
    
    let notify = NotificationHandler()
    //
    //
    @State var friendname = ""
    // @State var alertdates = ["1 day", "4 days", "1 week", "2 weeks", "1 month"]
    @State var relationships = ["Friend", "Parent", "Child", "Sibling", "Wife", "Husband", "In-laws", "Uncle", "Aunt", "Cousin", "Grandparents", "Grandchildren", "Pet", "Myself", "Classmate", "Senior", "Junior", "Colleague", "Boss", "Teacher", "Student", "Others" ]
    @State var selectedAlertDate = "1 week"
    @State var selectedRelationship = "Friend"
    @State var selectedDate = Date()
    @State var selectedAge = 1
    
    @State var isSheetPresented = false
    @State var isDislikeSheetPresented = false
  
    @State var currentPage: Page?
    @State var valueToPass = 10
    @State var currentDate = Date()
    @FocusState var notesIsFocused: Bool
    @Binding var contact: ContactInfo
    @ObservedObject var contactManager: ContactInfoManager
    
    var friend: ContactInfo {
        get {
            let contactIndex = self.contactManager.contacts.firstIndex {
                $0.id == contact.id
            }!
            
            return self.contactManager.contacts[contactIndex]
        }
        set {
            let contactIndex = self.contactManager.contacts.firstIndex {
                $0.id == contact.id
            }!
            self.contactManager.contacts[contactIndex] = newValue
        }
    }
    
    func setFriend(friend: ContactInfo) {
        let contactIndex = self.contactManager.contacts.firstIndex {
            $0.id == contact.id
        }!
        self.contactManager.contacts[contactIndex] = friend
    }
    
    var body: some View {
        
        
        Form {
            Section("About") {
                
                Text("\(contact.firstName) \(contact.lastName)")
                    .font(.headline)
                
                HStack {
                    Text("Birthday:")
                    Spacer()
                    Text(verbatim: "\(contact.birthday?.day ?? 0)/\(contact.birthday?.month ?? 0)/\(contact.birthday?.year ?? 0)")
                }
                
                HStack {
                    Text("Age:")
                    Spacer()
                    Text("\(getYear(date:currentDate) - (contact.birthday?.year ?? 0))")
                }
                
                Picker("Relationship:", selection: $selectedRelationship) {
                    ForEach(relationships, id: \.self) { relationship in
                        Text(relationship)
                    }
                }
                DatePicker("Birthday Alert 🎂:", selection: $selectedDate, in: Date()...)
                Button("Schedule alert") {
                    notify.sendNotification(date: selectedDate,
                                            type: "date",
                                            title: "Hello!",
                                            body: "It's \(contact.firstName)'s Birthday!🎉🎂")
                    notify.askPermission()
                }
                
                //            Picker("Notification", selection: $selectedAlertDate) {
                //               ForEach(alertdates, id: \.self) { alertdate in
                //                   Text(alertdate)
                //                  }
                //             }
            }
            Section("Likings") {
                List {
                    Button {
                        currentPage = .likes
                    } label: {
                        Text("Add your Friend's likes!")
                    }
                    ForEach(contact.likes, id: \.self) { like in
                        HStack {
                            Image(systemName: "circle.fill")
                            Text(like)
                        }
                    }
                    .onDelete { indexSet in
                        contact.likes.remove(atOffsets: indexSet)
                    }
                    .onMove { indices, newOffset in
                        contact.likes.move(fromOffsets: indices, toOffset: newOffset)
                    }
                    .onChange(of: friend.likes) { newItem in
                        print(newItem)
                    }
                    
                }
            }
            Section("Dislikes") {
                List {
                    Button {
                        currentPage = .dislikes
                        print(contact.dislikes)
                    } label: {
                        Text("Add your Friend's dislikes!")
                    }
                    ForEach(contact.dislikes, id: \.self) { dislike in
                        HStack {
                            Image(systemName: "circle.fill")
                            Text(dislike)
                            
                        }
                    }
                    .onDelete { indexSet in
                        contact.dislikes.remove(atOffsets: indexSet)
                    }
                    .onMove { indices, newOffset in
                        contact.dislikes.move(fromOffsets: indices, toOffset: newOffset)
                    }
                    .onChange(of: contact.dislikes) { newItem in
                        print(newItem)
                    }
                    
                }
            }
            Section("Gift Ideas") {
                List {
                    Button {
                        currentPage = .giftIdeas
                    } label: {
                        Text("Add your Friend's gift ideas!")
                    }
                    ForEach(contact.giftIdeas, id: \.self) { giftIdea in
                        NavigationLink {
                            FriendGiftIdeaDetailView(giftIdea: giftIdea, contact: $contact, contactManager: contactManager)
                        } label: {
                            HStack {
                                Image(systemName: contact.hasBeenBought ? "checkmark.circle.fill" : "circle")
                                Text(giftIdea)
                                    .strikethrough(contact.hasBeenBought)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        contact.giftIdeas.remove(atOffsets: indexSet)
                    }
                    .onMove { indices, newOffset in
                        contact.giftIdeas.move(fromOffsets: indices, toOffset: newOffset)
                    }
                }
            }
            Section("Notes") {
                VStack {
                    TextField("Add Notes", text: $contact.notes, axis: .vertical)
                        .focused($notesIsFocused)
                        .font(.headline)
                        
                    Button("Done") {
                        notesIsFocused = false
                    }
                }
                

            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $currentPage) { item in
            switch item {
            case .likes:
                NewLikingView(contactManager: contactManager, passedValue: $valueToPass, likes: $contact.likes)
            case .dislikes:
                NewDislikeView(contactManager: contactManager, passedValue: $valueToPass, dislike: $contact.dislikes)
            case .giftIdeas:
                NewGiftIdeaView(passedValue: $valueToPass, giftIdeas: $contact.giftIdeas, contactManager: contactManager)
            }
        }
    }
}
private func getYear(date: Date) -> Int {
    
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year], from:  date)
    let year = components.year
    
    return year ?? 0
    
}
