////
////  CalenderView.swift
////  GiftHub
////
////  Created by T Krobot on 13/11/22.
////
//
//import SwiftUI
//
//
//struct CalenderView: View {
//    private let calender: CalenderView
//    private let monthDayFormatter: DateFormatter
//    private let dayFormatter: DateFormatter
//    private let weekDayFormatter: DateFormatter
//    
//    @State private var selectedDate = Self.now
//    private static var now = Date()
//    
//    init(calender: Calender) {
//        self.calender = calender
//        self.monthDayFormatter = DateFormatter(dateFormat: "MM/dd", calender: calender)
//        self.dayFormatter = DateFormatter(dateFormat: "d", calender: calender)
//        self.weekDayFormatter = DateFormatter(dateFormat: "EEEEE", calender: calender)
//    }
//    
//    var body: some View {
//        VStack {
//            CalenderWeekListView(
//                calender: calender,
//                date: $selectedDate,
//                content:{ date in
//                    Button(action: { selectedDate = date}) {
//                        Text("00")
//                    }
//                } header: { date in
//                    Text("00")
//                } title: { date in
//                    HStack {
//                        Text(monthDayFormatter.string(from: selectedDate))
//                        Spacer()
//                    }
//                } weekSwitcher: { date in
//                    Button {
//                        
//                    } label: {
//                        Label(title: { Text("Previous") }, icon: { Image(systemName: "chevron.left") }
//                        )
//                    }
//                })
//        }
//    }
//    
//    struct CalenderView_Previews: PreviewProvider {
//        static var previews: some View {
//            CalenderView(calender: Calender(identifier: .gregorian))
//        }
//    }
//    
//    struct CalenderWeekListView<Day: View, Header: View, Title: View, WeekSwitcher: View>: View {
//        private var calender: Calender
//        @Binding private var date: Date
//        private let content: (Date) -> Day
//        private let header: (Date) -> Header
//        private let title: (Date) -> Title
//        private let weekSwitcher: (Date) -> WeekSwitcher
//        
//        private let daysInWeek = 7
//        
//        init(
//            calender: Calender
//            date: Binding<Date>
//            @ViewBuilder content: @escaping (Date) -> Day,
//            @ViewBuilder header: @escaping (Date) -> Header,
//            @ViewBuilder title: @escaping (Date) -> Title,
//            @ViewBuilder weekSwitcher: @escaping (Date) -> WeekSwitcher
//        ) {
//            self.calender = calender
//            self._date = date
//            self.content = content
//            self.header = header
//            self.title = title
//            self.weekSwitcher = weekSwitcher
//        }
//        
//        var body: some View {
//            Text("")
//        }
//    }
//    
//    private extension DateFormatter {
//        convenience init(dateFormat: String, calender: Calender) {
//            self.init()
//            self.dateFormat = dateFormat
//            self.calender = calender
//            self.locale = Locale(identifier: "js_JP")
//        }
//    }
//}
//
