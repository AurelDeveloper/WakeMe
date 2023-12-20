import SwiftUI

// Datenmodell für den Wecker
struct Alarm: Identifiable {
    var id = UUID()
    var name: String
    var time: Date
    var selectedDays: [Int]
    var selectedSound: String
    var isActive: Bool
    var stepsCount: Bool
}

