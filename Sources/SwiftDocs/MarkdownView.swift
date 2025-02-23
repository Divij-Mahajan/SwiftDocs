import SwiftUI

public struct MarkdownView: View {
    let content: String
    
    public init(content: String) {
        self.content = content
    }
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                let parsedLines = parseMarkdown(content)
                
                ForEach(parsedLines.indices, id: \.self) { index in
                    markdownText(for: parsedLines[index])
                }
            }
            .padding()
        }
    }
    
    // Parses Markdown while handling code blocks and lists
    private func parseMarkdown(_ text: String) -> [String] {
        var result: [String] = []
        let lines = text.components(separatedBy: .newlines)
        var isCodeBlock = false
        var codeBlockContent = ""
        
        for line in lines {
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            
            if trimmed.hasPrefix("```") {
                if isCodeBlock {
                    // Close code block, add to result
                    result.append("```" + codeBlockContent)
                    codeBlockContent = ""
                }
                isCodeBlock.toggle()
            } else if isCodeBlock {
                // Collect code block content
                codeBlockContent += "\n" + line
            } else {
                result.append(line)
            }
        }
        
        return result
    }
    
    // Converts parsed Markdown lines to SwiftUI Views
    @ViewBuilder
    private func markdownText(for line: String) -> some View {
        let trimmed = line.trimmingCharacters(in: .whitespaces)
        
        if trimmed.hasPrefix("```") {
            // Render entire block as a monospaced, properly styled text view
            let codeContent = trimmed.replacingOccurrences(of: "```", with: "")
            ScrollView(.horizontal) {
                Text(codeContent)
                    .font(.system(.subheadline, design: .monospaced)) // Smaller monospaced font
                    .foregroundColor(.white) // Code-like color
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.black.opacity(0.2)) // Darker background for contrast
                    .cornerRadius(8)
                    .shadow(radius: 2)
            }
        } else if trimmed.hasPrefix("# ") {
            Text(trimmed.replacingOccurrences(of: "# ", with: ""))
                .font(.largeTitle)
                .bold()
        } else if trimmed.hasPrefix("## ") {
            Text(trimmed.replacingOccurrences(of: "## ", with: ""))
                .font(.title)
                .bold()
        } else if trimmed.hasPrefix("### ") {
            Text(trimmed.replacingOccurrences(of: "### ", with: ""))
                .font(.headline)
                .bold()
        } else if let bulletMatch = trimmed.range(of: #"^[-*] "#, options: .regularExpression) {
            // Bullet point lists
            HStack {
                Text("•") // Bullet point
                    .bold()
                    .foregroundColor(.white)
                Text(try! AttributedString(markdown: trimmed.replacingCharacters(in: bulletMatch, with: ""), options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)))
            }
            .padding(.leading, 10) // Slight indentation for lists
        } else if let numberMatch = trimmed.range(of: #"^\d+\."#, options: .regularExpression) {
            // Numbered lists
            HStack {
                Text(trimmed[..<numberMatch.upperBound]) // Number with dot
                    .bold()
                 Text(try! AttributedString(markdown: String(trimmed[numberMatch.upperBound...]), options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)))

            }
            .padding(.leading, 10)
        } else if trimmed.isEmpty {
            // Preserve empty lines for spacing
            Text(" ")
        } else {
            Text(try! AttributedString(markdown: trimmed, options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)))
        }
    }
}
