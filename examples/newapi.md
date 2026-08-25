# Using this gateway as a channel in NewAPI (and One API / VoAPI)

NewAPI, One API, VoAPI and similar self-hosted panels manage AI API keys and
expose them to your apps behind their own interface. This gateway is
**OpenAI-compatible**, so it slots in as a normal OpenAI-type channel — you do
not need any special plugin.

## NewAPI (`Calcium-Ion/new-api`)

1. In NewAPI, go to **渠道 (Channels) → 新建渠道 (Add Channel)**.
2. Set the fields:

   | Field | Value |
   |---|---|
   | 类型 (Type) | `OpenAI` (or `Custom`) |
   | 名称 (Name) | anything, e.g. `AirAi` |
   | 代理 (Base URL / Host) | `https://api.airai.cc/v1` |
   | 密钥 (Key) | your gateway key (from signup or TG `@mmrcle`) |
   | 模型 (Models) | leave default / full list, or map specific ones |

3. Save, then click **测试 (Test)** — it should return the model list.
4. That's it. The panel now routes OpenAI-API traffic for all 468+ models
   through this gateway.

> The gateway speaks the OpenAI API shape, so any panel that can add an
> OpenAI-compatible upstream works identically (One API, VoAPI, etc.).

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
