import chromadb


def store_in_chroma(chunks, embeddings, metadatas):
    client = chromadb.PersistentClient(path="vectordb")

    # Clean DB for development
    try:
        client.delete_collection(name="rag_collection")
    except:
        pass

    collection = client.get_or_create_collection(name="rag_collection")

    ids = []
    documents = []
    vectors = []

    for i, chunk in enumerate(chunks):
        ids.append(f"chunk_{i}")
        documents.append(chunk)          # ✅ TEXT
        vectors.append(embeddings[i])    # ✅ VECTOR

    collection.add(
        ids=ids,
        documents=documents,
        embeddings=vectors,
        metadatas=metadatas
    )

    return collection
