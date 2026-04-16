//
//  MessageBubbleView.swift
//  RAG Assistant
//
//  Created by Akshay Kumar on 15/04/26.
//

import SwiftUI

struct MessageBubbleView: View {
    let message: Message
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: message.isUser ? .trailing : .leading) {
            
            HStack {
                if message.isUser {
                    Spacer()
                    Text(message.text)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                } else {
                    
                    if message.isTyping {
                        TypingIndicatorView()
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            
                    } else {
                        //Text(message.text)
                        Text(message.text + (message.isStreaming ? " |" : ""))
                            .padding()
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
            }
            
            // 🔥 Show Sources
            if let sources = message.sources, !sources.isEmpty {
                VStack(alignment: .leading, spacing: 5) {
                    Button {
                        isExpanded.toggle()
                    } label: {
                        HStack {
                            Text(isExpanded ? "Hide Sources" : "Show Sources")
                                .font(.caption)
                            
                            Image(systemName: "chevron.down")
                                .rotationEffect(.degrees(isExpanded ? 180 : 0))
                                .animation(.easeInOut, value: isExpanded)
                        }
                        .foregroundColor(.blue)
                    }

                    if isExpanded {
                        ForEach(sources, id: \.id) { source in
                            Text("• \(source.content.prefix(80))...")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    MessageBubbleView(message: Message(text: "Hello, World!", isUser: false, isTyping: false, sources: nil, isStreaming: false))
    MessageBubbleView(message: Message(text: "Hello, World!", isUser: true, isTyping: false, sources: nil, isStreaming: false))
}
