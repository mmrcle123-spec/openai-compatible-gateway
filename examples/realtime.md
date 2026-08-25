# Realtime (websocket)

The gateway exposes OpenAI-style **realtime** over a websocket for low-latency
voice / token streaming. Base: `https://api.airai.cc/v1`.

## Connect

1. Get a realtime session token from the REST endpoint.
2. Open a websocket to the realtime URL with that token.
3. Send `/response.create` events; receive delta events back.

## Python sketch (websockets)

```python
import asyncio, json, websockets
from openai import OpenAI

client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")

# 1. mint an ephemeral token (server-side)
ephemeral = client.realtime.sessions.create(model="gpt-4o-realtime")
token = ephemeral.client_secret.value

async def main():
    url = "wss://api.airai.cc/v1/realtime?authorization=YOUR_KEY"
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

## Notes

- Use the realtime model `gpt-4o-realtime-preview` (or current preview id).
- Tokens are short-lived — mint them server-side, never ship your gateway key
  to the browser.
- Realtime is billed under the **realtime** group fee-rate (see `PRICING.md`),
  which carries a modest premium over base due to compute cost.
