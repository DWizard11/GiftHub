//
//  HomeCalendarView.swift
//  GiftHub
//
//  Created by Felix Forbes Dimjati on 29/10/22.
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
let color3 = Color(red: 255/255, green: 242/255, blue: 172/255)
let color4 = Color(red: 255/255, green: 255/255, blue: 109/255)

struct HomeCalendarView: View {
    
    @State var isSheetShown = false
    @State private var date = Date()
    
    var body: some View {
        ZStack {
            Color(color2)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                    Text("Birthday Calendar")
                        .font(.largeTitle)
                        .bold()
                }
                DatePicker("Enter your birthday", selection: $date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(maxHeight: 400)
                    .background(color3)
                Button(role: .none){
                    isSheetShown = true
                } label: {
                    Text("Add a Reminder")
                    Text(Image(systemName: "plus.circle.fill"))
                        .font(.system(size: 30))
                        .foregroundColor(.yellow)
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(color3)
                        .padding()
                    VStack{
                        Text("Upcoming Birthdays!")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(color4)
                            .padding()
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(color4)
                            .padding()
                    }
                }
            }
        }
        .sheet(isPresented: $isSheetShown){
            NotificationView(isPresented: $isSheetShown)
        }
    }
}

struct HomeCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCalendarView()
    }
}

