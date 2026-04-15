import chromadb
from src.embed import get_embedding
import numpy as np


def cosine_similarity(a, b):
    return np.dot(a, b) / (np.linalg.norm(a) * np.linalg.norm(b))


def retrieve_chunks(query, top_k=6, final_k=3):
    client = chromadb.PersistentClient(path="vectordb")
    collection = client.get_or_create_collection(name="rag_collection")

    query_embedding = get_embedding(query)

    results = collection.query(
        query_embeddings=[query_embedding],
        n_results=top_k,
        include=["documents", "embeddings"]   # 🔥 IMPORTANT
    )

    docs = results["documents"][0]
    embeddings = results["embeddings"][0]

    # 🔥 Re-ranking
    scored = []
    for doc, emb in zip(docs, embeddings):
        score = cosine_similarity(query_embedding, emb)
        scored.append((doc, score))

    # sort by score (highest first)
    scored.sort(key=lambda x: x[1], reverse=True)

    # take top final_k
    reranked_docs = [doc for doc, _ in scored[:final_k]]

    return reranked_docs
