# 🚀 RAG Assistant (iOS + FastAPI)

A **production-style Retrieval-Augmented Generation (RAG)** system with a **SwiftUI iOS app frontend** and **fully local AI backend**.

![SwiftUI](https://img.shields.io/badge/Frontend-SwiftUI-orange)
![FastAPI](https://img.shields.io/badge/Backend-FastAPI-green)
![Ollama](https://img.shields.io/badge/LLM-Ollama-blue)
![ChromaDB](https://img.shields.io/badge/VectorDB-ChromaDB-purple)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

# 🎯 Project Overview

This project demonstrates an **end-to-end AI system**:

- 📱 iOS App (SwiftUI)
- ⚙️ FastAPI Backend
- 🧠 Local LLM (Ollama)
- 🗄️ Vector Database (ChromaDB)

The system retrieves relevant context from documents and generates **grounded, explainable answers with sources**.

---

# 🧠 Architecture

```text
User (iOS App)
      ↓
FastAPI (/ask)
      ↓
Embedding (Ollama)
      ↓
ChromaDB (Vector Search)
      ↓
Top-K Retrieval
      ↓
Re-ranking (Cosine Similarity)
      ↓
Context Selection
      ↓
LLM (Ollama - llama3)
      ↓
Response (Answer + Sources)
      ↓
Streaming UI (SwiftUI)
```

---

# 📱 iOS App Features (SwiftUI)

## 💬 Chat Interface

- Clean chat UI (SwiftUI)
- User vs AI message bubbles
- Auto-scroll to latest message

## ⚡ Streaming Response

- Word-by-word AI response
- Cursor indicator (`|`) while streaming
- Smooth real-time updates

## ⏳ Typing Indicator

- Animated 3-dot typing indicator
- Replaced by streaming response

## 📚 Source Attribution (Key Feature)

- Displays sources below AI response
- Collapsible / expandable UI
- Improves transparency and trust

## 🧹 Clear Chat

- Trash button in navigation bar
- Confirmation alert before clearing
- Disabled when chat is empty

## 🎨 UI Enhancements

- Modern input field (rounded)
- Floating send button (SF Symbol)
- Navigation title with icon
- Clean spacing and layout

---

# ⚙️ Backend Features (FastAPI)

## 🔌 API Endpoint

- `POST /ask`
- Input: user query
- Output:

```json
{
  "answer": "...",
  "sources": [{ "content": "...", "id": 1 }]
}
```

## 🧠 RAG Pipeline

- Document ingestion & chunking
- Embedding generation (Ollama)
- Vector storage (ChromaDB)
- Similarity search (top-k)
- Custom re-ranking (cosine similarity)

## 📂 Multi-Document Support

- Loads multiple files from `data/`
- Cross-document querying

## 🏷️ Metadata Filtering

- Source tracking for each chunk

---

## 🎥 Demo

👉 [Watch Demo Video](https://youtu.be/O7MP3EIqig0)

---

## 📸 Screenshots

## 💬 Chat Interface

<p align="center">
  <b>iOS app showing input, prediction result, and loading state</b>
</p>

<p align="center">
  <img src="assets/screenshots/input.png" width="260" height="540"/>
  <img src="assets/screenshots/result.png" width="260" height="540"/>
  <img src="assets/screenshots/result_part2.png" width="260" height="540"/>
</p>

---

# 🧱 Tech Stack

## 📱 Frontend (iOS)

- SwiftUI
- MVVM Architecture
- URLSession (API calls)

## ⚙️ Backend

- FastAPI
- Python

## 🧠 AI / ML

- Ollama (`llama3:8b-instruct`)
- Ollama (`nomic-embed-text`)

## 🗄️ Database

- ChromaDB (Vector DB)

---

# 🧠 Key Concepts Implemented

- Retrieval-Augmented Generation (RAG)
- Vector Embeddings
- Cosine Similarity
- Re-ranking
- Streaming UI updates
- MVVM architecture (iOS)

---

# 🔄 App Flow

```text
User types question
      ↓
Message sent to FastAPI
      ↓
Typing indicator shown
      ↓
Response received
      ↓
Typing removed
      ↓
AI response streams word-by-word
      ↓
Sources displayed below answer
```

---

# 🚀 How to Run

## 1️⃣ Backend (FastAPI)

```bash
pip install -r requirements.txt
uvicorn main:app --reload
```

## 2️⃣ Run Ollama Models

```bash
ollama run llama3:8b-instruct
ollama run nomic-embed-text
```

## 3️⃣ iOS App

- Open project in Xcode
- Run on simulator/device
- Ensure backend is running at:

```
http://127.0.0.1:8000
```

---

# 📸 Features Showcase

- 💬 Chat-based interface
- ⚡ Streaming AI responses
- 📚 Source-backed answers
- 🧹 Clear chat functionality

---

# 💪 Strengths of This Project

- Fully local AI system (no external APIs)
- End-to-end architecture (frontend + backend)
- Explainable AI (source attribution)
- Real-time streaming UX
- Clean MVVM architecture

---

# 🔮 Future Improvements

- PDF upload support
- Hybrid search (keyword + vector)
- LLM-based re-ranking
- Conversation memory
- Streaming directly from backend (token streaming)
- Deployment (cloud + mobile release)

---

# 👨‍💻 Author

Akshay Kumar

---

# ⭐ Why This Project Matters

This project demonstrates the ability to:

- Build **AI-powered applications end-to-end**
- Design **clean architecture (MVVM + API)**
- Implement **real-world RAG systems**
- Focus on **UX + explainability**

---
