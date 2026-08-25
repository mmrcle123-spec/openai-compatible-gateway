# OpenAI-Compatible API Gateway — Integration Guide

A drop-in, OpenAI-compatible endpoint. Swap your `base_url`, keep your existing
code. A few hundred models sit behind one interface — OpenAI, Claude, DeepSeek,
image, and embedding — so you don't manage multiple providers per route.

This guide is written for **operators who already run an app, gateway, or
front-end that speaks the OpenAI API** (Python/Node SDKs, Cline, Continue,
Cursor BYOK, LibreChat, OpenWebUI, SillyTavern, etc.). It covers how to point
your stack at this endpoint, how to get a test key, models, pricing, and
settlement.

## 🌐 This guide in other languages

- [Español](intro/es.md)
- [Português](intro/pt.md)
- [Türkçe](intro/tr.md)
- [Русский](intro/ru.md)
- [العربية](intro/ar.md)
- [Bahasa Indonesia](intro/id.md)
- [Français](intro/fr.md)
- [Tiếng Việt](intro/vi.md)

The main documentation above is in English. Each link is a detailed
introduction to this gateway written in that language.

---

## Why this exists (neutral framing)

Most AI apps are built around a card / fiat billing stack. That stack does not
serve every segment — some users have no card, some settle in crypto by default,
and some regions aren't covered by mainstream providers' terms of service.

This endpoint is a **settlement-agnostic rail**: USDT (crypto) by default, no
card, no KYC. Same OpenAI-compatible interface you already use. It is meant to
sit *alongside* your existing payment methods as an additional route — not
replace them.

---

## Quick start

Set one variable and your existing OpenAI-SDK code works as-is:

```python
OPENAI_BASE_URL = "https://api.airai.cc/v1"
OPENAI_API_KEY  = "<your-key>"   # get from signup or TG @mmrcle
```

- Python: see [`examples/python.md`](examples/python.md)
- Node: see [`examples/node.md`](examples/node.md)
- Raw curl: see [`examples/curl.md`](examples/curl.md)
- Claude Code / Anthropic-protocol note: see [`examples/claude-code.md`](examples/claude-code.md)
- LibreChat / OpenWebUI / SillyTavern config: see [`examples/frontends.md`](examples/frontends.md)

---

## Get a test key

Two paths:

1. **Sign up at the gateway** → trial credits are issued on registration, no
   card required. Use them to validate latency, model coverage, and output
   quality before any commitment.
2. **Reach out on TG:** `@mmrcle` — for white-label / upstream-supply
   discussions, test keys, or integration questions.

---

## Models

A few hundred models across families, including:

- **OpenAI:** GPT-4o / 4o-mini, o-series reasoning, embeddings
- **Claude:** Opus / Sonnet / Haiku (via OpenAI-compatible route)
- **DeepSeek:** V3 / R1 and distilled variants
- **Image:** SD, Flux, and common western image APIs
- **Embedding / rerank** where available

Exact live list is returned by `/v1/models` against the endpoint.

---

## Pricing

Transparent tiers benchmarked against official list price, landing roughly in
the **~0.03–0.3 of official list** range depending on tier and model family.
Full breakdown: [`PRICING.md`](PRICING.md).

No monthly fee. Pay as you go. Settlement in USDT.

---

## Region & availability

Availability is **per the gateway's terms of service**. No geo claim is made
here; check the terms for your operating region before routing production
traffic.

---

## Settlement

- **USDT** (TRC-20) by default — no card, no KYC.
- Other cryptos considered for large / wholesale accounts.

---

## FAQ

**Is this a replacement for my current provider?**
No. It is an additional OpenAI-compatible route you can call for the segments
your existing stack doesn't serve (no-card users, crypto-native settlement,
regions outside your current provider's terms).

**Do I need to rewrite my code?**
If your client speaks the OpenAI API, you only change `base_url` and `api_key`.
Nothing else.

**How do I verify it before paying?**
Sign up → trial credits → run your own workloads against the endpoint.

---

*Technical integration guide. Operated independently; this document describes
the endpoint and how to connect, not a sales pitch.*
