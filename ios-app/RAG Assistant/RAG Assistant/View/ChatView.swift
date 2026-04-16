//
//  ChatView.swift
//  RAG Assistant
//
//  Created by Akshay Kumar on 15/04/26.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject private var viewModel = ChatViewModel()
    @State private var showAlert = false
    var body: some View {
        NavigationStack {
            
            ScrollViewReader { proxy in
                
                VStack {
                    
                    ScrollView {
                        VStack {
                            ForEach(viewModel.messages, id: \.id) { message in
                                MessageBubbleView(message: message)
                                    .id(message.id)
                            }
                        }
                    }
                    
                    ChatInputView(
                        inputText: $viewModel.inputText,
                        onSend: {
                            viewModel.sendMessage()
                        }
                    )
                }
                
                // 🔥 Auto Scroll Trigger
                .onChange(of: viewModel.messages.count) { _ in
                    
                    if let lastMessage = viewModel.messages.last {
                        DispatchQueue.main.async {
                            withAnimation {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                }
            }
            .toolbar {
                
                // 🔹 Center Title
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "brain.head.profile")
                        Text("RAG Assistant")
                            .font(.headline)
                    }
                }
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAlert = true
                        
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)        }
        .alert("Clear Chat?", isPresented: $showAlert) {
            Button("Cancel", role: .cancel) { }
            
            Button("Clear", role: .destructive) {
                viewModel.clearChat()
            }
        }
    }
}
#Preview {
    ChatView()
}


