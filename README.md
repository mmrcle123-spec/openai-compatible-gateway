# Multi-Protocol LLM API Gateway — OpenAI / Claude / Gemini Native — 80% Cheaper, 468+ Models

> ## 🔥 Cut your AI API bill by up to **80%** &nbsp;·&nbsp; 🧩 **468+ models, multi-protocol** &nbsp;·&nbsp; 💸 USDT, no card, no KYC
>
> A **multi-protocol** LLM gateway. It speaks **OpenAI, Anthropic Claude, and
> Google Gemini native formats** — not just OpenAI chat. One account, every
> dialect. **GPT · Claude · DeepSeek · Gemini · image · audio · embedding ·
> video · music** behind a single interface.

**TL;DR — why teams point their stack here**

- 💰 **Up to 80% cheaper** than official list price (up to ~90% on high-volume tiers)
- 🧩 **468+ models, one account** — stop wiring a different provider per route
- ⚡ **Multi-protocol native** — OpenAI, Anthropic Claude & Gemini native formats, plus Replicate / Fal / Suno shims
- 🤖 **Full capability coverage** — chat, streaming, vision, function calling, embeddings, audio (ASR + TTS), image & video generation, realtime websocket, reasoning models
- 🌍 **USDT (TRC-20)** by default, **no KYC, no monthly fee**, pay as you go
- 🧰 **Drop-in for 15+ clients** — ChatBox, CherryStudio, Cursor, Cline, Codex, aider, LobeChat, Dify, N8N, NextChat, LangChain, LlamaIndex, and more

This guide is written for **operators who already run an app, gateway, agent, or
front-end**. It covers how to point your stack at this endpoint, the supported
protocols, the model families, every client we've tested, runnable SDK
examples, pricing, and payment. No marketing fluff — copy, paste, ship.

---

## Table of contents

- [Supported API formats](#supported-api-formats)
- [Capability matrix](#capability-matrix)
- [Quick start (all three protocols)](#quick-start-all-three-protocols)
- [Model families](#model-families)
- [Clients & tools we've tested](#clients--tools-weve-tested)
- [Examples index](#examples-index)
- [Pricing & tiers](#pricing--tiers)
- [Payment & settlement](#payment--settlement)
- [FAQ](#faq)

---

## Supported API formats

This gateway is **not** "OpenAI-only with a translation layer". It exposes
**native** endpoints for the three major SDKs, so you use each vendor's own
client library unchanged.

| Protocol | Base URL | How you call it | Notes |
|---|---|---|---|
| **OpenAI** | `https://api.airai.cc/v1` | Set `base_url` on the OpenAI SDK | chat, streaming (SSE), vision, function calling, embeddings, audio, images, realtime |
| **Anthropic Claude** | `https://api.airai.cc` (root) | Set `ANTHROPIC_BASE_URL` for the Anthropic SDK / Claude Code | Native `messages` API, streaming, tool use |
| **Google Gemini** | `https://api.airai.cc` (root) | Set `GOOGLE_GEMINI_BASE_URL` for the Gemini CLI / SDK | Native Gemini generateContent |
| **Replicate** | `https://api.airai.cc/replicate` | Replicate-compatible client | Many open-weight models behind one shim |
| **Fal.ai** | `https://api.airai.cc/fal-ai/{model}` | Fal-compatible client | Image / video models behind one shim |
| **Suno** | `https://api.airai.cc/suno/...` | Suno-compatible client | Music generation |

> **Why root domain for Claude & Gemini?** The Anthropic and Gemini SDKs send
> requests to the provider root (e.g. `https://api.anthropic.com`), not to a
> `/v1` sub-path. Point `ANTHROPIC_BASE_URL` / `GOOGLE_GEMINI_BASE_URL` at
> `https://api.airai.cc` and the gateway serves the native route. The OpenAI
> SDK, by contrast, expects `/v1`, so use `https://api.airai.cc/v1`.

---

## Capability matrix

| Capability | Endpoint family | Example models |
|---|---|---|
| Chat (text) | OpenAI `/chat/completions`, Claude native, Gemini native | gpt-4o, gpt-4o-mini, claude-3.5-sonnet, claude-opus, deepseek-chat, gemini-1.5-pro |
| Streaming (SSE) | same as chat, `stream: true` | all chat models |
| Vision (image in) | chat with `image_url` content | gpt-4o, claude-3.5-sonnet, gemini-1.5-pro |
| Reasoning (o-series) | chat with `reasoning_effort` | o1, o3, o4-mini (`low` / `medium` / `high`) |
| Function calling / tool use | chat `tools` / Claude `tools` | all capable chat models |
| Embeddings | OpenAI `/embeddings` | text-embedding-3-small, text-embedding-3-large, text-embedding-ada-002 |
| Audio transcription (ASR) | OpenAI `/audio/transcriptions` | whisper-1 |
| Text-to-speech (TTS) | OpenAI `/audio/speech` | tts-1, 6 built-in voices |
| Image generation | OpenAI `/images/generations` | DALL·E 3, gpt-image-1, FLUX, Seedream, imagen-4, qwen-image |
| Image editing | OpenAI `/images/edits` | gpt-image-1 (≤4 MB inputs) |
| Realtime (websocket) | OpenAI realtime | gpt-4o-realtime |
| Video generation (async) | async task API | Kling, Luma, MiniMax, Jimeng, Fal |
| Music generation | Suno shim | Suno |
| Batch / agent loops | chat + function calling | any capable model |

---

## Quick start (all three protocols)

### 1. OpenAI SDK (Python)

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",          # from signup / TG @mmrcle
)

r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role": "user", "content": "Hello"}],
)
print(r.choices[0].message.content)
```

### 2. Anthropic Claude (native)

```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
```

```python
import anthropic
client = anthropic.Anthropic()   # picks up env vars automatically
r = client.messages.create(
    model="claude-3.5-sonnet",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}],
)
print(r.content[0].text)
```

Claude Code users: `claude --set-env ANTHROPIC_BASE_URL=https://api.airai.cc`
then sign in with your gateway key.

### 3. Google Gemini (native)

```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GOOGLE_API_KEY="YOUR_KEY"
```

```bash
# Gemini CLI
export GEMINI_API_KEY="YOUR_KEY"
gemini
# inside the CLI it calls $GOOGLE_GEMINI_BASE_URL natively
```

### 4. Raw curl (OpenAI format)

```bash
curl https://api.airai.cc/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_KEY" \
  -d '{
    "model": "gpt-4o",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

See [`examples/curl.md`](examples/curl.md) for streaming, vision, function
calling, and image examples.

---

## Model families

The full list is on the status page; the major families routed through this
gateway:

- **GPT** — gpt-4o, gpt-4o-mini, gpt-4.1, o1 / o3 / o4-mini (reasoning)
- **Claude** — claude-3.5-sonnet, claude-3.7-sonnet, claude-opus-4, claude-haiku
- **DeepSeek** — deepseek-chat, deepseek-reasoner
- **Gemini** — gemini-1.5-pro, gemini-2.0-flash, gemini-2.5-pro
- **Image** — DALL·E 3, gpt-image-1, FLUX.1, Seedream, imagen-4, qwen-image
- **Audio** — whisper-1 (ASR), tts-1 (TTS, 6 voices)
- **Embeddings** — text-embedding-3-small / -3-large, text-embedding-ada-002
- **Realtime** — gpt-4o-realtime (websocket)
- **Video** — Kling, Luma, MiniMax, Jimeng, Fal (async)
- **Music** — Suno

Full reference: [`models.md`](models.md).

---

## Clients & tools we've tested

Every client below was verified against this gateway. Config is always the same
idea: point its `base_url` (OpenAI-style) or its provider env var (Claude /
Gemini) at the addresses above.

| Client / tool | Protocol used | Where to configure |
|---|---|---|
| **ChatBox** | OpenAI | custom API + base URL |
| **CherryStudio** | OpenAI + Claude MCP | model settings; MCP server URL |
| **Cursor** | OpenAI (BYOK) | `new-` model prefix trick |
| **Cline** | OpenAI | OpenAI-compatible base URL |
| **Codex** | OpenAI | `config.toml` (3 platforms) |
| **aider** | OpenAI | `--openai-api-base` |
| **Gemini CLI** | Gemini native | `GOOGLE_GEMINI_BASE_URL` |
| **Claude Code** | Anthropic native | `ANTHROPIC_BASE_URL` |
| **LobeChat** | OpenAI | provider settings |
| **Dify** | OpenAI | model provider config |
| **N8N** | OpenAI | HTTP / OpenAI node |
| **NextChat** | OpenAI | `BASE_URL` env |
| **Immersive Translate** | OpenAI | translation API base |
| **LangChain** | OpenAI / Anthropic / Gemini | chat model `base_url` |
| **LlamaIndex** | OpenAI | `OPENAI_BASE_URL` |

Full walkthroughs: [`examples/frontends.md`](examples/frontends.md).

---

## Examples index

Runnable, copy-paste snippets:

- [`examples/curl.md`](examples/curl.md) — chat, SSE streaming, vision, function calling, images
- [`examples/python.md`](examples/python.md) — base, multi-turn, streaming, vision, function calling, embeddings, whisper, TTS, DALL·E, gpt-image-1
- [`examples/node.md`](examples/node.md) — chat, streaming, whisper
- [`examples/claude-code.md`](examples/claude-code.md) — native Anthropic setup + SDK sample
- [`examples/gemini-cli.md`](examples/gemini-cli.md) — native Gemini setup + SDK sample
- [`examples/frontends.md`](examples/frontends.md) — 15 clients, step by step
- [`examples/images.md`](examples/images.md) — DALL·E 3, gpt-image-1, FLUX, editing
- [`examples/audio.md`](examples/audio.md) — whisper transcription + TTS
- [`examples/embeddings.md`](examples/embeddings.md) — 3-small / 3-large / ada
- [`examples/realtime.md`](examples/realtime.md) — websocket realtime
- [`examples/async-tasks.md`](examples/async-tasks.md) — video / music / Replicate / Fal + status codes + callback

---

## Pricing & tiers

Three tiers, all priced as a **multiplier of the official list price** (not a
made-up number). The more you commit, the deeper the discount.

| Tier | Multiplier | vs official | Best for |
|---|---|---|---|
| **Standard** | 0.3× | ~70% off | Pay-as-you-go, developers |
| **Pro** | 0.15× | ~85% off | Teams with steady volume |
| **Wholesale** | 0.09× | ~91% off | High-volume / resellers |

A **group fee-rate** model applies: heavier routes (reasoning, video) carry a
small premium over the base multiplier, lighter routes (chat, embeddings) sit
at or below it. Exact per-model rates are shown on the pricing page after
login. Full detail: [`PRICING.md`](PRICING.md).

---

## Payment & settlement

- **Settlement rail:** USDT (**TRC-20**) by default. No card, no KYC, no
  monthly fee.
- **Trial:** new accounts get a small free credit so you can test before
  funding.
- **Funding:** send USDT to the address shown after login; balance is
  reflected in real time.
- **Other cryptos** (e.g. BTC) are available for **large / wholesale**
  clients only.
- **Region & availability:** covered countries/regions follow the published
  Terms of Service. Service is not guaranteed where sanctions or local law
  prohibit it — screen against the sanctions list before use.

---

## FAQ

**Do I need to rewrite my code?**
No. If your client already speaks OpenAI / Anthropic / Gemini, you only change
the base URL (or the provider env var). Nothing else.

**Is this just an OpenAI proxy?**
No. It exposes native Anthropic and Gemini endpoints, so you can keep using
each vendor's official SDK. It also shims Replicate / Fal / Suno.

**Which models can I call from one account?**
All 468+ routed models — GPT, Claude, DeepSeek, Gemini, image, audio,
embeddings, realtime, video, music — behind the same key.

**How do I get a key?**
Sign up on the site, or reach out on TG `@mmrcle`. Trial credit is auto-added.

**What about rate limits / concurrency?**
Limits scale with tier and balance. Check the dashboard for live quotas.

**Is there a status page?**
Yes — model availability and incident status are published separately.

---

## License

This documentation is provided as-is for integrators. The gateway service is
governed by its own Terms of Service.
