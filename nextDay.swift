import UIKit
var schedule = "WED:WK5"
let weeks = ["WK1", "WK2", "WK3", "WK4", "WK5", "WK6"]
let normalWeeksOrder = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
var weekOrder = [[String]]()
var weekNameOrder = [String]()
var valueToAdded = 0
let date = Date()
let today = DateFormatter()
today.dateFormat = "EEE"
let calendar = NSCalendar.current
let weekOfMonth = calendar.component(.weekOfMonth, from: date)
var currentWeek = "WK5"
var currentDay = today.string(from: date).uppercased()
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
makingOrder()
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
print(weekOrder)
print(weekNameOrder)

var curWeek = weeks.index(of: currentWeek)!
var nextDay = 0
if weekOrder[curWeek].count != 1 {
    nextDay = weekNameOrder.index(of: currentDay)! + 1
    if weekOrder.count == nextDay {
        nextDay = 0
    }
} else {
    nextDay = 0
    currentWeek = weeks[curWeek]
    //valueToAdded = -3
}
while true {
    if weekOrder[nextDay].contains(currentWeek) {
        print(currentWeek)
        print(weekOrder[nextDay])
        print(weekNameOrder[nextDay])
        valueToAdded = valueToAdded + 1
        break
    } else {
        valueToAdded = valueToAdded + 1
        if weekNameOrder.count - 1 != nextDay {
            nextDay = nextDay + 1
        } else {
            nextDay = 0
            if curWeek != 4 {
                curWeek = curWeek + 1
                currentWeek = weeks[curWeek]
            } else {
                curWeek = 0
                currentWeek = weeks[curWeek]
            }
        }
    }
}
print(valueToAdded)
let m = Calendar.current.date(byAdding: .day, value: valueToAdded, to: date)!
print(m)
