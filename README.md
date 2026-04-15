# 🚀 Advanced Personal Knowledge Assistant (RAG System)

An end-to-end **Retrieval-Augmented Generation (RAG)** system built from scratch using a **fully local setup**.
This project demonstrates deep understanding of how modern AI systems retrieve, rank, and generate answers grounded in data.

---

## 📌 Overview

This system allows you to:

- 📄 Upload and index multiple documents
- ❓ Ask questions based on those documents
- 🧠 Retrieve the most relevant context using vector similarity
- 🤖 Generate accurate answers using a local LLM
- 🔍 View source chunks used for answering

---

## 🧠 How It Works (RAG Pipeline)

```
User Query
   ↓
Embedding (nomic-embed-text via Ollama)
   ↓
Vector Search (ChromaDB)
   ↓
Top-K Retrieval
   ↓
Re-ranking (Cosine Similarity)
   ↓
Context Selection
   ↓
LLM Generation (Llama 3 via Ollama)
   ↓
Final Answer + Sources
```

---

## 🛠️ Tech Stack

- **LLM**: Ollama (`llama3:8b-instruct`)
- **Embeddings**: `nomic-embed-text`
- **Vector Database**: ChromaDB
- **Backend**: FastAPI
- **Language**: Python

---

## ✨ Features

- ✅ Multi-document support
- ✅ Context-aware question answering
- ✅ Chunking with overlap for better retrieval
- ✅ Cosine similarity-based re-ranking
- ✅ Metadata filtering (source-aware retrieval)
- ✅ Source attribution for transparency
- ✅ Fully local (no external APIs required)
- ✅ FastAPI backend for real-world usage

---

## 📂 Project Structure

```
local-rag-knowledge-assistant/
├── data/                # Input documents
├── src/
│   ├── api.py           # FastAPI backend
│   ├── ingest.py        # Document processing & chunking
│   ├── embed.py         # Embedding generation
│   ├── store.py         # Store data in ChromaDB
│   ├── retrieve.py      # Retrieval + re-ranking
│   ├── generate.py      # LLM response generation
├── vectordb/            # Persistent vector database
├── main.py              # CLI entry point
├── requirements.txt
├── README.md
```

---

## ⚙️ Setup Instructions

### 1. Clone Repository

```bash
git clone <your-repo-link>
cd local-rag-knowledge-assistant
```

---

### 2. Create Virtual Environment

```bash
python -m venv venv
source venv/bin/activate   # Mac/Linux
```

---

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

---

### 4. Install & Start Ollama

```bash
ollama serve
```

---

### 5. Pull Required Models

```bash
ollama pull llama3:8b-instruct
ollama pull nomic-embed-text
```

---

### 6. Run Initial Indexing

```bash
python main.py
```

---

## 🚀 API Usage (FastAPI)

### Start Server

```bash
uvicorn src.api:app --reload
```

---

### Open API Docs

```
http://127.0.0.1:8000/docs
```

---

### Endpoint

**POST /ask**

---

### Example Request

```json
{
  "query": "What is machine learning?"
}
```

---

### Example Response

```json
{
  "query": "What is machine learning?",
  "answer": "Machine learning is a method of data analysis...",
  "sources": [
    {
      "id": 1,
      "content": "Machine learning is a method of data analysis..."
    }
  ]
}
```

---

## 🔍 Key Concepts Implemented

### 📌 Chunking with Overlap

- Prevents loss of context
- Improves retrieval accuracy

### 📌 Embeddings

- Converts text into vectors
- Enables semantic search

### 📌 Vector Search (ChromaDB)

- Stores embeddings + metadata
- Retrieves similar chunks using cosine similarity

### 📌 Re-Ranking

- Improves retrieval quality
- Filters out irrelevant chunks

### 📌 Prompt Engineering

- Forces grounded answers
- Reduces hallucination

---

## 🎥 Demo

Example:

**Q:** What is machine learning?
**A:** Machine learning is a method of data analysis that automates analytical model building...

**Sources:**

- Machine learning (ML) is a subset of AI...
- It enables systems to learn from data...

---

## ⚠️ Limitations

- Retrieval quality depends on chunking strategy
- LLM may still produce imperfect answers if context is weak
- No UI (API-based system)

---

## 🚀 Future Improvements

- 📄 PDF upload support
- 💬 Chat interface (UI)
- 🔍 Hybrid search (keyword + vector)
- 🧠 LLM-based re-ranking
- 📊 Evaluation metrics

---

## 💡 Learnings

- RAG is only as good as its retrieval
- Embeddings capture semantic meaning, not exact text
- LLMs are pattern generators, not truth sources
- Prompt design significantly affects output quality

---

## 📌 Author

**Akshay Kumar**

---

## ⭐ If you like this project

Give it a ⭐ on GitHub and connect with me on LinkedIn!
