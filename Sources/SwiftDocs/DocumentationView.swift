
import SwiftUI

struct DocumentationView: View {
    let topics : [String]
    let content : [String]
    @State var chosenTopic: Int = 0
    
    var body: some View {
        HStack{
            List {
                Section {
                    Text("Table of Contents")
                        .font(.title)
                        .bold()
                    
                }
                ForEach(topics.indices, id: \.self) { index in
                    Button(action: {
                        chosenTopic = index
                    }) {
                        Text(topics[index])
                            .frame(maxWidth:.infinity,alignment:.leading)
                        .multilineTextAlignment(.leading)
                    }
                    .frame(alignment:.leading)
                    .font(.headline)
                    .padding(.vertical, 5)
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            .listStyle(.insetGrouped)
            .cornerRadius(13)
            VStack{
                TopicView(topic: topics[chosenTopic],content: content[chosenTopic])
            }
        }
        
    }

    }
