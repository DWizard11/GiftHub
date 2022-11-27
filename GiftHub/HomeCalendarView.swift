//
//  HomeCalendarView.swift
//  GiftHub
//
//  Created by DWizard11 on 5/11/22.
//

import SwiftUI

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
let color2 = UIColor(red: 255, green: 248, blue: 211)
let color3 = Color(red: 255/255, green: 240/255, blue: 172/255)
let color4 = Color(red: 255/255, green: 255/255, blue: 109/255)



struct HomeCalendarView: View {
    
    @State var isSheetShown = false
    @State var selectedDate = Date();
    @State private var date = Date()
    @State private var calendar = Calendar.current
//    @StateObject var weekStore = WeekStore()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @ObservedObject var contactsManager: ContactInfoManager
    
    
    var body: some View {
        let currentMonth = calendar.component(.month, from: date)
        NavigationView {
            ZStack {
            //    Color(color2)
           //         .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("GiftDuck 🦆!")
                        .frame(width: 360, height: 50, alignment: .topLeading)

                    DatePicker("Enter your birthday", selection: $selectedDate)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .frame(maxHeight: 400)
                            .background(.white)
                            .padding()
                    Text("In the month of\(formatMonth(date:selectedDate))")
   
                    VStack{
                        Text("")
                        Text("Upcoming Birthdays!")
                            .font(.title)
                            .bold()
                            .frame(width: 360, height: 50, alignment: .leading)
                            .padding()

                    }
                    
                    ScrollView(showsIndicators: false) {
                        ForEach(self.contactsManager.contacts) { contact in
                            if contact.birthday?.month == currentMonth {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(color3)
                                        .frame(width: 350, height: 75)
                                    HStack{
                                        Circle()
                                            .fill(.white)
                                            .frame(width: 100, height: 50)
                                        
                                        VStack {
                                            Text("\(contact.firstName) \(contact.lastName)")
                                            Text(verbatim: "\(contact.birthday?.day ?? 0)/\(contact.birthday?.month ?? 0)/\(contact.birthday?.year ?? 0)")
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("Welcome to")
                .font(.largeTitle)
                .bold()
        }
    }
}
struct HomeCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCalendarView(contactsManager: ContactInfoManager())
    }
}

private func getMonth(date: Date) -> String {
    
    let calendar = Calendar.current
    let components = calendar.dateComponents([.month], from:  date)
    let month = components.month
    
    return "\(month!)"
    
}
