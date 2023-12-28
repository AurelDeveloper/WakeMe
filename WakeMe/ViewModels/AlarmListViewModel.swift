import SwiftUI

struct AlarmListView: View {
    @ObservedObject var viewModel = AlarmListViewModel()

    var body: some View {
        List(viewModel.alarms) { alarm in
            NavigationLink(destination: AlarmDetailView(viewModel: AlarmDetailViewModel(alarm: alarm))) {
                Text(alarm.timeString)
            }
        }
        .navigationBarItems(trailing: NavigationLink("Add", destination: AlarmDetailView()))
    }
}

struct AlarmListView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmListView()
    }
}

