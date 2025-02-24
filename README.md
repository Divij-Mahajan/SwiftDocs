# SwiftDocs  

[![Swift](https://img.shields.io/badge/Swift-5.7-orange.svg)](https://swift.org)  
[![Platforms](https://img.shields.io/badge/platforms-macOS%20|%20iOS%20|%20tvOS%20|%20watchOS-blue.svg)](https://developer.apple.com)  

SwiftDocs is a lightweight and customizable Swift package that provides a **Markdown-based documentation system** for Swift applications. It allows developers to easily create, structure, and display documentation within their apps using a **minimal and modern UI**.

## **Features**
-  Simple Markdown parsing with proper **heading & subheading support**  
-  Supports SwiftUI-based **documentation rendering**  
-  Lightweight & optimized for **performance**  
-  Works seamlessly across **iOS, macOS, tvOS, and watchOS**  
-  Supports **custom themes & navigation**  

## **Installation**  
SwiftDocs is distributed using the **Swift Package Manager (SPM)**.  

### **Using Swift Package Manager (SPM)**
1. In **Xcode**, open your project and navigate to:  
   `File` → `Swift Packages` → `Add Package Dependency`  
2. Enter the SwiftDocs repository URL:  
   ```sh
   https://github.com/yourusername/SwiftDocs.git```


## **Basic Usage**
To integrate SwiftDocs into your SwiftUI app, simply create a SwiftDocsView and pass in Markdown content.

```swift
import SwiftUI

struct LearnView: View {
    let topics = [
        "What is Q-Learning?",
        "What are States and Actions?",
    ]

    let content: [String] = [
    """
    # What is Q-Learning?
    
    Q-learning is a **reinforcement learning technique** that helps an agent learn the best actions by exploring different choices and learning from rewards. Think of it as **training a dog**:  
    - If the dog sits when you say "sit" and you give it a treat (**reward**), it learns that sitting is a good action.
    - If it jumps instead and gets no treat (**negative reward**), it learns that jumping isn't useful.
   
    Video Explanation: https://youtu.be/9rMigxi3AwU
    
    """,
    
    """
    # What Are States and Actions?
    
    In Q-learning, the AI sees the world as a **set of states** and decides what **actions** to take.  
    
    
    ### Example Code (Defining a State & Action)
    ```swift
    struct State {
        let puckX: Float
        let puckY: Float
        let paddleX: Float
    }
    
    enum Action {
        case moveLeft
        case moveRight
        case stayStill
    }
    ```
 
    """
  
    ]

    
    var body: some View {            
        VStack {
            DocumentationView(topics:topics, content:content)
        }
    }
}

```
