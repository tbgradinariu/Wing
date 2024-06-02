import SwiftUI
import Shared

struct HomeView: View {
    @State private var showContent = false
    var body: some View {
        VStack {
            ProfileCardView()
            Divider()
                .background(Color.white)
            VStack {
                HStack {
                    Text("Next planned workout")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.leading)
                .padding(.top, 4)
                HStack {
                    Text("Tomorrow, June 3rd")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.leading)
//                ForEach()
                Button(action: startWorkout) {
                    Text("Start workout")
                        .foregroundColor(.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 45)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .cornerRadius(10)
            .padding(.horizontal, 4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
    
    func startWorkout() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
