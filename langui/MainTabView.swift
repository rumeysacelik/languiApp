import SwiftUI

struct MainTabView: View {
    @State private var searchText = ""
    @State private var isKeyboardVisible = false
    @StateObject private var viewModel = ContentViewModel()
    private let authService = AuthService()
    
    var body: some View {
        // Alt navigasyon çubuğu
        TabView {
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
                .navigationBarHidden(false)
                .onAppear {
                    viewModel.fetchStories()
                }
                .padding(.bottom, isKeyboardVisible ? 0 : 0)
            }.tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            Button("Çıkış Yap",action: {
                authService.signOut()
            }).tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

#Preview {
    MainTabView()
}
