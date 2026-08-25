# Raw curl examples

All examples use `https://api.airai.cc/v1` (OpenAI-compatible). Replace
`$KEY` with your gateway key.

```bash
export KEY="YOUR_KEY"
B="https://api.airai.cc/v1"
```

## 1. Chat (non-streaming)

```bash
curl "$B/chat/completions" \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o-mini",
    "messages": [{"role":"user","content":"Hello from the gateway."}]
  }'
```

## 2. Streaming (SSE)

Add `"stream": true` and read the event stream:

```bash
curl "$B/chat/completions" \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o",
    "stream": true,
    "messages": [{"role":"user","content":"Count to 5."}]
  }'
```

Each chunk is a `data: {...}` line; `data: [DONE]` ends the stream.

## 3. Multi-turn

```bash
curl "$B/chat/completions" \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o",
    "messages": [
      {"role":"system","content":"You are concise."},
      {"role":"user","content":"What is USDT?"},
      {"role":"assistant","content":"USDT is a stablecoin pegged to the US dollar."},
      {"role":"user","content":"And TRC-20?"}
    ]
  }'
```

## 4. Vision (image input)

```bash
curl "$B/chat/completions" \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o",
    "messages": [{
      "role":"user",
      "content":[
        {"type":"text","text":"What is in this image?"},
        {"type":"image_url","image_url":{"url":"https://example.com/cat.jpg"}}
      ]
    }]
  }'
```

## 5. Function calling / tool use

```bash
curl "$B/chat/completions" \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o",
    "messages": [{"role":"user","content":"What is the weather in Paris?"}],
    "tools": [{
      "type":"function",
      "function":{
        "name":"get_weather",
        "description":"Get current weather for a city",
        "parameters":{
          "type":"object",
          "properties":{"city":{"type":"string"}},
          "required":["city"]
        }
      }
    }]
  }'
```

The response carries `tool_calls`; your code executes the function and returns
the result as a `tool` role message.

## 6. Reasoning models (o-series)

```bash
curl "$B/chat/completions" \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "o4-mini",
    "reasoning_effort": "medium",
    "messages": [{"role":"user","content":"Prove sqrt(2) is irrational."}]
  }'
```

## 7. Image generation

```bash
curl "$B/images/generations" \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"flux-1","prompt":"a minimalist workspace","size":"1024x1024"}'
```

## 8. Embeddings

```bash
curl "$B/embeddings" \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"text-embedding-3-small","input":"hello world"}'
```

## 9. Audio transcription (whisper)

```bash
curl "$B/audio/transcriptions" \
  -H "Authorization: Bearer $KEY" \
  -F "model=whisper-1" \
  -F "file=@/path/to/audio.mp3"
```

## 10. List models

```bash
curl "$B/models" -H "Authorization: Bearer $KEY"
```
