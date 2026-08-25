# Gemini CLI / Google-native — works directly

This gateway also speaks the **Google Gemini native format**, so the Gemini
CLI and the Google GenAI SDK can point at it directly — **no shim needed**.

> **Base URL = root domain.** The Gemini SDK sends requests to the provider
> root (e.g. `https://generativelanguage.googleapis.com`), **not** a `/v1`
> sub-path. Point `GOOGLE_GEMINI_BASE_URL` at `https://api.airai.cc` (root).

## Gemini CLI (native)

```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"        # gateway key
gemini
```

Inside the CLI it calls `$GOOGLE_GEMINI_BASE_URL` natively — no code change.

## Google GenAI SDK (Python)

```python
from google import genai

client = genai.Client(
    api_key="YOUR_KEY",
    http_options={"base_url": "https://api.airai.cc"},   # root domain
)

r = client.models.generate_content(
    model="gemini-1.5-pro",
    contents="Explain Gemini native access in one line.",
)
print(r.text)
```

## Google GenAI SDK (Node)

```javascript
import { GoogleGenAI } from "@google/genai";

const ai = new GoogleGenAI({
  apiKey: "YOUR_KEY",
  baseUrl: "https://api.airai.cc",      // root domain
});

const r = await ai.models.generateContent({
  model: "gemini-1.5-pro",
  contents: "Hi",
});
console.log(r.text);
```

## OpenAI-SDK clients (also fine)

Prefer the OpenAI shape? Point the OpenAI SDK at `https://api.airai.cc/v1` and
use `model: "gemini-*"` — it routes to the same Gemini models.

## TL;DR

- **Gemini CLI / Google SDK** → point `GOOGLE_GEMINI_BASE_URL` (or `baseUrl`)
  at `https://api.airai.cc` (root). Works directly.
- **OpenAI SDK** → `https://api.airai.cc/v1`, `model: "gemini-*"`. Also works.
- Same models, your choice of dialect.
