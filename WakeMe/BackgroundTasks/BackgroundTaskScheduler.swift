import Foundation
import BackgroundTasks

class BackgroundTaskScheduler {
    static func scheduleBackgroundTask() {
        let identifier = "com.yourcompany.backgroundtask"
        
        BGTaskScheduler.shared.register(forTaskWithIdentifier: identifier, using: nil) { task in
            self.handleBackgroundTask(task: task as! BGAppRefreshTask)
        }
        
        let request = BGAppRefreshTaskRequest(identifier: identifier)
        request.earliestBeginDate = Date(timeIntervalSinceNow: 60 * 15) // Schedule the task to start in 15 minutes
        
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Unable to submit task: \(error.localizedDescription)")
        }
    }
    
    private static func handleBackgroundTask(task: BGAppRefreshTask) {
        task.expirationHandler = {
            task.setTaskCompleted(success: false)
        }
        
        DispatchQueue.global().async {
            // Perform background task logic here
            
            // Remember to call setTaskCompleted(success:) when the task is done
            task.setTaskCompleted(success: true)
        }
    }
}

