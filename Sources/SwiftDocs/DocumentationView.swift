//
//  DocumentationView.swift
//  
//
//  Created by divij mahajan on 22/02/25.
//

import SwiftUI

public struct DocumentationView: View {
    let topics : [String]
    let content : [String]
    @State var chosenTopic: String = 0
    
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
                           chosenTopicIndex = index
                       }) {
                           Text(topics[index])
                       }
                       .font(.headline)
                       .padding(.vertical, 5)
                       .buttonStyle(BorderlessButtonStyle())
                   }
                }
               .listStyle(.insetGrouped)
               VStack{
                   TopicView(topic: topics[chosenTopicIndex],content: content[chosenTopic])
               }
           }
        }
        .padding()
    }
