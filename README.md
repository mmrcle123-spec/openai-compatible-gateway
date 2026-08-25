# OpenAI-Compatible LLM API Gateway — Save up to 80%, 468+ Models, One Endpoint

> ## 🔥 Cut your AI API bill by up to **80%** &nbsp;·&nbsp; 🧩 **468+ models behind ONE endpoint** &nbsp;·&nbsp; 💸 USDT, no card, no KYC
>
> A drop-in, OpenAI-compatible gateway. Swap your `base_url`, keep your code.
> **GPT · Claude · DeepSeek · image · embedding** — all behind one interface.

**TL;DR — why teams point their stack here**

- 💰 **Up to 80% cheaper** than official list price (up to 90% on high-volume tiers)
- 🧩 **468+ models, one endpoint** — stop wiring a different provider per route
- ⚡ **Drop-in OpenAI compatibility** — change `base_url` only, zero code rewrite
- 🌍 **USDT (TRC-20)** by default, **no KYC, no monthly fee**, pay as you go

This guide is written for **operators who already run an app, gateway, or
front-end that speaks the OpenAI API** (Python/Node SDKs, Cline, Continue,
Cursor BYOK, LibreChat, OpenWebUI, SillyTavern, etc.). It covers how to point
your stack at this endpoint, get a test key, see the models, pricing, and
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

**The two things people actually switch for:**

1. **Cost.** Same models, a fraction of the bill — see [Pricing](#pricing).
2. **Coverage.** Hundreds of models behind one OpenAI-compatible URL — see
   [Models](#models).

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

## Models — 🧩 468+ models, one endpoint

**One OpenAI-compatible URL fronts 468+ models across 20+ providers.** You stop
managing per-route provider wiring and just call the model you want:

- **OpenAI:** GPT-4o / 4o-mini, o-series reasoning, embeddings
- **Claude:** Opus / Sonnet / Haiku (via OpenAI-compatible route)
- **DeepSeek:** V3 / R1 and distilled variants
- **Image:** SD, Flux, and common western image APIs
- **Embedding / rerank** where available

Exact live list is returned by `/v1/models` against the endpoint.

---

## Pricing — 💰 up to 80% cheaper than official list

Transparent tiers benchmarked against official list price. The headline number:
**you pay as little as ~20% of official list — i.e. up to an 80% saving** (and
up to 90% on high-volume tiers).

| Tier | vs official list | You pay | Who it fits |
|---|---|---|---|
| **Standard** | **~70% off** | ~0.3× | General usage, image, embeddings |
| **Pro** | **~85% off** | ~0.15× | Heavy Claude / coding workloads |
| **Wholesale** | **~91% off** | ~0.09× | High-volume operators, white-label upstream |

- **No monthly fee.** Pay as you go.
- **Settlement:** USDT (TRC-20) by default. Other cryptos considered for
  large / wholesale accounts.
- Trial credits are issued on signup — validate before any spend.

Full breakdown: [`PRICING.md`](PRICING.md). Exact per-model rates are returned
by the gateway's pricing endpoint and shown in the dashboard. Rates move with
upstream cost; the table above is the operating band, not a fixed quote.

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
