# Using this gateway as a channel in NewAPI (and One API / VoAPI)

NewAPI, One API, VoAPI and similar self-hosted panels manage AI API keys and
expose them to your apps behind their own interface. This gateway is
**multi-protocol** — it speaks OpenAI, Anthropic Claude, and Gemini natively —
so it slots in as a **native channel per format**, no special plugin.

## NewAPI (`Calcium-Ion/new-api`)

1. In NewAPI, go to **渠道 (Channels) → 新建渠道 (Add Channel)**.
2. Add **one channel per native format**:

   | Format | 类型 (Type) | 代理 (Base URL) |
   |---|---|---|
   | OpenAI | `OpenAI` | `https://api.airai.cc/v1` |
   | Anthropic Claude | `Anthropic` | `https://api.airai.cc/v1/anthropic` *(confirm path)* |
   | Gemini | `Gemini` | `https://api.airai.cc/v1/gemini` *(confirm path)* |

   For each: 名称 (Name) = e.g. `AirAi-OpenAI`, 密钥 (Key) = your gateway key
   (from signup or TG `@mmrcle`).

3. Save, then click **测试 (Test)** — it should return the model list.
4. That's it. The panel now routes traffic for all 468+ models through this
   gateway in every native format.

> Because the gateway speaks the native shape of each provider, any panel that
> can add OpenAI / Anthropic / Gemini upstreams works identically (One API,
> VoAPI, etc.).

## Why do this

- **One place for keys** — your apps talk to the panel, the panel talks to this
  gateway. No per-app key juggling.
- **All models, one config** — GPT / Claude / DeepSeek / image / embedding sit
  behind the single `https://api.airai.cc/v1` URL.
- **Cheaper settlement** — the gateway settles in USDT, no KYC, no card; the
  panel handles your internal quota on top.

## Get a key

Sign up at the gateway (trial credits on registration, no card) or reach out on
TG: `@mmrcle`.
