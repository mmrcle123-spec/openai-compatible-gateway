# Embeddings

Base: `https://api.airai.cc/v1`, endpoint `/embeddings`. See also the
[model family page](../models/embeddings.md).

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

# batch — cheaper than N single calls
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
  model: "text-embedding-3-small", input: ["hello", "world"],
});
console.log(r.data[0].embedding.length);  // 1536
```

## Input handling

- `input` accepts a **string** or an **array of strings** (batch).
- Very long inputs are truncated to the model's max token window — chunk
  documents before embedding for RAG.
- Output is a fixed-dimension float vector; normalize (L2) before cosine
  similarity if your vector store expects it.

## What to use it for

- RAG retrieval · semantic search · clustering · classification · dedupe.
- Pairs naturally with [LlamaIndex](../examples/frontends.md#15-llamaindex)
  and [LangChain](../examples/frontends.md#14-langchain) pipelines.

## Billing

Embeddings are billed under the **embedding** group fee-rate (see
[`PRICING.md`](../PRICING.md)) — typically at or below the base multiplier,
the cheapest workload on the gateway.
