# Audio — transcription, translation & speech

Base: `https://api.airai.cc/v1`. See also the
[model family page](../models/audio.md).

## Transcription (whisper-1, ASR)

```python
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")

with open("/path/to/audio.mp3", "rb") as f:
    r = client.audio.transcriptions.create(
        model="whisper-1", file=f,
        # language="en",        # optional ISO code to bias detection
        # temperature=0,
    )
print(r.text)
```

curl:

```bash
curl https://api.airai.cc/v1/audio/transcriptions \
  -H "Authorization: Bearer $KEY" \
  -F "model=whisper-1" \
  -F "file=@/path/to/audio.mp3"
```

- Supported input: `mp3`, `wav`, `m4a`, `webm`, `ogg`, and more.
- Languages are auto-detected; pass `language` to force one.

## Translation (whisper-1)

Translate speech **into English** in one call:

```python
with open("/path/to/audio.mp3", "rb") as f:
    r = client.audio.translations.create(model="whisper-1", file=f)
print(r.text)
```

## Text-to-speech (tts-1)

```python
r = client.audio.speech.create(
    model="tts-1",
    voice="alloy",          # alloy | echo | fable | onyx | nova | shimmer
    input="Hello from the gateway.",
    # speed=1.0,            # 0.25 - 4.0 if supported
)
r.stream_to_file("out.mp3")
```

curl:

```bash
curl https://api.airai.cc/v1/audio/speech \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"tts-1","voice":"nova","input":"Hello from the gateway."}' \
  --output out.mp3
```

## Node.js

```js
import OpenAI from "openai";
import fs from "fs";
const client = new OpenAI({ baseURL: "https://api.airai.cc/v1", apiKey: "YOUR_KEY" });

// TTS
const r = await client.audio.speech.create({
  model: "tts-1", voice: "nova", input: "Hello from the gateway.",
});
fs.writeFileSync("out.mp3", Buffer.from(await r.arrayBuffer()));

// Transcription (Node 20+ FormData)
const form = new FormData();
form.append("model", "whisper-1");
form.append("file", fs.createReadStream("/path/to/audio.mp3"));
const t = await client.audio.transcriptions.create({ model: "whisper-1", file: form.getBuffer?.() ?? form });
```

## Billing

Audio (transcription, translation, TTS) is billed under the **audio** group
fee-rate (see [`PRICING.md`](../PRICING.md)).

## Related

- [Audio model family](../models/audio.md)
- [Embeddings](../examples/embeddings.md)
