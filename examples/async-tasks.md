# Async tasks — video, music, Replicate, Fal

Long-running generations (video, music, some image models) run as **async
tasks**: submit → poll / callback → fetch result. Base: `https://api.airai.cc/v1`.

## Task lifecycle

1. **Submit** a task → receive a `task_id` and `status: pending|processing`.
2. **Poll** `GET /async/tasks/{task_id}`, or wait for the webhook callback.
3. When `status: succeeded`, fetch the result URL / data.

## Submit a video task (example: Kling)

```bash
curl https://api.airai.cc/v1/async/tasks \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "type": "video",
    "model": "kling",
    "input": {"prompt": "a city at night, neon lights", "duration": 5}
  }'
# -> {"task_id":"abc123","status":"processing"}
```

## Poll

```bash
curl https://api.airai.cc/v1/async/tasks/abc123 \
  -H "Authorization: Bearer $KEY"
# -> {"task_id":"abc123","status":"succeeded","result":{"url":"https://..."}}
```

## Callback (webhook)

Pass a `callback_url`; the gateway POSTs the finished task to it:

```json
{
  "task_id": "abc123",
  "status": "succeeded",
  "result": { "url": "https://..." }
}
```

## Status codes

| Status | Meaning |
|---|---|
| `pending` | queued, not started |
| `processing` | running |
| `succeeded` | done, result available |
| `failed` | errored (see `error`) |
| `cancelled` | cancelled by caller |

## Supported async providers

| Provider | Type | Notes |
|---|---|---|
| **Kling** | video | text / image to video |
| **Luma** | video | Dream Machine |
| **MiniMax** | video | |
| **Jimeng** | video | |
| **Fal** | image / video | via `/fal-ai/{model}` shim |
| **Suno** | music | via `/suno/...` shim |

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

## Notes

- Async tasks are billed under the **video / music** group fee-rate (see
  `PRICING.md`) — these carry a premium over base due to compute cost.
- Polling interval: 2–5 s is reasonable; rely on the callback for production.
- Failed tasks are not billed (check your dashboard for final accounting).
