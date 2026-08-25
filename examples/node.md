# Node — OpenAI SDK

```javascript
import OpenAI from "openai";

const client = new OpenAI({
  baseURL: "https://api.airai.cc/v1",
  apiKey: process.env.OPENAI_API_KEY,   // your gateway key
});
```

Set the env vars:

```bash
export OPENAI_API_KEY="YOUR_KEY"
export OPENAI_BASE_URL="https://api.airai.cc/v1"
```

## 1. Basic chat

```javascript
const resp = await client.chat.completions.create({
  model: "gpt-4o-mini",
  messages: [{ role: "user", content: "Hello from the gateway." }],
});
console.log(resp.choices[0].message.content);
```

## 2. Streaming

```javascript
const stream = await client.chat.completions.create({
  model: "gpt-4o",
  stream: true,
  messages: [{ role: "user", content: "Write a haiku about APIs." }],
});
for await (const chunk of stream) {
  process.stdout.write(chunk.choices[0]?.delta?.content || "");
}
```

## 3. Vision

```javascript
const resp = await client.chat.completions.create({
  model: "gpt-4o",
  messages: [{
    role: "user",
    content: [
      { type: "text", text: "What is in this image?" },
      { type: "image_url", image_url: { url: "https://example.com/cat.jpg" } },
    ],
  }],
});
console.log(resp.choices[0].message.content);
```

## 4. Audio transcription (whisper)

```javascript
import fs from "fs";

const resp = await client.audio.transcriptions.create({
  model: "whisper-1",
  file: fs.createReadStream("/path/to/audio.mp3"),
});
console.log(resp.text);
```

## 5. Embeddings

```javascript
const resp = await client.embeddings.create({
  model: "text-embedding-3-small",
  input: "hello world",
});
console.log(resp.data[0].embedding.slice(0, 5));
```

## For TypeScript frameworks

Cline, Continue, Cursor BYOK, etc. all use the same `baseURL` / `apiKey`
swap — point the extension's "custom base URL" field at
`https://api.airai.cc/v1`.
