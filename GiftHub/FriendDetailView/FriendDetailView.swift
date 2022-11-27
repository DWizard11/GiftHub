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
    @State var friendlikings = [FriendLiking(title: "Apple Products"),
                                FriendLiking(title: "Soft Toys")
    ]
    @State var isSheetPresented = false
    @State var isDislikeSheetPresented = false
    @State var frienddislikes = [FriendDislike(title: "Black stuff"),                                        FriendDislike(title: "Flowers")]
    @State var friendgiftideas = [FriendGiftIdea(title: "Airpods", hasBeenBought: true), FriendGiftIdea(title: "Duck"), FriendGiftIdea(title: "Bottle")
    ]
    @StateObject var friendlikingManager = FriendLikingManager()
    @StateObject var frienddislikeManager = FriendDislikeManager()
    @StateObject var friendgiftideaManager = FriendGiftIdeaManager()
    @State var currentPage: Page?
    @State var valueToPass = 10
    var contact: ContactInfo
    @ObservedObject var contactManager: ContactInfoManager
    
    var body: some View {
        
        let contactIndex = self.contactManager.contacts.firstIndex {
            $0.id == contact.id
        }!
        
        var friend = self.contactManager.contacts[contactIndex]
        
        NavigationView {
            Form {
                Section("About") {
                    
                    Text("\(friend.firstName) \(friend.lastName)")
                        .font(.headline)
                    
                    HStack {
                        Text("Birthday")
                        Spacer()
                        Text(verbatim: "\(friend.birthday?.day ?? 0)/\(friend.birthday?.month ?? 0)/\(friend.birthday?.year ?? 0)")
                    }
                    
                    Picker("Age", selection: $selectedAge) {
                        ForEach(1 ... 99, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    Picker("Relationship", selection: $selectedRelationship) {
                        ForEach(relationships, id: \.self) { relationship in
                            Text(relationship)
                        }
                    }
                        DatePicker("Birthday Alert 🎂:", selection: $selectedDate, in: Date()...)
                        Button("Schedule alert") {
                            notify.sendNotification(date: selectedDate,
                                                    type: "date",
                                                    title: "Hello!",
                                                    body: "It's \(friend.firstName)'s Birthday!🎉🎂")
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
                            print(friend.likes)
                        } label: {
                            Text("Add your Friend's likes!")
                            
                        }
                        
                        // contact.likes = [id: ["", ""]]
                        ForEach(friend.likes[friend.identifier] ?? [], id: \.self) { like in
                            HStack {
                                Image(systemName: "circle.fill")
                                Text(like)
                            }
                        }
                        .onDelete { indexSet in
                            friendlikingManager.friendlikings.remove(atOffsets: indexSet)
                        }
                        .onMove { indices, newOffset in
                            friendlikingManager.friendlikings.move(fromOffsets: indices, toOffset: newOffset)
                        }
                        
                    }
                }
                Section("Dislikes") {
                    List {
                        Button {
                            currentPage = .dislikes
                            print(frienddislikeManager.frienddislikes)
                        } label: {
                            Text("Add your Friend's dislikes!")
                        }
                        ForEach($frienddislikeManager.frienddislikes) { $frienddislike in
                            HStack {
                                Image(systemName: "circle.fill")
                                Text(frienddislike.title)
                                
                            }
                        }
                        .onDelete { indexSet in
                            frienddislikeManager.frienddislikes.remove(atOffsets: indexSet)
                        }
                        .onMove { indices, newOffset in
                            frienddislikeManager.frienddislikes.move(fromOffsets: indices, toOffset: newOffset)
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
                        ForEach($friendgiftideaManager.friendgiftideas) { $friendgiftidea in
                            NavigationLink {
                                FriendGiftIdeaDetailView(friendgiftidea: $friendgiftidea)
                            } label: {
                                HStack {
                                    Image(systemName: friendgiftidea.hasBeenBought ? "checkmark.circle.fill" : "circle")
                                    Text(friendgiftidea.title)
                                        .strikethrough(friendgiftidea.hasBeenBought)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            friendgiftideaManager.friendgiftideas.remove(atOffsets: indexSet)
                        }
                        .onMove { indices, newOffset in
                            friendgiftideaManager.friendgiftideas.move(fromOffsets: indices, toOffset: newOffset)
                        }
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(item: $currentPage) { item in
                switch item {
                case .likes:
                    NewLikingView(contact: friend, contactManager: ContactInfoManager(), passedValue: $valueToPass)
                case .dislikes:
                    NewDislikeView(passedValue: $valueToPass, friendDislikes: $frienddislikeManager.frienddislikes)
                case .giftIdeas:
                    NewGiftIdeaView(friendgiftideas: $friendgiftideaManager.friendgiftideas, passedValue: $valueToPass)
                }
            }
        }
        
    }
}




struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(contact: .init(firstName: "", lastName: "", isStarred: true, identifier: "", likes: ["": [""]]), contactManager: ContactInfoManager())
        
    }
}


