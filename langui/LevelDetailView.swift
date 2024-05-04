import SwiftUI

struct LevelDetailView: View {
    var level: String
    @StateObject private var viewModel = LevelDetailViewModel()

    var body: some View {
        VStack {
            Text("Level \(level)")
                .font(.title)
                .padding()

            StoryListView()
                .environmentObject(viewModel)
        }
        .onAppear {
            viewModel.fetchStoriesForLevel(level)
        }
    }
}
