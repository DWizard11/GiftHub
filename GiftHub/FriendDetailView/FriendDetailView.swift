//
//  FriendDetailView.swift
//  GiftHub
//
//  Created by DWizard11 on 31/10/22.
//

import SwiftUI
import Contacts

struct FriendDetailView: View {
    
    @State var friendname = ""
    @State var alertdates = ["1 day", "4 days", "1 week", "2 weeks", "1 month"]
    @State var relationships = ["Friend", "Parent", "Child", "Sibling", "Wife", "Husband", "In-laws", "Uncle", "Aunt", "Cousin", "Grandparents", "Grandchildren", "Pet", "Myself", "Classmate", "Senior", "Junior", "Colleague", "Boss", "Teacher", "Student", "Others" ]
    @State var selectedAlertDate = "1 week"
    @State var selectedRelationship = "Friend"
    @State var selectedDate = Date()
    @State var selectedAge = 1
    @State var friendlikings = [FriendLiking(title: "Apple Products"),
                                FriendLiking(title: "Soft Toys")
    ]
    @State var isSheetPresented = false
    @State var frienddislikes = [FriendDislike(title: "Black stuff"),                                        FriendDislike(title: "Flowers")]
    @State var friendgiftideas = [FriendGiftIdea(title: "Airpods", hasBeenBought: true), FriendGiftIdea(title: "Duck"), FriendGiftIdea(title: "Bottle")
    ]
    @StateObject var friendlikingManager = FriendLikingManager()
    @StateObject var frienddislikeManager = FriendDislikeManager()
    @StateObject var friendgiftideaManager = FriendGiftIdeaManager()
    var contact: ContactInfo
    
    var body: some View {
        Form {
            Section("About") {
                //          TextField("Friend Name", text: $friendname)
                //              .font(.headline)
                Text("\(contact.firstName) \(contact.lastName)")
                    .font(.headline)
                
                //         HStack {
                //           Text("Birthday")
                //           DatePicker("", selection: $selectedDate, displayedComponents: .date)
                //       }
                HStack {
                    Text("Birthday")
                    Spacer()
                    Text(verbatim: "\(contact.birthday?.day ?? 0)/\(contact.birthday?.month ?? 0)/\(contact.birthday?.year ?? 0)")
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
                
                Picker("Notification", selection: $selectedAlertDate) {
                    ForEach(alertdates, id: \.self) { alertdate in
                        Text(alertdate)
                    }
                }
            }
            Section("Likings") {
                List {
                    ForEach($friendlikingManager.friendlikings) { $friendliking in
                        HStack {
                            Image(systemName: "circle.fill")
                            Text(friendliking.title)
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
        //           .navigationBarTitle("\(friendname)")
        .toolbar{
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
        // end of tool bar
        .sheet(isPresented: $isSheetPresented) {
            NewLikingView(friendlikings: $friendlikingManager.friendlikings, frienddislikes: $frienddislikeManager.frienddislikes, friendgiftideas: $friendgiftideaManager.friendgiftideas)
        }
        
    }
}




struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(contact: .init(firstName: "", lastName: "", isStarred: true, identifier: "")
        )
    }
}


