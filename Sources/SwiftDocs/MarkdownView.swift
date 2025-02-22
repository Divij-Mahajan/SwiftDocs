//
//  MarkdownView.swift
//  
//
//  Created by divij mahajan on 22/02/25.
//

import SwiftUI

public struct MarkdownView: View {
    let content: String

    public init(content: String) {
        self.content = content
    }

    public var body: some View {
        ScrollView {
            Text(try! AttributedString(markdown: content))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
