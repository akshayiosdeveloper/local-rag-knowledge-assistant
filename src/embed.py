import ollama


def get_embedding(text):
    """
    Convert a single text into embedding
    """
    response = ollama.embeddings(
        model="nomic-embed-text:v1.5",
        prompt=text
    )

    return response["embedding"]


def embed_chunks(chunks):
    """
    Convert list of chunks into embeddings
    """
    embeddings = []

    for chunk in chunks:
        vector = get_embedding(chunk)
        embeddings.append(vector)

    return embeddings
