import SwiftUI
import FirebaseFirestore

class ContentViewModel: ObservableObject {
    @Published var stories: [Story] = []
    @Published var levels: [String] = []

    func fetchStories() {
        let db = Firestore.firestore()
        let collectionRef = db.collection("bookNo")

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
                      let level = data["level"] as? String else {
                    return nil
                }
                if !self.levels.contains(level) {
                    self.levels.append(level)
                }
                return Story(title: title, content: content, level: level)
            }
        }
    }
}

