from fastapi import FastAPI
from pydantic import BaseModel

from src.retrieve import retrieve_chunks
from src.generate import generate_answer

app = FastAPI()

# Request schema


class QueryRequest(BaseModel):
    query: str
    # API endpoint


@app.get("/")
def health_check():
    return {"status": "RAG API is running"}


@app.post("/ask")
def ask_question(request: QueryRequest):
    query = request.query
    # Step 1: Retrieve
    chunks = retrieve_chunks(query)
    # Step 2: Generate
    answer = generate_answer(query, chunks)

    return {
        "query": query,
        "answer": answer,
        "sources": [
            {"id": i+1, "content": chunk[:200]}
            for i, chunk in enumerate(chunks)
        ]
    }
