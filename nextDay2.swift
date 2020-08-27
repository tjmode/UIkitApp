import Foundation
var schedule = "SUN:WK1"
let weeks = ["WK1", "WK2", "WK3", "WK4", "WK5", "WK6"]
let normalWeeksOrder = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
var weekOrder = [[String]]()
var weekNameOrder = [String]()
var valueToAdded = 0
var dayToVist = ""
var weekToVist = ""
let date = Date()
let today = DateFormatter()
today.dateFormat = "EEE"
var calendar = NSCalendar.current
var weekOfMonth = calendar.component(.weekOfMonth, from: date)
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
// print(weekOrder, "WEEKORDER")
// print(weekNameOrder, "WEEKNAMEORDER")
makingOrder()
var curWeek = weeks.index(of: currentWeek)!
var nextDay = 0
//if  weekOrder.count != 1{
    
    //print(nextDay)
    // if weekOrder.count == nextDay {
    //     nextDay = 0
    // }
//} else {
    //nextDay = 0
//}
nextDay = normalWeeksOrder.index(of: currentDay)! + 1
currentWeek = weeks[curWeek]
func weekAndDayFinder () {
    while true {
        if weekOrder[nextDay].contains(currentWeek) {
            dayToVist = weekNameOrder[nextDay]
            weekToVist = currentWeek
            valueToAdded = valueToAdded + 1
            break
        } else {
            valueToAdded = valueToAdded + 1
            if weekNameOrder.count - 1 != nextDay {
                nextDay = nextDay + 1
            } else {
                nextDay = 0
                if curWeek != weeks.count - 1  {
                    curWeek = curWeek + 1
                    currentWeek = weeks[curWeek]
                } else {
                    curWeek = 0
                    currentWeek = weeks[curWeek]
                }
            }
        }
    }
}

func dateFinder() {
    var daysCount = 1
    while true {
        let nextTripDay = Calendar.current.date(byAdding: .day, value: daysCount, to: date)!
        weekOfMonth = calendar.component(.weekOfMonth, from: nextTripDay)
        let tempWeekToVist = weekOfMonth
        let tempDayToVist = today.string(from: nextTripDay).uppercased()
        if "WK\(tempWeekToVist)" == weekToVist && tempDayToVist == dayToVist{
        print("Date-",nextTripDay)
        print("Day-",dayToVist)
        print("Week-",weekToVist)
        break
        } else {
            daysCount = daysCount + 1
        }
    }
}

weekAndDayFinder()
dateFinder()
