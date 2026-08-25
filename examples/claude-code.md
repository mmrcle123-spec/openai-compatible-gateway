# Claude Code / Anthropic-native — works directly

**Good news:** this gateway speaks the **Anthropic Claude native format** (the
Messages API), not just OpenAI chat. So Claude Code and the Anthropic SDK can
point at it directly — **no protocol shim needed**.

> **Base URL = root domain.** The Anthropic SDK sends requests to the provider
> root (e.g. `https://api.anthropic.com`), **not** a `/v1` sub-path. Point
> `ANTHROPIC_BASE_URL` at `https://api.airai.cc` (root).

## Claude Code (native)

```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
```

Then run `claude` as usual. (To persist: `claude --set-env
ANTHROPIC_BASE_URL=https://api.airai.cc`.) Requests go out in the Anthropic
Messages shape and the gateway answers in the same shape.

## Anthropic SDK (Python)

```python
import anthropic
client = anthropic.Anthropic(
    base_url="https://api.airai.cc",     # root domain
    api_key="YOUR_KEY",
)
r = client.messages.create(
    model="claude-3-5-sonnet",
    max_tokens=512,
    messages=[{"role": "user", "content": "Explain base_url in one line."}],
)
print(r.content[0].text)
```

## Anthropic SDK (Node)

```javascript
import Anthropic from "anthropic";
const client = new Anthropic({
  baseURL: "https://api.airai.cc",
  apiKey: process.env.ANTHROPIC_API_KEY,
});
const r = await client.messages.create({
  model: "claude-3-5-sonnet",
  max_tokens: 512,
  messages: [{ role: "user", content: "Hi" }],
});
console.log(r.content[0].text);
```

## OpenAI-SDK clients (also fine)

If you'd rather stay on the OpenAI shape, point the OpenAI SDK at
`https://api.airai.cc/v1` and request a Claude model with
`model: "claude-*"`. **Both native formats route to the same models** — pick
whichever your client already speaks.

## TL;DR

- **Claude Code / Anthropic SDK** → point `ANTHROPIC_BASE_URL` at
  `https://api.airai.cc` (root). Works directly.
- **OpenAI SDK** → point `base_url` at `https://api.airai.cc/v1`, use
  `model: "claude-*"`. Also works.
- Same models, your choice of dialect.
