import Foundation

class AlarmDetailViewModel: ObservableObject {
    // Properties for configuring individual alarms
    @Published var alarm: Alarm?
    
    init(alarm: Alarm? = nil) {
        self.alarm = alarm
    }
    
    func saveAlarm(hour: Int, minute: Int) {
        // Implementieren Sie die Logik zum Speichern des Alarms
        // Hier können Sie auf die Eigenschaften des Alarms zugreifen und sie entsprechend aktualisieren
        // Beispiel: alarm?.time = Time(hour: hour, minute: minute)
        
        guard var existingAlarm = alarm else {
            // Wenn kein Alarm vorhanden ist, erstellen Sie einen neuen
            let newAlarm = Alarm(time: Time(hour: hour, minute: minute))
            self.alarm = newAlarm
            // Hier können Sie weitere Initialisierungslogik für den neuen Alarm hinzufügen
            return
        }
        
        // Wenn ein Alarm bereits vorhanden ist, aktualisieren Sie ihn
        existingAlarm.time = Time(hour: hour, minute: minute)
        // Hier können Sie weitere Aktualisierungslogik für den bestehenden Alarm hinzufügen
    }
}
