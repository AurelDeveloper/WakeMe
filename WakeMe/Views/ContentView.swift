import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            AlarmListView()
                .navigationBarTitle("Alarm Clock")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

