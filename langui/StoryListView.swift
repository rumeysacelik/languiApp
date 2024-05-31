import SwiftUI

struct StoryListView: View {
    @EnvironmentObject var viewModel: LevelDetailViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.stories) { story in
                    NavigationLink(destination: StoryDetailView(story: story)) {
                        StoryCardView(story: story)
                    }
                    .buttonStyle(PlainButtonStyle()) // NavigationLink için düzgün bir buton stili
                }
            }
            .padding()
        }
    }
}


struct StoryCardView: View {
    let story: Story
    
    var body: some View {
        HStack(spacing: 20) {
            // Fotoğraf
            Image("storyPlaceholder") // Değiştirilebilir: Sizin resminizin adını kullanın
                .resizable()
                .frame(width: 80, height: 80)
                .aspectRatio(contentMode: .fill)
                .clipShape(Rectangle())
                .padding(.vertical, 10)

            VStack(alignment: .leading, spacing: 5) {
                Text(story.title)
                    .font(.headline)
                Text("Author: \(story.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(10)
        .background(Color.white) // Card arka plan rengi
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
