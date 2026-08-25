# Node — OpenAI SDK

```javascript
import OpenAI from "openai";

const client = new OpenAI({
  baseURL: "https://api.airai.cc/v1",
  apiKey: process.env.OPENAI_API_KEY,   // your gateway key
});

const resp = await client.chat.completions.create({
  model: "gpt-4o-mini",
  messages: [{ role: "user", content: "Hello from the gateway." }],
});

console.log(resp.choices[0].message.content);
```

```bash
export OPENAI_API_KEY="<your-gateway-key>"
export OPENAI_BASE_URL="https://api.airai.cc/v1"
```

For TypeScript frameworks (Cline, Continue, Cursor BYOK, etc.) the same
`baseURL` / `apiKey` swap applies — point the extension's "custom base URL"
field at `https://api.airai.cc/v1`.
