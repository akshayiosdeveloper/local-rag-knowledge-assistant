//
//  ChatViewModel.swift
//  RAG Assistant
//
//  Created by Akshay Kumar on 15/04/26.
//

import Foundation
import Combine

class ChatViewModel: ObservableObject {
    @Published var messages:[Message] = []
    @Published var inputText:String = ""
    @Published var isTyping:Bool = false
    
    func sendMessage() {
        
        if inputText.trimmingCharacters(in: .whitespaces).isEmpty {
            return
        }
        let query = inputText
        
        let userMessage = Message(text: query, isUser: true, isTyping: false, sources: nil, isStreaming: false)
        messages.append(userMessage)
        
        inputText = ""
        
        // Add typing indicator
        let typingMessage = Message(
            text: "",
            isUser: false,
            isTyping: true, sources: nil, isStreaming: false
        )
        
        messages.append(typingMessage)
        
        fetchAnswer(query: query) { response in
            
            DispatchQueue.main.async {
                
                // ✅ 1. Remove typing indicator FIRST
                if let index = self.messages.lastIndex(where: { message in
                    message.isTyping == true
                }) {
                    self.messages.remove(at: index)
                }
                
                // ✅ 2. Handle error
                guard let response = response else {
                    let errorMessage = Message(
                        text: "Something went wrong",
                        isUser: false,
                        isTyping: false,
                        sources: nil,
                        isStreaming: false
                    )
                    self.messages.append(errorMessage)
                    return
                }
                
                // ✅ 3. Start streaming (with sources)
                self.streamResponse(response.answer, sources: response.sources)
            }
        }
    }
    
    func fetchAnswer(query: String, completion: @escaping (AskResponse?) -> Void) {
        
        guard let url = URL(string: "http://127.0.0.1:8000/ask") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["query": query]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error:", error)
                completion(nil)
                return
            }
            print(" ----response -----")
            print(response)

            
            guard let data = data else {
                completion(nil)
                print(String(data: data!, encoding: .utf8) ?? "No data")
                return
            }
            
            DispatchQueue.main.async {
                let result = try? JSONDecoder().decode(AskResponse.self, from: data)
                completion(result)
            }
            
        }.resume()
    }
    
    func streamResponse(_ fullText: String, sources: [Source]) {
        
        let words = fullText.split(separator: " ")
       // let characters = Array(fullText)
        // Create empty AI message first
        let aiMessage = Message(
            text: "",
            isUser: false,
            isTyping: false,
            sources: sources,
            isStreaming: true
        )
        
        messages.append(aiMessage)
        
        guard let index = messages.indices.last else { return }
        
        for (i, word) in words.enumerated() {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.3) {
                
                self.messages[index].text += word + " "
                //self.messages[index].text.append(char)
                if i == words.count - 1 {
                                self.messages[index].isStreaming = false
                            }
            }
        }
    }
    
    func clearChat() {
        messages.removeAll()
    }
}

