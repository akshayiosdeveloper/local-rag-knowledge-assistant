//
//  Message.swift
//  RAG Assistant
//
//  Created by Akshay Kumar on 15/04/26.
//

import Foundation

struct Message {
    let id =  UUID()
    var text: String
    let isUser: Bool
    let isTyping: Bool
    let sources: [Source]?
    var isStreaming: Bool
}
