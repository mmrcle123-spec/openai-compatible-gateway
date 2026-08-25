# Embeddings

Base: `https://api.airai.cc/v1`. All OpenAI-compatible embedding models.

## Generate embeddings (Python)

```python
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")

# single string
r = client.embeddings.create(model="text-embedding-3-small", input="hello world")
print(len(r.data[0].embedding))      # dimension, e.g. 1536

# batch
r = client.embeddings.create(
    model="text-embedding-3-small",
    input=["hello", "world", "foo"],
)
print([len(d.embedding) for d in r.data])
```

## Available embedding models

| Model | Dimension |
|---|---|
| `text-embedding-3-small` | 1536 |
| `text-embedding-3-large` | 3072 |
| `text-embedding-ada-002` | 1536 |

## Notes

- Pass a string or a list of strings in `input`.
- Embeddings are cheap and billed under the **embedding** group fee-rate
  (see `PRICING.md`) — typically at or below the base tier multiplier.
- Use for RAG, semantic search, clustering, and classification.
