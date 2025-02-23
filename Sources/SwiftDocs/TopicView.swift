import SwiftUI


struct TopicView: View {
    let topic: String
    let content: String
    
    var body: some View {
        VStack {
            ScrollView {
                MarkdownView(content: content)
            }
        }
        .padding()
    }
    
    
}
