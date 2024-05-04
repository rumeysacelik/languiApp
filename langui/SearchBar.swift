import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isKeyboardVisible: Bool

    var body: some View {
        HStack {
            TextField("Search", text: $text, onEditingChanged: { editing in
                if editing {
                    // Klavye açıldığında yapılacak işlemler
                    self.isKeyboardVisible = true
                } else {
                    // Klavye kapatıldığında yapılacak işlemler
                    self.isKeyboardVisible = false
                }
            })
            .padding(10)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(8)
            
            // TextField'in içindeki metni temizleme butonu
            Button(action: {
                self.text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .opacity(text == "" ? 0 : 1)
            }
            .padding(.trailing, 10)
            .accentColor(.gray)
        }
        .padding(.horizontal, 10)
    }
}

