# DeepSeek models

DeepSeek's open-weight models — excellent price/performance, popular for
coding and high-volume chat. Called through the **OpenAI-compatible** route:
base URL `https://api.airai.cc/v1`.

## Available models

| Model | Notes |
|---|---|
| `deepseek-chat` | General chat, coding-strong, very cheap |
| `deepseek-reasoner` | Reasoning model (think-before-answer) |

## Chat example

```python
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")
r = client.chat.completions.create(
    model="deepseek-chat",
    messages=[{"role":"user","content":"write a quicksort in Go"}],
)
print(r.choices[0].message.content)
```

## Reasoner

`deepseek-reasoner` returns its chain-of-thought in a `reasoning_content`
field (OpenAI-compatible extension). Treat the final `content` as the answer.

```json
{
  "model": "deepseek-reasoner",
  "messages": [{"role":"user","content":"solve x^2-5x+6=0"}]
}
```

## Why use it

- **Cost**: among the cheapest per-token models on the gateway.
- **Coding**: `deepseek-chat` scores close to much larger proprietary models
  on many coding benchmarks.
- **Drop-in**: works with every OpenAI-compatible client (Cursor, Cline,
  OpenWebUI, etc.) by just changing the model name.

## Group fee-rate

DeepSeek chat is billed under the **base / chat** group (see
[PRICING](../PRICING.md)) — typically the lowest multiplier. The reasoner
routes through the **reasoning** group.

## Related

- [GPT](../models/gpt.md) · [Claude](../models/claude.md) ·
  [Gemini](../models/gemini.md)
- Back to [model index](../models.md)
