# Model Families

All model families below are reachable through **one account** and **one key**
on this gateway. Model names are passed verbatim in the `model` field of any
supported protocol. Exact availability is shown on the status page.

## Pick a family

| Family | Route | Page |
|---|---|---|
| **GPT** (chat, vision, o-series reasoning) | OpenAI `/v1` | [models/gpt.md](models/gpt.md) |
| **Claude** (native Anthropic) | Anthropic root | [models/claude.md](models/claude.md) |
| **DeepSeek** (chat, reasoner) | OpenAI `/v1` | [models/deepseek.md](models/deepseek.md) |
| **Gemini** (native Google) | Gemini root | [models/gemini.md](models/gemini.md) |
| **Image** (DALL·E / FLUX / Seedream / imagen / qwen) | OpenAI `/v1` | [models/image.md](models/image.md) |
| **Audio** (whisper ASR/TTS) | OpenAI `/v1` | [models/audio.md](models/audio.md) |
| **Embeddings** (3-small / 3-large / ada) | OpenAI `/v1` | [models/embeddings.md](models/embeddings.md) |
| **Realtime** (websocket voice/text) | OpenAI `/v1` | [models/realtime.md](models/realtime.md) |
| **Video** (Kling / Luma / MiniMax / Jimeng / Fal) | async task | [models/video.md](models/video.md) |
| **Music** (Suno) | async task | [models/music.md](models/music.md) |

## Text / chat (quick reference)

| Family | Example models | Notes |
|---|---|---|
| **GPT** | `gpt-4o`, `gpt-4o-mini`, `gpt-4.1` | General chat, vision-capable |
| **GPT reasoning** | `o1`, `o3`, `o4-mini` | `reasoning_effort: low\|medium\|high` |
| **Claude** | `claude-3.5-sonnet`, `claude-3.7-sonnet`, `claude-opus-4`, `claude-haiku-3.5` | Native Anthropic endpoint |
| **DeepSeek** | `deepseek-chat`, `deepseek-reasoner` | Strong price/performance |
| **Gemini** | `gemini-1.5-pro`, `gemini-2.0-flash`, `gemini-2.5-pro` | Native Gemini endpoint |
| **Qwen / others** | `qwen-max`, `qwen-plus` | Open-weight alternatives |

## Vision (image input)

All vision-capable chat models accept `image_url` content blocks:
`gpt-4o`, `claude-3.5-sonnet`, `gemini-1.5-pro`, etc.

## Replicate / Fal shims

Open-weight models hosted on Replicate or Fal can be called through:

- Replicate: `https://api.airai.cc/replicate`
- Fal: `https://api.airai.cc/fal-ai/{model}`

so you don't need a separate Replicate/Fal account for those models.

> Model names and availability change as providers update. Always check the
> live status page for the current list before building hard-coded model
> dependencies.
