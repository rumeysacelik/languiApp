import SwiftUI

struct StoryListView: View {
    @EnvironmentObject var viewModel: LevelDetailViewModel

    var body: some View {
        List {
            ForEach(viewModel.stories) { story in
                NavigationLink(destination: StoryDetailView(story: story)) {
                    Text(story.title)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}
