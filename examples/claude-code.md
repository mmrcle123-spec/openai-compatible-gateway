# Claude Code / Anthropic-native — works directly

**Good news:** this gateway speaks the **Anthropic Claude native format** (the
Messages API), not just OpenAI chat. So Claude Code and the Anthropic SDK can
point at it directly — **no protocol shim needed**.

## Claude Code (native)

```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc/v1/anthropic"   # confirm exact path
export ANTHROPIC_API_KEY="<your-gateway-key>"
```
Then run `claude` as usual. Requests go out in the Anthropic Messages shape and
the gateway answers in the same shape.

## Anthropic SDK (Python)

```python
from anthropic import Anthropic
client = Anthropic(
    base_url="https://api.airai.cc/v1/anthropic",   # confirm exact path
    api_key="<your-gateway-key>",
)
client.messages.create(
    model="claude-3-5-sonnet",
    max_tokens=512,
    messages=[{"role": "user", "content": "Explain base_url in one line."}],
)
```

## OpenAI-SDK clients (also fine)

If you'd rather stay on the OpenAI shape, point the OpenAI SDK at
`https://api.airai.cc/v1` and request a Claude model with
`model: "claude-*"`. **Both native formats route to the same models** — pick
whichever your client already speaks.

## TL;DR
- **Claude Code / Anthropic SDK** → point `ANTHROPIC_BASE_URL` at the gateway's
  Anthropic-native URL. Works directly.
- **OpenAI SDK** → point `base_url` at `https://api.airai.cc/v1`, use
  `model: "claude-*"`. Also works.
- Same models, your choice of dialect.
