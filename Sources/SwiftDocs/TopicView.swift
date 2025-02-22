//
//  TopicView.swift
//  
//
//  Created by divij mahajan on 22/02/25.
//

import SwiftUI


struct TopicView: View {
    let topic: String
    let content: String
    
    var body: some View {
        VStack {
            Text(topic)
                .font(.largeTitle)
                .bold()
                .padding()
            
            ScrollView {
                MarkdownView(content: content)
            }
        }
        .padding()
    }


}
