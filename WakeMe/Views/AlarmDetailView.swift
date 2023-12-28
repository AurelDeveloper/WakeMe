import SwiftUI

struct AlarmDetailView: View {
    @ObservedObject var viewModel: AlarmDetailViewModel
    @State private var selectedHour: Int
    @State private var selectedMinute: Int

    init(alarm: Alarm? = nil) {
        if let alarm = alarm {
            self.viewModel = AlarmDetailViewModel(alarm: alarm)
            _selectedHour = State(initialValue: alarm.time.hour)
            _selectedMinute = State(initialValue: alarm.time.minute)
        } else {
            self.viewModel = AlarmDetailViewModel()
            _selectedHour = State(initialValue: 0)
            _selectedMinute = State(initialValue: 0)
        }
    }

    var body: some View {
        Form {
            Section(header: Text("Time")) {
                Picker("Hour", selection: $selectedHour) {
                    ForEach(0..<24, id: \.self) { hour in
                        Text("\(hour)")
                    }
                }
                Picker("Minute", selection: $selectedMinute) {
                    ForEach(0..<60, id: \.self) { minute in
                        Text("\(minute)")
                    }
                }
            }

            Section {
                Button("Save") {
                    viewModel.saveAlarm(hour: selectedHour, minute: selectedMinute)
                }
            }
        }
        .navigationTitle("Alarm Detail")
    }
}

struct AlarmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmDetailView()
    }
}

