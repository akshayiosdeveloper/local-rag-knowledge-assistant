import ollama


def generate_answer(query, context_chunks):
    context = "\n\n".join(context_chunks)

    prompt = f"""
You are an expert AI assistant.

Rules:
1. Answer ONLY using the provided context.
2. Do NOT use your own knowledge.
3. If the answer is not in the context, say:
"I don't have enough information to answer this."
4. Be concise and clear.
5. Do not repeat the question.

Context:
{context}

Question:
{query}

Answer:
"""

    response = ollama.chat(
        model="llama3.1:8b-instruct-q4_K_M",
        messages=[
            {"role": "user", "content": prompt}
        ]
    )

    return response["message"]["content"]
