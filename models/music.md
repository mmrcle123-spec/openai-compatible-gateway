# Music generation — Suno (async)

Generate songs from a prompt or lyrics via **Suno**, exposed through the
gateway's async task system. Called through the **OpenAI-compatible** route:
base URL `https://api.airai.cc/v1`.

## Submit

```bash
curl https://api.airai.cc/v1/async/tasks \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{"type":"music","model":"suno",
       "input":{"prompt":"lo-fi hip hop, rainy night, calm",
                "lyrics":"...optional...",
                "instrumental":false}}'
# -> {"task_id":"xyz789","status":"processing"}
```

## Poll

```bash
curl https://api.airai.cc/v1/async/tasks/xyz789 -H "Authorization: Bearer $KEY"
# -> {"task_id":"xyz789","status":"succeeded",
#     "result":{"url":"https://.../song.mp3","title":"..."}}
```

## Parameters

| Field | Meaning |
|---|---|
| `prompt` | Style / genre / mood description |
| `lyrics` | Optional explicit lyrics |
| `instrumental` | `true` for no-vocal track |
| `callback_url` | Webhook fired on completion |

## Status codes

Same lifecycle as video — `pending` → `processing` → `succeeded` / `failed` /
`cancelled`. See [`models/video.md`](../models/video.md#status-codes).

## Group fee-rate

Music is billed under the **music** group (see [PRICING](../PRICING.md)), a
premium over base. Failed tasks are not billed.

## Related

- [Video](../models/video.md) · [Image](../models/image.md)
- Back to [model index](../models.md)
