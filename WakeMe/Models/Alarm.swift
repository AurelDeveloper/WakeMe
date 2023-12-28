import Foundation

struct Alarm: Identifiable {
    var id: UUID = UUID()
    var time: Time
    // Add any other properties needed for alarms

    var timeString: String {
        return "\(time.hour):\(time.minute)"
    }
}

