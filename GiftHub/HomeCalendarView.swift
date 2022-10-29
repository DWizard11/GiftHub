//
//  HomeCalendarView.swift
//  GiftHub
//
//  Created by Felix Forbes Dimjati on 29/10/22.
//

import SwiftUI

struct HomeCalendarView: View {
    @State private var date = Date()
    var body: some View {
        VStack {
            HStack{
                Text("Birthday Calendar")
                    .font(.largeTitle)
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 15))
            }
            DatePicker("Enter your birthday", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 400)
        }
    }
}

struct HomeCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCalendarView()
    }
}
