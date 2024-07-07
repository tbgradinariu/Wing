import SwiftUI
import Shared

struct HomeView: View {
    @State private var showContent = false
    var body: some View {
        VStack {
            ProfileCardView()
            NextWorkoutCardView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.dark.edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
