import SwiftUI

struct StoryDetailView: View {
    var story: Story
    @State private var selectedWord: String?
    @State private var translatedWord: String?
    @State private var isLoading: Bool = false
    @State private var isPopoverPresented: Bool = false

    struct MyMemoryTranslationResponse: Decodable {
        let responseData: MyMemoryTranslationData
    }

    struct MyMemoryTranslationData: Decodable {
        let translatedText: String?
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(story.title)
                    .font(.title)
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        translateWord(story.title)
                    }

                if !story.content.isEmpty {
                    Text("Content:")
                        .font(.headline)
                    contentWithTranslatedWords()
                }

                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1)) // Background color for better visibility
            .cornerRadius(10) // Rounded corners for aesthetics
            .padding() // Add padding to the whole VStack
            .popover(isPresented: $isPopoverPresented) {
                if let translatedWord = translatedWord {
                    Text("Türkçe Karşılığı: \(translatedWord)")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }
        }
        .navigationBarTitle("Story Detail")
    }

    @ViewBuilder
    private func contentWithTranslatedWords() -> some View {
        let paragraphs = story.content.components(separatedBy: .newlines)
        ForEach(0..<paragraphs.count, id: \.self) { index in
            let words = paragraphs[index].components(separatedBy: .whitespacesAndNewlines)
            VStack(alignment: .leading, spacing: 5) {
                ForEach(words, id: \.self) { word in
                    Text(word)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .onTapGesture {
                            selectedWord = word
                            translateWord(word)
                            isPopoverPresented = true
                        }
                }
            }
        }
    }

    func translateWord(_ word: String) {
        let baseURL = "https://api.mymemory.translated.net/get"
        let username = "678c4c92a9a3cf94137f"
        let apiKey = "f788c54138be166e1058"
        let sourceLang = "en"
        let targetLang = "tr"
        let query = [
            "q": word,
            "langpair": "\(sourceLang)|\(targetLang)",
            "username": username,
            "key": apiKey
        ].map { "\($0)=\($1)" }.joined(separator: "&")
        let urlString = "\(baseURL)?\(query)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        isLoading = true

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                print("HTTP Response Error: \(httpResponse.statusCode)")
                return
            }

            do {
                let translationResponse = try JSONDecoder().decode(MyMemoryTranslationResponse.self, from: data)
                if let translation = translationResponse.responseData.translatedText {
                    translatedWord = translation
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }

            isLoading = false
        }

        task.resume()
    }
}

