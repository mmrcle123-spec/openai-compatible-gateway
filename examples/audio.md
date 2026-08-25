# Audio — transcription & speech

Base: `https://api.airai.cc/v1`.

## Transcription (whisper-1, ASR)

```python
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")

with open("/path/to/audio.mp3", "rb") as f:
    r = client.audio.transcriptions.create(model="whisper-1", file=f)
print(r.text)
```

curl:

```bash
curl https://api.airai.cc/v1/audio/transcriptions \
  -H "Authorization: Bearer $KEY" \
  -F "model=whisper-1" \
  -F "file=@/path/to/audio.mp3"
```

## Text-to-speech (tts-1)

```python
r = client.audio.speech.create(
    model="tts-1",
    voice="alloy",          # alloy | echo | fable | onyx | nova | shimmer
    input="Hello from the gateway.",
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

## Notes

- Transcription supports common formats (mp3, wav, m4a, etc.).
- TTS offers 6 built-in voices.
- Billed under the **audio** group fee-rate (see `PRICING.md`).
