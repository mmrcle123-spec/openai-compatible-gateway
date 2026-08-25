# Python — OpenAI SDK

Works with the standard `openai` package. Only `base_url` and `api_key` change.

```python
import os
from openai import OpenAI

client = OpenAI(
    base_url="https://api.airai.cc/v1",
    api_key=os.environ.get("OPENAI_API_KEY"),   # your gateway key
)

# Chat
resp = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[{"role": "user", "content": "Hello from the gateway."}],
)
print(resp.choices[0].message.content)

# Claude via the same OpenAI-compatible route
resp = client.chat.completions.create(
    model="claude-3-5-sonnet",
    messages=[{"role": "user", "content": "Explain base_url swap in one line."}],
)
print(resp.choices[0].message.content)

# Image
img = client.images.generate(
    model="flux-1",
    prompt="a minimalist workspace, soft light",
    size="1024x1024",
)
print(img.data[0].url)

# Embeddings
emb = client.embeddings.create(
    model="text-embedding-3-small",
    input="settlement-agnostic API rail",
)
print(len(emb.data[0].embedding))
```

Environment:

```bash
export OPENAI_API_KEY="<your-gateway-key>"
export OPENAI_BASE_URL="https://api.airai.cc/v1"
```
