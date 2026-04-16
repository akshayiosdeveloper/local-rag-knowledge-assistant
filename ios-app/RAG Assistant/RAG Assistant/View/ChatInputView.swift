//
//  ChatInputView.swift
//  RAG Assistant
//
//  Created by Akshay Kumar on 15/04/26.
//

import SwiftUI

struct ChatInputView: View {
    
    @Binding var inputText: String
    var onSend: () -> Void
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            
            TextField("Type a message...", text: $inputText)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(20)
            
            
            Button(action: {
                onSend()
            }) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(inputText.trimmingCharacters(in: .whitespaces).isEmpty ? Color.gray : Color.blue)
                    .clipShape(Circle())
            }
            .disabled(inputText.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .padding()
        .background(Color.white)
    }
}
#Preview {
    ChatInputView(inputText: .constant("Type message..."), onSend: {})
}
