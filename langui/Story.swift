import Foundation

struct Story: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let level: String
    let author: String
    
    init(title: String, content: String, level: String,author : String) {
        self.title = title
        self.content = content
        self.level = level
        self.author = author
    }
}
