# Pricing & Tiers

All prices are expressed as a **multiplier of the official provider list
price** — not arbitrary numbers. The deeper your commitment, the lower the
multiplier.

## Tiers at a glance

| Tier | Multiplier | Discount vs official | Best for |
|---|---|---|---|
| **Standard** | `0.3×` | ~70% off | Pay-as-you-go developers, trial users |
| **Pro** | `0.15×` | ~85% off | Teams with steady monthly volume |
| **Wholesale** | `0.09×` | ~91% off | High-volume apps, resellers, aggregators |

> Example: a model billed at **$10 / 1M tokens** by the official provider
> costs roughly **$3** on Standard, **$1.5** on Pro, and **$0.9** on Wholesale
> through this gateway.

## How the "group fee-rate" model works

A single multiplier can't fairly cover a GPT-4o chat call and a Kling video
render — their underlying costs differ wildly. So the gateway uses a **group
fee-rate** model:

- Each model belongs to a **capability group** (chat, reasoning, vision,
  image, audio, embedding, video, music, realtime).
- Each group carries a **small adjustment** on top of your tier multiplier:
  - **Light groups** (chat, embeddings, ASR) → at or slightly below base
    multiplier.
  - **Heavy groups** (reasoning / o-series, video, realtime) → a modest
    premium over base.
- Your **tier multiplier** (0.3× / 0.15× / 0.09×) is the anchor; the group
  rate is applied on top.

This keeps cheap routes cheap and prevents heavy routes from silently burning
your balance.

## Settlement

- **Currency:** USDT (**TRC-20**) by default.
- **No card, no KYC, no monthly fee.**
- **Trial credit:** new accounts receive a small free balance to test before
  funding.
- **Other cryptos** (BTC, etc.) available for **wholesale / large** clients
  only.
- **Billing:** prepaid, deducted per request from your balance in real time.

## Where to see exact rates

Per-model, per-group rates are shown on the pricing page after login (they
move with provider list prices). This file documents the *structure*; the
dashboard shows the *live numbers*.

## Fair-use notes

- Don't treat the trial credit as a free tier — it's for testing connectivity.
- Wholesale terms assume committed volume; abuse triggers review.
- Region availability follows the published Terms of Service.
