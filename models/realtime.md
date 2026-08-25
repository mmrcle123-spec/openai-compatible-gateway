# Realtime (websocket)

Low-latency, token-streaming voice / text over a websocket, in the OpenAI
realtime shape. Base: `https://api.airai.cc/v1`.

## Model

- `gpt-4o-realtime-preview` (and the current preview id on the status page)

## Flow

1. Mint an **ephemeral session token** server-side from `/realtime/sessions`.
2. Open the websocket with that token.
3. Send `response.create` events; receive `response.text.delta` (and audio
   delta if you request audio modalities) back.

## Python sketch

```python
import asyncio, json, websockets
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")

# 1. mint an ephemeral token (server-side only)
ephemeral = client.realtime.sessions.create(model="gpt-4o-realtime-preview")
token = ephemeral.client_secret.value

async def main():
    url = f"wss://api.airai.cc/v1/realtime?authorization={token}"
    async with websockets.connect(url) as ws:
        await ws.send(json.dumps({
            "type": "response.create",
            "response": {"modalities": ["text"]},
            "input": [{"role": "user", "content": "Hello, realtime?"}],
        }))
        async for msg in ws:
            evt = json.loads(msg)
            if evt.get("type") == "response.text.delta":
                print(evt["delta"], end="")

asyncio.run(main())
```

## Key event types

| Event | Direction | Meaning |
|---|---|---|
| `response.create` | → | start a generation |
| `response.text.delta` | ← | streaming text token |
| `response.audio.delta` | ← | streaming audio chunk |
| `conversation.item.create` | → | push user/assistant item |
| `input_audio_buffer.append` | → | stream microphone bytes |

## Security

- Tokens are short-lived — mint them **server-side**. Never ship your gateway
  key to the browser; use an ephemeral token instead.

## Group fee-rate

Realtime is billed under the **realtime** group (see [PRICING](../PRICING.md)),
which carries a modest premium over base due to compute cost.

## Related

- [Async tasks](../models/video.md) for long-running media.
- Back to [model index](../models.md)
