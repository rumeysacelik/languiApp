import SwiftUI

struct LevelListView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    @State private var selectedLevel: String = "Hepsi"
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 17) {
                    // Hepsi kartı
                    Button(action: {
                        selectedLevel = "Hepsi"
                    }) {
                        VStack {
                            Text("Hepsi")
                                .padding()
                                .foregroundColor(.black)
                        }
                        .background(selectedLevel == "Hepsi" ? Color(#colorLiteral(red: 0.7, green: 0.9, blue: 0.9, alpha: 1)) : Color(#colorLiteral(red: 0.5294117647, green: 0.7176470588, blue: 0.7058823529, alpha: 1)))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }

                    // Diğer seviyeler
                    ForEach(viewModel.levels, id: \.self) { level in
                        Button(action: {
                            selectedLevel = level
                        }) {
                            VStack {
                                Text(level)
                                    .padding()
                                    .foregroundColor(.black)
                            }
                            .background(selectedLevel == level ? Color(#colorLiteral(red: 0.7, green: 0.9, blue: 0.9, alpha: 1)) : Color(#colorLiteral(red: 0.5294117647, green: 0.7176470588, blue: 0.7058823529, alpha: 1)))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                    }
                }
                .padding(.horizontal) // Sadece yatayda padding ekledik
            }

            ScrollView {
                if selectedLevel == "Hepsi" {
                    ForEach(viewModel.levels, id: \.self) { level in
                        LevelDetailView(level: level)
                            .padding(.top, 10) // Üstten biraz boşluk bırakıyoruz
                    }
                } else {
                    LevelDetailView(level: selectedLevel)
                        .id(selectedLevel) // Force update when selectedLevel changes
                        .padding(.top, 10) // Üstten biraz boşluk bırakıyoruz
                }
            }
            .padding(.bottom,20)
        }
    }
}

#Preview {
    MainTabView()
}
