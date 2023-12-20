// ContentView.swift
import SwiftUI

struct ContentView: View {
    @ObservedObject var alarmManager = AlarmManager()

    var body: some View {
        NavigationView {
            AlarmListView(alarms: alarmManager.alarms)
                .navigationBarTitle("Wecker")
        }
    }
}

