# 🧠 LocalRAG: Advanced Personal Knowledge Assistant (Fully Offline)

LocalRAG is a production-oriented Retrieval-Augmented Generation (RAG) system designed to enable intelligent question answering over personal documents using a fully local setup.

This project is built from scratch with a strong focus on understanding core RAG concepts such as embeddings, vector similarity search, and retrieval optimization — without relying on black-box frameworks.

---

## 🚀 Why This Project?

Large Language Models (LLMs) cannot access your private data and often hallucinate.

LocalRAG solves this by:
- Retrieving relevant information from your documents
- Feeding it into the LLM as context
- Generating accurate, grounded answers

👉 **Search first, then generate**

---

## ✨ Features

- 📄 Multi-document ingestion (PDF, text)
- ✂️ Intelligent document chunking
- 🔍 Semantic search using embeddings
- 🧠 Context-aware answer generation
- 📌 Source attribution
- 🔄 Multi-document reasoning (compare & summarize)
- 🔒 Fully local (no APIs, complete privacy)

---

## 🛠️ Tech Stack

- **LLM**: llama3.1:8b-instruct (via Ollama)
- **Embeddings**: nomic-embed-text (via Ollama)
- **Vector Database**: Chroma
- **Backend (planned)**: FastAPI
- **Language**: Python

---

## 🧠 How It Works (RAG Pipeline)

1. Load documents (PDF/text)
2. Split into smaller chunks
3. Convert chunks into embeddings (vectors)
4. Store embeddings in Chroma vector database
5. Convert user query into embedding
6. Perform similarity search (cosine similarity)
7. Retrieve top relevant chunks
8. Pass context + query to LLM
9. Generate final answer

---

## 📂 Project Structure
