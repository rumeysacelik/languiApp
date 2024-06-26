import SwiftUI
import FirebaseFirestore

class LevelDetailViewModel: ObservableObject {
    @Published var stories: [Story] = []

    func fetchStoriesForLevel(_ level: String) {
        let db = Firestore.firestore()
        let collectionRef = db.collection("bookNo").whereField("level", isEqualTo: level)

        collectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }

            self.stories = documents.compactMap { document in
                let data = document.data()
                guard let title = data["title"] as? String,
                      let content = data["book"] as? String,
                      let level = data["level"] as? String,
                      let author = data["author"] as? String else{
                    return Story(title: "?", content: "?", level: "?", author: "?")
                }
                return Story(title: title, content: content, level: level,author: author)
            }
        }
    }
}
