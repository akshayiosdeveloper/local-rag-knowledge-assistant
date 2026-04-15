
def load_document(file_path):
    """
    Loads text from a file
    """
    with open(file_path, "r", encoding="utf-8") as file:
        text = file.read()

    return text


def clean_text(text):
    """
    Basic cleaning of text
    """
    text = text.replace("\n", " ")
    text = text.strip()

    return text


def chunk_text(text, chunk_size=200, overlap=50):
    chunks = []
    start = 0
    text_length = len(text)

    while start < text_length:
        end = start + chunk_size

        # Avoid cutting in middle of sentence
        if end < text_length:
            while end < text_length and text[end] != ".":
                end += 1

        chunk = text[start:end].strip()
        chunks.append(chunk)

        start = end - overlap

    return chunks


def process_document(file_path):
    text = load_document(file_path)
    cleaned_text = clean_text(text)
    chunks = chunk_text(cleaned_text)

    return chunks
