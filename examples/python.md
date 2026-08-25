# Python — OpenAI SDK

Install: `pip install openai`. Point `base_url` at the gateway.

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",
)
```

## 1. Basic chat

```python
r = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[{"role":"user","content":"Hello from the gateway."}],
)
print(r.choices[0].message.content)
```

## 2. Multi-turn

```python
msgs = [
    {"role":"system","content":"You are concise."},
    {"role":"user","content":"Explain USDT in one sentence."},
]
r = client.chat.completions.create(model="gpt-4o", messages=msgs)
reply = r.choices[0].message.content
msgs.append({"role":"assistant","content":reply})
msgs.append({"role":"user","content":"And TRC-20?"})
r2 = client.chat.completions.create(model="gpt-4o", messages=msgs)
print(r2.choices[0].message.content)
```

## 3. Streaming (SSE)

```python
stream = client.chat.completions.create(
    model="gpt-4o",
    stream=True,
    messages=[{"role":"user","content":"Write a haiku about APIs."}],
)
for chunk in stream:
    if chunk.choices[0].delta.content:
        print(chunk.choices[0].delta.content, end="", flush=True)
```

## 4. Vision

```python
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{
        "role":"user",
        "content":[
            {"type":"text","text":"Describe this image."},
            {"type":"image_url","image_url":{"url":"https://example.com/cat.jpg"}},
        ],
    }],
)
print(r.choices[0].message.content)
```

## 5. Function calling

```python
tools = [{
    "type":"function",
    "function":{
        "name":"get_weather",
        "description":"Get weather for a city",
        "parameters":{
            "type":"object",
            "properties":{"city":{"type":"string"}},
            "required":["city"],
        },
    },
}]
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role":"user","content":"Weather in Paris?"}],
    tools=tools,
)
print(r.choices[0].message.tool_calls)
# execute the function, then send result back with role="tool"
```

## 6. Reasoning (o-series)

```python
r = client.chat.completions.create(
    model="o4-mini",
    reasoning_effort="high",
    messages=[{"role":"user","content":"Prove sqrt(2) is irrational."}],
)
print(r.choices[0].message.content)
```

## 7. Embeddings

```python
r = client.embeddings.create(
    model="text-embedding-3-small",
    input="hello world",
)
print(r.data[0].embedding[:5])   # first 5 dims
```

## 8. Audio transcription (whisper)

```python
with open("/path/to/audio.mp3","rb") as f:
    r = client.audio.transcriptions.create(model="whisper-1", file=f)
print(r.text)
```

## 9. Text-to-speech (TTS)

```python
r = client.audio.speech.create(
    model="tts-1",
    voice="alloy",          # alloy, echo, fable, onyx, nova, shimmer
    input="Hello from the gateway.",
)
r.stream_to_file("out.mp3")
```

## 10. Image generation (DALL·E 3 / gpt-image-1)

```python
r = client.images.generate(
    model="gpt-image-1",
    prompt="a minimalist workspace, soft light",
    size="1024x1024",
)
print(r.data[0].url)        # or b64_json depending on response_format
```

## 11. Image editing (gpt-image-1)

```python
r = client.images.edit(
    model="gpt-image-1",
    image=open("/path/to/input.png","rb"),   # <= 4 MB
    prompt="add a red hat",
)
print(r.data[0].url)
```

## 12. Realtime (websocket)

See [`realtime.md`](realtime.md) for the websocket client pattern.
