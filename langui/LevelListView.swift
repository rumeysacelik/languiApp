import SwiftUI

struct LevelListView: View {
    @EnvironmentObject var viewModel: ContentViewModel

    var body: some View {
        List {
            ForEach(viewModel.levels, id: \.self) { level in
                NavigationLink(destination: LevelDetailView(level: level)) {
                    VStack {
                        Text(level)
                            .padding()
                            .foregroundColor(.black)
                    }
                    .background(Color(#colorLiteral(red: 0.5294117647, green: 0.7176470588, blue: 0.7058823529, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}
