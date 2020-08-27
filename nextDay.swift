import Foundation
var schedule = "TUE:WK1"
let weeks = ["WK1", "WK2", "WK3", "WK4", "WK5", "WK6"]
let normalWeeksOrder = ["SUN","MON", "TUE", "WED", "THU", "FRI", "SAT"]
var weekOrder = [[String]]()
var weekNameOrder = [String]()
var valueToAdded = 0

let date = Date()
let today = DateFormatter()
today.dateFormat = "EEE"
var currentDay = today.string(from: date).uppercased()
today.dateFormat = "yyyy"
var currentYear = Int(today.string(from: date))!
print(currentYear)
today.dateFormat = "MM"
var currentMonth = Int(today.string(from: date))!
today.dateFormat = "dd"
var currentDate = Int(today.string(from: date))!

let calendar = NSCalendar.current
let weekOfMonth = calendar.component(.weekOfMonth, from: date)
var currentWeek = "WK\(weekOfMonth)"
var schedulePerWeek = schedule.components(separatedBy: ";")

for perWeek in schedulePerWeek {
    var perWeekSchedule = perWeek.components(separatedBy: ",")
    let a = perWeekSchedule[0].components(separatedBy: ":")
    if a.count != 0 {
        perWeekSchedule[0] = a[1]
    } else {
        perWeekSchedule[0] = ""
    }
    weekOrder.append(perWeekSchedule)
    weekNameOrder.append(a[0])
}

func makingOrder() {
    var tempWeekOrder = [[String]]()
    var tempWeekNameOrder = [String]()
    for i in normalWeeksOrder {
        if weekNameOrder.contains(i) {
            tempWeekNameOrder.append(i)
            tempWeekOrder.append(weekOrder[weekNameOrder.index(of: i)!])
        } else {
            tempWeekOrder.append([""])
            tempWeekNameOrder.append("")
        }
        
    }
    weekNameOrder = tempWeekNameOrder
    weekOrder = tempWeekOrder
}
makingOrder()
print(weeks,"WEEKS")
print(weekOrder, "WEEKORDER")
print(weekNameOrder, "WEEKNAMEORDER")
func checkLeapYear(for year: Int) -> Bool {
    if year % 4 == 0 {
        if year % 100 == 0 {
            if year % 400 == 0 {
                return true
            }
            else {
                return false
            }
        }
        else {
            return true
        }
    }
    else {
        return false
    }
}

func numberOfDaysForEachMonthInCurrentYear(for isLeapYear: Bool) -> [Int] {
    if isLeapYear == false {
        return [31,28,31,30,31,30,31,31,30,31,30,31]
    } 
    else {
        return [31,29,31,30,31,30,31,31,30,31,30,31]
    }
}

let isLeapYear: Bool = checkLeapYear(for: currentYear)
var numberOfdaysForEachMonth: [Int] = numberOfDaysForEachMonthInCurrentYear(for: isLeapYear)

var curWeek = weeks.index(of: currentWeek)! //4
var nextDay = normalWeeksOrder.index(of: currentDay)! + 1 //5
print(curWeek,nextDay)
while true {
    if currentDate == numberOfdaysForEachMonth[currentMonth - 1] {
        currentMonth += 1
        curWeek = 0
        nextDay += 1
        currentDate = 1
        print(nextDay)
    }
    else {
        if weekOrder[nextDay].contains(weeks[curWeek]) {
            valueToAdded += 1
            currentDate += 1
            break
        }
        else if nextDay != normalWeeksOrder.count - 1 {
            valueToAdded += 1
            currentDate += 1
            nextDay += 1
        }
        else if curWeek != weeks.count - 1 {
            valueToAdded += 1
            currentDate += 1
            curWeek += 1
            nextDay = 0
        }
        else {
            valueToAdded += 1
            currentDate += 1
            curWeek = 0 
            nextDay = 0
        }
    }
}
print(valueToAdded)
let nextDayVisit = Calendar.current.date(byAdding: .day, value: valueToAdded, to: date)!
print(nextDayVisit)
