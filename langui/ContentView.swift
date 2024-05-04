import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var isKeyboardVisible = false
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, isKeyboardVisible: $isKeyboardVisible)
                    .padding([.horizontal, .top])

                LevelListView()
                    .environmentObject(viewModel)
                    .navigationBarTitle("Stories", displayMode: .inline)
            }
            .background(Color(UIColor.systemBackground))
            .accentColor(Color("AccentColor"))
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(false )
            .onAppear {
                viewModel.fetchStories()
            }
            .padding(.bottom, isKeyboardVisible ? 0 : 0)
            
            // Alt navigasyon çubuğu
            TabView {
                Text("Home" ).tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                Text("Profile").tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            }
            .padding(.bottom, isKeyboardVisible ? 0 : 20) // Klavye açıksa altta biraz boşluk bırak
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
