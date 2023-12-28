import SwiftUI

@main
struct ClockAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    NotificationHelper.requestAuthorization()
                    BackgroundTaskScheduler.scheduleBackgroundTask()
                }
        }
    }
}

