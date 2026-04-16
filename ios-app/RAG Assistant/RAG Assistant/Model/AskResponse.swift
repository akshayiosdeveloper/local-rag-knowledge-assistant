//
//  AskResponse.swift
//  RAG Assistant
//
//  Created by Akshay Kumar on 16/04/26.
//

import Foundation

struct AskResponse: Decodable {
    let answer: String
    let query: String
    let sources: [Source]
}
struct Source: Decodable {
    let content: String
    let id: Int
}

