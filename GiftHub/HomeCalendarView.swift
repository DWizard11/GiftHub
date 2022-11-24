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
    @State private var date = Date()
    @StateObject var weekStore = WeekStore()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    var body: some View {
        ZStack {
            Color(color2)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                    Text("Birthday")
                        .font(.largeTitle)
                        .bold()
                    Button(role: .none){
                        isSheetShown = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.yellow)
                    }
                    
                    
                }
                
                VStack{
                    Text("")
                    Text("Upcoming Birthdays!")
                        .font(.largeTitle)
                        .bold()
                    ZStack {
                        ForEach(weekStore.allWeeks) { week in
                            VStack{
                                HStack {
                                    ForEach(0..<7) { index in
                                        VStack(spacing: 20) {
                                            Text(weekStore.dateToString(date: week.date[index], format: "EEE"))
                                                .font(.system(size:14))
                                                .fontWeight(.semibold)
                                                .frame(maxWidth:.infinity)
                                            
                                            Text(weekStore.dateToString(date: week.date[index], format: "d"))
                                                .font(.system(size:14))
                                                .frame(maxWidth:.infinity)
                                        }
                                        .onTapGesture {
                                            // Updating Current Day
                                            weekStore.currentDate = week.date[index]
                                        }
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.width)
                                .background(
                                    Rectangle()
                                        .fill(color3)
                                       
                                )
                            }
                            .offset(x: myXOffset(week.id), y: 0)
                            .zIndex(1.0 - abs(distance(week.id)) * 0.1)
                            .padding(.horizontal, 20)
                        }
                    }
                    .padding()
                    .padding()
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                draggingItem = snappedItem + value.translation.width / 400
                            }
                            .onEnded { value in
                                withAnimation {
                                    if value.predictedEndTranslation.width > 0 {
                                        draggingItem = snappedItem + 1
                                    } else {
                                        draggingItem = snappedItem - 1
                                    }
                                    snappedItem = draggingItem
                                    
                                    weekStore.update(index: Int(snappedItem))
                                }
                            }
                    )
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(color3)
                        .frame(width: 350, height: 75)
                    HStack{
                        Circle()
                            .fill(.white)
                            .frame(width: 100, height: 50)
                        
                        VStack {
                            Text("Placehold")
                            Text("3 Nov 2022")
                        }
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(color3)
                        .frame(width: 350, height: 75)
                    HStack{
                        Circle()
                            .fill(.white)
                            .frame(width: 100, height: 50)
                        
                        VStack {
                            Text("Placehold")
                            Text("3 Nov 2022")
                        }
                    }
                }
                Text("Next Week                                   ")
                    .font(.title)
                    .bold()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(color3)
                        .frame(width: 350, height: 75)
                    HStack{
                        Circle()
                            .fill(.white)
                            .frame(width: 100, height: 50)
                        
                        VStack {
                            Text("Placehold")
                            Text("3 Nov 2022")
                        }
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(color3)
                        .frame(width: 350, height: 75)
                    HStack{
                        Circle()
                            .fill(.white)
                            .frame(width: 100, height: 50)
                        
                        VStack {
                            Text("Placehold")
                            Text("3 Nov 2022")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isSheetShown){
            NotificationView(isPresented: $isSheetShown)
        }
    }
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(weekStore.allWeeks.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(weekStore.allWeeks.count) * distance(item)
        return sin(angle) * 200
    }
    
}


struct HomeCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCalendarView()
    }
}

struct WeekValue: Identifiable {
    var id: Int
    var date : [Date]
}

class WeekStore : ObservableObject {
    // Combined of all Weeks
    @Published var allWeeks : [WeekValue] = []
    
    // Current chosen date indicator
    @Published var currentDate : Date = Date()
    
    // Index indicator
    @Published var currentIndex : Int = 0
    @Published var indexToUpdate : Int = 0
    
    // Array of Weeks
    @Published var currentWeek: [Date] = []
    @Published var nextWeek : [Date] = []
    @Published var previousWeek : [Date] = []
    
    // Initial append of weeks
    init() {
        fetchCurrentWeek()
        fetchPreviousNextWeek()
        appendAll()
    }
    
    func appendAll() {
        var  newWeek = WeekValue(id: 0, date: currentWeek)
        allWeeks.append(newWeek)
        
        newWeek = WeekValue(id: 2, date: nextWeek)
        allWeeks.append(newWeek)
        
        newWeek = WeekValue(id: 1, date: previousWeek)
        allWeeks.append(newWeek)
    }
    
    func update(index : Int) {
        var value : Int = 0
        if index < currentIndex {
            value = 1
            if indexToUpdate ==  2 {
                indexToUpdate = 0
            } else {
                indexToUpdate = indexToUpdate + 1
            }
        } else {
            value = -1
            if indexToUpdate ==  0{
                indexToUpdate = 2
            } else {
                indexToUpdate = indexToUpdate - 1
            }
        }
        currentIndex = index
        addWeek(index: indexToUpdate, value: value)
    }
    
    func addWeek(index: Int, value: Int) {
        allWeeks[index].date.removeAll()
        var calendar = Calendar(identifier: .gregorian)
        let today = Calendar.current.date(byAdding: .day, value: 7 * value , to: self.currentDate)!
        self.currentDate = today
        
        calendar.firstWeekday = 7
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!
        
        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeek){
                allWeeks[index].date.append(weekday)
            }
        }
    }
    
    func isToday(date:Date)->Bool{
        let calendar = Calendar.current
        return calendar.isDate(currentDate, inSameDayAs: date)
    }
    
    
    func dateToString(date: Date,format: String)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func fetchCurrentWeek(){
        let today = currentDate
        var calendar = Calendar(identifier: .gregorian)
        
        calendar.firstWeekday = 7
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!
        
        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeek){
                currentWeek.append(weekday)
            }
        }
    }
    
    func fetchPreviousNextWeek(){
        nextWeek.removeAll()
        
        let nextWeekToday = Calendar.current.date(byAdding: .day, value: 7, to: currentDate )!
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 7
        
        let startOfWeekNext = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: nextWeekToday))!
        
        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeekNext){
                nextWeek.append(weekday)
            }
            
        }
        
        previousWeek.removeAll()
        let previousWeekToday = Calendar.current.date(byAdding: .day, value: -7, to: currentDate)!
        
        let startOfWeekPrev = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: previousWeekToday))!
        
        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeekPrev){
                previousWeek.append(weekday)
            }
        }
    }
}
