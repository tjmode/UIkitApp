var curWeek = weeks.index(of: currentWeek)! //4
var nextDay = normalWeeksOrder.index(of: currentDay)! + 1 //4
print(curWeek,nextDay)
while true {
    if weekOrder[nextDay].contains(weeks[curWeek]) {
        valueToAdded += 1
        break
    }
    else if nextDay != normalWeeksOrder.count - 1 {
        nextDay += 1
    }
    else if curWeek != weeks.count - 1 {
        valueToAdded += 1
        curWeek += 1
        nextDay = 0
    }
    else {
    valueToAdded += 1
        curWeek = 0 
        nextDay = 0
    }
    }
