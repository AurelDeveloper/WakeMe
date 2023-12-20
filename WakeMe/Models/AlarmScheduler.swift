import Foundation
import UserNotifications

class AlarmScheduler {
    private let time: Date
    private let selectedDays: [Int]
    private let selectedSound: String
    
    init(time: Date, selectedDays: [Int], selectedSound: String) {
        self.time = time
        self.selectedDays = selectedDays
        self.selectedSound = selectedSound
    }

    func schedule() {
        let center = UNUserNotificationCenter.current()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: time)

        let alarmTime = calendar.date(bySettingHour: components.hour!, minute: components.minute!, second: 0, of: Date())!

        var dateComponents = DateComponents()
        dateComponents.hour = calendar.component(.hour, from: alarmTime)
        dateComponents.minute = calendar.component(.minute, from: alarmTime)

        let selectedDaysSet = Set(selectedDays)
        let currentDay = calendar.component(.weekday, from: Date())

        for selectedDay in selectedDaysSet {
            let daysToAdd = selectedDay - currentDay
            dateComponents.day = daysToAdd >= 0 ? daysToAdd : (daysToAdd + 7)

            let triggerDate = calendar.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!

            let content = UNMutableNotificationContent()
            content.title = "Alarm Time!"
            content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: selectedSound))

            let trigger = UNCalendarNotificationTrigger(dateMatching: calendar.dateComponents([.hour, .minute, .second], from: triggerDate), repeats: true)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                }
            }
        }
    }
}

