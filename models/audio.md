# Audio models

Speech in, speech out. Called through the **OpenAI-compatible** route: base
URL `https://api.airai.cc/v1`.

## Transcription (ASR) — `whisper-1`

Convert speech audio to text.

```python
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")
with open("/path/to/audio.mp3", "rb") as f:
    r = client.audio.transcriptions.create(model="whisper-1", file=f)
print(r.text)
```

- Supported input: `mp3`, `wav`, `m4a`, `webm`, `ogg`, and more.
- Many languages auto-detected.

## Translation — `whisper-1`

Translate speech **into English** in one call:

```python
r = client.audio.translations.create(model="whisper-1", file=f)
print(r.text)
```

## Text-to-speech — `tts-1`

```python
r = client.audio.speech.create(
    model="tts-1",
    voice="alloy",          # alloy | echo | fable | onyx | nova | shimmer
    input="Hello from the gateway.",
)
r.stream_to_file("out.mp3")
```

Six built-in voices. Use `tts-1-hd` if available for higher fidelity.

## Node.js

```js
import OpenAI from "openai";
const client = new OpenAI({ baseURL: "https://api.airai.cc/v1", apiKey: "YOUR_KEY" });
const r = await client.audio.speech.create({
  model: "tts-1", voice: "nova", input: "Hello from the gateway.",
});
const buf = Buffer.from(await r.arrayBuffer());
require("fs").writeFileSync("out.mp3", buf);
```

## Group fee-rate

Audio (transcription, translation, TTS) is billed under the **audio** group
(see [PRICING](../PRICING.md)).

## Related

- [Image](../models/image.md) · [Embeddings](../models/embeddings.md)
- Back to [model index](../models.md)
