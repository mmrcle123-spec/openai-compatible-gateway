# GPT models

OpenAI's GPT family — general chat, vision, and reasoning. Called through the
**OpenAI-compatible** route: base URL `https://api.airai.cc/v1`. These are the
default models for most clients and SDKs.

## Available models

| Model | Context | Vision | Notes |
|---|---|---|---|
| `gpt-4o` | 128k | yes | Flagship multimodal |
| `gpt-4o-mini` | 128k | yes | Cheap, fast, great for high-volume |
| `gpt-4.1` | 1M | yes | Long-context, coding-strong |
| `gpt-4.1-mini` | 1M | yes | Cheaper long-context |
| `gpt-4.5-preview` | 128k | yes | Larger, slower, higher quality |

## Reasoning models (o-series)

| Model | Notes |
|---|---|
| `o1` | Strongest reasoning, slower |
| `o3` | Balanced reasoning |
| `o4-mini` | Fast reasoning, best price/performance |

Reasoning models accept a `reasoning_effort` field:

```json
{ "model": "o4-mini", "reasoning_effort": "medium",
  "messages": [{"role":"user","content":"prove the sqrt(2) is irrational"}] }
```

Valid values: `low` | `medium` | `high`. Higher effort = more tokens spent
thinking, better answers on hard problems.

## Minimal call

```bash
curl https://api.airai.cc/v1/chat/completions \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"gpt-4o","messages":[{"role":"user","content":"hi"}]}'
```

## Vision example

```python
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role":"user","content":[
        {"type":"text","text":"what is in this image?"},
        {"type":"image_url","image_url":{"url":"https://example.com/cat.png"}},
    ]}],
)
print(r.choices[0].message.content)
```

## Group fee-rate

GPT chat models are billed under the **base / chat** group (see
[PRICING](../PRICING.md)) — the lowest multiplier tier. Reasoning models
(o-series) route through the **reasoning** group, which carries a modest
premium because of the extra thinking tokens.

## Related

- [Claude](../models/claude.md) · [DeepSeek](../models/deepseek.md) ·
  [Gemini](../models/gemini.md)
- [Image generation](../models/image.md) · [Audio](../models/audio.md)
- Back to [model index](../models.md)
