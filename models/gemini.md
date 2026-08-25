# Gemini models

Google's Gemini family, called through the **native Gemini** route (root
domain, not `/v1`):

```
GOOGLE_GEMINI_BASE_URL=https://api.airai.cc
GEMINI_API_KEY=YOUR_KEY
```

The native Gemini protocol is used — thinking models and multimodal input
work as against Google's own endpoint.

## Available models

| Model | Notes |
|---|---|
| `gemini-2.5-pro` | Flagship, strongest reasoning + long context |
| `gemini-2.5-flash` | Fast, cheap, reasoning-capable |
| `gemini-2.0-flash` | Previous-gen flash |
| `gemini-1.5-pro` | Long-context (1M+ tokens) |

## CLI

```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"
gemini
```

See [`examples/gemini-cli.md`](../examples/gemini-cli.md).

## Python (google-genai)

```python
from google import genai
client = genai.Client(
    api_base="https://api.airai.cc",   # native root
    api_key="YOUR_KEY",
)
r = client.models.generate_content(
    model="gemini-2.5-flash",
    contents="Summarize transformers in one sentence.",
)
print(r.text)
```

## Thinking / reasoning

Gemini 2.5 thinking models accept a thinking-budget — pass it as you would
against Google; the gateway forwards it unchanged.

## Group fee-rate

Gemini chat is billed under the **base / chat** group (see
[PRICING](../PRICING.md)). Heavy long-context / thinking workloads may route
through the **reasoning** group.

## Related

- [GPT](../models/gpt.md) · [Claude](../models/claude.md) ·
  [DeepSeek](../models/deepseek.md)
- Back to [model index](../models.md)
