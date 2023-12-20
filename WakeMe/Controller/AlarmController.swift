import Foundation
import UserNotifications

class AlarmController {
    static func scheduleAlarm(time: Date, selectedDays: [Int], selectedSound: String) {
        let alarmScheduler = AlarmScheduler(time: time, selectedDays: selectedDays, selectedSound: selectedSound)
        alarmScheduler.schedule()
    }
}

