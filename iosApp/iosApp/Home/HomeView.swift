import SwiftUI
import Shared

struct HomeView: View {
    @State private var showContent = false
    var body: some View {
        VStack {
            ProfileCardView()
            Divider()
                .background(Color.white)
            NextWorkoutCardView()
            .frame(maxWidth: .infinity)
            .cornerRadius(10)
            .padding(.horizontal, 4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
