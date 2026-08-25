# Embedding models

Turn text into vectors for RAG, semantic search, clustering, classification.
Called through the **OpenAI-compatible** route: base URL `https://api.airai.cc/v1`,
endpoint `/embeddings`.

## Available models

| Model | Dimension |
|---|---|
| `text-embedding-3-small` | 1536 |
| `text-embedding-3-large` | 3072 |
| `text-embedding-ada-002` | 1536 |

## Generate (Python)

```python
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")

# single string
r = client.embeddings.create(model="text-embedding-3-small", input="hello world")
print(len(r.data[0].embedding))            # 1536

# batch
r = client.embeddings.create(
    model="text-embedding-3-small",
    input=["hello", "world", "foo"],
)
print([len(d.embedding) for d in r.data])  # [1536, 1536, 1536]
```

## Node.js

```js
import OpenAI from "openai";
const client = new OpenAI({ baseURL: "https://api.airai.cc/v1", apiKey: "YOUR_KEY" });
const r = await client.embeddings.create({
  model: "text-embedding-3-small", input: "hello world",
});
console.log(r.data[0].embedding.length);  // 1536
```

## Tips

- Pass a string **or** a list of strings in `input` (batching is cheaper).
- `text-embedding-3-small` is the best default — cheap and accurate enough
  for most RAG/search.
- Normalize vectors (L2) before cosine similarity in your own store if needed.

## Group fee-rate

Embeddings are billed under the **embedding** group (see
[PRICING](../PRICING.md)) — typically at or below the base multiplier, the
cheapest workload on the gateway.

## Related

- Used heavily in [LlamaIndex](../examples/frontends.md#15-llamaindex) and
  [LangChain](../examples/frontends.md#14-langchain) RAG pipelines.
- Back to [model index](../models.md)
