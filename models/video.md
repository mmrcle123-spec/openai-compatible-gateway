# Video generation (async)

Text / image-to-video runs as a **long-running async task**: submit → poll /
callback → fetch result. Called through the **OpenAI-compatible** route:
base URL `https://api.airai.cc/v1`, endpoint `/async/tasks`. See the full
flow in [`examples/async-tasks.md`](../examples/async-tasks.md).

## Providers

| Provider | Notes |
|---|---|
| **Kling** | Text / image to video; duration, aspect ratio |
| **Luma** | Dream Machine; camera motion presets |
| **MiniMax** | Video generation |
| **Jimeng** | Text-to-video |
| **Fal** | Via `/fal-ai/{model}` shim (FLUX, video models) |

## Submit (Kling example)

```bash
curl https://api.airai.cc/v1/async/tasks \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{"type":"video","model":"kling",
       "input":{"prompt":"a city at night, neon lights","duration":5}}'
# -> {"task_id":"abc123","status":"processing"}
```

## Per-provider parameters (common)

| Field | Applies to | Meaning |
|---|---|---|
| `prompt` | all | Text description |
| `image` | Kling, others | Start frame (image-to-video) |
| `duration` | Kling, Luma | Seconds (e.g. 5) |
| `aspect_ratio` | Luma, others | `16:9` / `9:16` |
| `callback_url` | all | Webhook fired on completion |

## Poll

```bash
curl https://api.airai.cc/v1/async/tasks/abc123 -H "Authorization: Bearer $KEY"
# -> {"task_id":"abc123","status":"succeeded","result":{"url":"https://..."}}
```

## Status codes

| Status | Meaning |
|---|---|
| `pending` | queued, not started |
| `processing` | running |
| `succeeded` | done, result available |
| `failed` | errored (see `error`) |
| `cancelled` | cancelled by caller |

## Group fee-rate

Video generation is billed under the **video** group (see
[PRICING](../PRICING.md)) — a premium over base due to GPU compute. Failed
tasks are not billed (final accounting on the dashboard).

## Related

- [Music (Suno)](../models/music.md) · [Image](../models/image.md)
- Back to [model index](../models.md)
