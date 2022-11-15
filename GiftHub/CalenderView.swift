//
//  CalendarView.swift
//  GiftHub
//
//  Created by Felix Forbes Dimjati on 14/11/22.
//

import SwiftUI


struct CalendarView: View {
    private let calendar: Calendar
    private let monthDayFormatter: DateFormatter
    private let dayFormatter: DateFormatter
    private let weekDayFormatter: DateFormatter
    @State private var selectedDate = Self.now
    private static var now = Date()
    
    init(calendar: Calendar) {
            self.calendar = calendar
            self.monthDayFormatter = DateFormatter(dateFormat: "MM/dd", calendar: calendar)
            self.dayFormatter = DateFormatter(dateFormat: "d", calendar: calendar)
            self.weekDayFormatter = DateFormatter(dateFormat: "EEE", calendar: calendar)
        }
    
    var body: some View {
        VStack {
            CalendarWeekListView(
                calendar: calendar,
                date: $selectedDate,
                content: { date in
                    Button(action: { selectedDate = date }) {
                        Text("00")
                    }
                },  header: { date in
                    Text("00")
                }, title: { date in
                    HStack {
                        Text(monthDayFormatter.string(from: selectedDate))
                        Spacer()
                    }
                }, weekSwitcher: { date in
                    Button {
                        
                    } label: {
                        Label(title: { Text("Previous") }, icon: { Image(systemName: "chevron.left") }
                        )
                    }
                })
        }
    }
    
    
    struct CalendarWeekListView<Day: View, Header: View, Title: View, WeekSwitcher: View>: View {
        private var calendar: Calendar
        @Binding private var date: Date
        private let content: (Date) -> Day
        private let header: (Date) -> Header
        private let title: (Date) -> Title
        private let weekSwitcher: (Date) -> WeekSwitcher
        
        private let daysInWeek = 7
        
        init(
            calendar: Calendar,
            date: Binding<Date>,
            @ViewBuilder content: @escaping (Date) -> Day,
            @ViewBuilder header: @escaping (Date) -> Header,
            @ViewBuilder title: @escaping (Date) -> Title,
            @ViewBuilder weekSwitcher: @escaping (Date) -> WeekSwitcher
        ) {
            self.calendar = calendar
            self._date = date
            self.content = content
            self.header = header
            self.title = title
            self.weekSwitcher = weekSwitcher
        }
        
        var body: some View {
            Text("")
        }
    }
}
private extension DateFormatter {
    convenience init(dateFormat: String, calendar: Calendar) {
        self.init()
        self.dateFormat = dateFormat
        self.calendar = calendar
    }
}
