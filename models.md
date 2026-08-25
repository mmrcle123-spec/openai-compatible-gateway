# Model Families

All model families below are reachable through **one account** and **one key**
on this gateway. Model names are passed verbatim in the `model` field of any
supported protocol. Exact availability is shown on the status page.

## Text / chat

| Family | Example models | Notes |
|---|---|---|
| **GPT** | `gpt-4o`, `gpt-4o-mini`, `gpt-4.1` | General chat, vision-capable |
| **GPT reasoning** | `o1`, `o3`, `o4-mini` | Use `reasoning_effort: low\|medium\|high` |
| **Claude** | `claude-3.5-sonnet`, `claude-3.7-sonnet`, `claude-opus-4`, `claude-haiku-3.5` | Via native Anthropic endpoint |
| **DeepSeek** | `deepseek-chat`, `deepseek-reasoner` | Strong price/performance |
| **Gemini** | `gemini-1.5-pro`, `gemini-2.0-flash`, `gemini-2.5-pro` | Via native Gemini endpoint |
| **Qwen / others** | `qwen-max`, `qwen-plus` | Open-weight alternatives |

## Vision (image input)

All chat models above that are vision-capable accept `image_url` content
blocks: `gpt-4o`, `claude-3.5-sonnet`, `gemini-1.5-pro`, etc.

## Image generation

| Model | Endpoint | Notes |
|---|---|---|
| **DALL·E 3** | `/images/generations` | OpenAI format |
| **gpt-image-1** | `/images/generations`, `/images/edits` | ≤4 MB edit inputs |
| **FLUX.1** | `/images/generations` (or Fal shim) | Open-weight, high quality |
| **Seedream** | `/images/generations` | |
| **imagen-4** | `/images/generations` | Google imagen |
| **qwen-image** | `/images/generations` | |

## Audio

| Model | Endpoint | Notes |
|---|---|---|
| **whisper-1** | `/audio/transcriptions` | ASR, many languages |
| **tts-1** | `/audio/speech` | 6 built-in voices |

## Embeddings

| Model | Endpoint |
|---|---|
| `text-embedding-3-small` | `/embeddings` |
| `text-embedding-3-large` | `/embeddings` |
| `text-embedding-ada-002` | `/embeddings` |

## Realtime

| Model | Endpoint |
|---|---|
| `gpt-4o-realtime-preview` | OpenAI realtime websocket |

## Video (async tasks)

| Provider | Notes |
|---|---|
| **Kling** | Text/image-to-video, async |
| **Luma** | Dream Machine, async |
| **MiniMax** | Video generation, async |
| **Jimeng** | Async |
| **Fal** | Via `/fal-ai/{model}` shim |

See [`examples/async-tasks.md`](examples/async-tasks.md) for the task / poll
/ callback flow.

## Music

| Provider | Notes |
|---|---|
| **Suno** | Via `/suno/...` shim |

## Replicate / Fal shims

Open-weight models hosted on Replicate or Fal can be called through:

- Replicate: `https://api.airai.cc/replicate`
- Fal: `https://api.airai.cc/fal-ai/{model}`

so you don't need a separate Replicate/Fal account for those models.

> Model names and availability change as providers update. Always check the
> live status page for the current list before building hard-coded model
> dependencies.
