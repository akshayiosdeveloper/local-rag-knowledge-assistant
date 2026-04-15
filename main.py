from src.ingest import process_document
from src.embed import embed_chunks
from src.store import store_in_chroma
from src.retrieve import retrieve_chunks
from src.generate import generate_answer
import os

# file_path = "data/sample.txt"
all_chunks = []
all_metadata = []

data_folder = "data"
for file_name in os.listdir(data_folder):
    file_path = os.path.join(data_folder, file_name)
    # Step 1: Chunking
    chunks = process_document(file_path)
    all_chunks.extend(chunks)
    for _ in chunks:
        all_metadata.append({
            "source": file_name
        })
# Step 2: Embedding
embeddings = embed_chunks(all_chunks)
# print("\nChunks:\n")
# # Step 1: Chunking
# chunks = process_document(file_path)
# print("\nChunks:\n")
# for i, chunk in enumerate(all_chunks):
#     print(f"\nChunk {i+1}:")
#     print(chunk)


# Step 3: Store
# store_in_chroma(chunks, embeddings)
# store
store_in_chroma(all_chunks, embeddings, all_metadata)
print("\nData stored in Chroma DB successfully!")

# Step 4: Retrieval
query = "What is finance?"

results = retrieve_chunks(query)

print("\nRetrieved Chunks:")
for i, res in enumerate(results):
    print(f"\nResult {i+1}:")
    print(res)

print("\n")
print("Question asked: ", query)
print("\n")

# step 5 :
answer = generate_answer(query, results)

print("\nFinal Answer:\n")
print(answer)

print("\nSources:\n")
for i, chunk in enumerate(results):
    print(f"\nSource {i+1}:")
    print(chunk)
