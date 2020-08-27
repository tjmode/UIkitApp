import Foundation
var schedule = "FRI:WK5"
var nextTripDate = ""
let weeks = ["WK1", "WK2", "WK3", "WK4", "WK5", "WK6"]
let normalWeeksOrder = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
var weekOrder = [[String]]()
var weekNameOrder = [String]()
var daysLimit = 300
var daysLimitCounter = 0
var dayToVist = ""
var weekToVist = ""
let date = Date()
let today = DateFormatter()
today.dateFormat = "EEE"
var calendar = NSCalendar.current
var weekOfMonth = calendar.component(.weekOfMonth, from: date)
var currentWeek = "WK1"
var currentDay = today.string(from: date).uppercased()
// currentDay = "MON"
func daySplitter() {
    var semiColonRemover = Array(schedule)
    if semiColonRemover[semiColonRemover.count - 1] == ";" {
         semiColonRemover.removeLast()
    }
    schedule = String(semiColonRemover)
    let schedulePerWeek = schedule.components(separatedBy: ";")
    for perWeek in schedulePerWeek {
        var perWeekSchedule = perWeek.components(separatedBy: ",")
        let temp = perWeekSchedule[0].components(separatedBy: ":")
        if temp.count != 0 {
            perWeekSchedule[0] = temp[1]
        } else {
            perWeekSchedule[0] = ""
        }
        weekOrder.append(perWeekSchedule)
        weekNameOrder.append(temp[0])
    }
    weekNameOrder = weekNameOrder.map{$0}
    weekOrder = weekOrder.map{$0.map{$0.uppercased()}}
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


var curWeek = weeks.index(of: currentWeek)!
var nextDay = 0
nextDay = normalWeeksOrder.index(of: currentDay)! + 1
currentWeek = weeks[curWeek]
func weekAndDayFinder () {
    while true {
        
        if weekOrder[nextDay].contains(currentWeek) || daysLimitCounter == daysLimit{
            dayToVist = weekNameOrder[nextDay]
            weekToVist = currentWeek
            break
        } else {
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
        daysLimitCounter = daysLimitCounter + 1
        if daysLimit != daysLimitCounter {
            let nextTripDay = Calendar.current.date(byAdding: .day, value: daysCount, to: date)!
            weekOfMonth = calendar.component(.weekOfMonth, from: nextTripDay)
            let tempWeekToVist = weekOfMonth
            let tempDayToVist = today.string(from: nextTripDay).uppercased()
            if "WK\(tempWeekToVist)" == weekToVist && tempDayToVist == dayToVist {
//                print("Date -",nextTripDay)
//                print("Day -",dayToVist)
//                print("Week -",weekToVist)
                nextTripDate = "date: \(nextTripDay), Day: \(dayToVist), Week: \(weekToVist)"
                break
            } else {
                daysCount = daysCount + 1
            }
        } else {
            nextTripDate = "OUT OF LIMIT \(daysLimit)"
            break
        }
    }
}

func nextVisit() {
    if schedule != "" {
        daySplitter()
        makingOrder()
        weekAndDayFinder()
        dateFinder()
    } else {
        nextTripDate = "Invaild-Input"
    }
    print(nextTripDate)
}
nextVisit()
