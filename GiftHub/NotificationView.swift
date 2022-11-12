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
    @Binding var isPresented: Bool
    let notify = NotificationHandler()
    
    var body: some View {
        ZStack{
            Color.yellow
                .opacity(0.4)
            VStack(spacing: 20) {
                DatePicker("Your Friend's Birthday:", selection: $selectedDate, in: Date()...)
                Button("Schedule alert") {
                    notify.sendNotification(date: selectedDate,
                                            type: "date",
                                            title: "Hello!",
                                            body: "Your Friend's Birthday is coming!")
                    notify.askPermission()
                    isPresented = false
                }
                .tint(.black)
                .padding(25)
                .background(.white)
                .cornerRadius(40)
            }
            .padding()
        }
    }
}
struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(isPresented: .constant(true))
    }
}
