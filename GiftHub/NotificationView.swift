//
//  NotificationView.swift
//  GiftHub
//
//  Created by T Krobot on 3/11/22.
//

//here is notif code but idk where to incorporate this in the app help
import SwiftUI

struct NotificationView: View{
    @State private var selectedDate = Date()
    let notify = NotificationHandler()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            DatePicker("Your Friend's Birthday:", selection: $selectedDate, in: Date()...)
            Button("Schedule alert") {
                notify.sendNotification(date: selectedDate,
                                        type: "date",
                                        title: "Hello!",
                                        body: "Your Friend's Birthday is coming!")
            }.tint(.orange)
            
            Spacer()
            Text("Not working?")
                .foregroundColor(.gray)
                .italic()
            Button("Request permissions") {
                notify.askPermission()
            }
        }
        .padding()
    }
}
struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
