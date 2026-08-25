# Async tasks — video, music, Replicate, Fal

Long-running generations (video, music, some image models) run as **async
tasks**: submit → poll / callback → fetch result. Base: `https://api.airai.cc/v1`,
endpoint `/async/tasks`. See also [models/video.md](../models/video.md) and
[models/music.md](../models/music.md).

## Task lifecycle

1. **Submit** a task → receive a `task_id` and `status: pending|processing`.
2. **Poll** `GET /async/tasks/{task_id}`, or wait for the webhook callback.
3. When `status: succeeded`, fetch the result URL / data.

## Submit a video task (Kling)

```bash
curl https://api.airai.cc/v1/async/tasks \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{"type":"video","model":"kling",
       "input":{"prompt":"a city at night, neon lights","duration":5}}'
# -> {"task_id":"abc123","status":"processing"}
```

## Poll (Python)

```python
import time, requests
BASE = "https://api.airai.cc/v1"
hdr = {"Authorization": f"Bearer {KEY}"}
while True:
    t = requests.get(f"{BASE}/async/tasks/abc123", headers=hdr).json()
    if t["status"] in ("succeeded", "failed", "cancelled"):
        break
    time.sleep(3)
print(t["status"], t.get("result", {}).get("url"))
```

## Callback (webhook)

Pass a `callback_url`; the gateway POSTs the finished task to it:

```json
{ "task_id": "abc123", "status": "succeeded",
  "result": { "url": "https://..." } }
```

For production, prefer the callback over polling.

## Status codes

| Status | Meaning |
|---|---|
| `pending` | queued, not started |
| `processing` | running |
| `succeeded` | done, result available |
| `failed` | errored (see `error`) |
| `cancelled` | cancelled by caller |

## Per-provider parameters

| Provider | Example `input` fields |
|---|---|
| **Kling** | `prompt`, `image` (start frame), `duration` |
| **Luma** | `prompt`, `aspect_ratio` (`16:9`/`9:16`) |
| **MiniMax** | `prompt`, `duration` |
| **Jimeng** | `prompt` |
| **Fal** | forwarded to `/fal-ai/{model}` (see shim below) |

## Submit a music task (Suno)

```bash
curl https://api.airai.cc/v1/async/tasks \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{"type":"music","model":"suno",
       "input":{"prompt":"lo-fi hip hop, rainy night",
                "lyrics":"optional lyrics here",
                "instrumental":false}}'
```

## Replicate shim

```bash
curl https://api.airai.cc/replicate \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"stability-ai/sdxl","input":{"prompt":"a castle"}}'
```

## Fal shim

```bash
curl https://api.airai.cc/fal-ai/flux-pro \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{"prompt":"a castle on a cliff"}'
```

## Billing

Async tasks (video / music) are billed under the **video / music** group
fee-rate (see [`PRICING.md`](../PRICING.md)) — a premium over base. Failed
tasks are not billed (final accounting on the dashboard). Polling interval of
2–5 s is reasonable for development.
