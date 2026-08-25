# Claude Code / Anthropic-protocol — read this first

**Protocol note (important, don't skip):** this gateway speaks the
**OpenAI-compatible** API (`/v1/chat/completions`). It does **not** speak the
Anthropic Messages protocol.

That distinction matters for Claude Code:

- **Claude Code** talks the **Anthropic Messages API**. You cannot point its
  `ANTHROPIC_BASE_URL` directly at `https://api.airai.cc/v1` — the protocols
  differ and requests will fail.
- **OpenAI-SDK clients** (Python `openai`, Node `openai`, Cline, Continue,
  Cursor BYOK, LibreChat, OpenWebUI, SillyTavern) **can** call Claude through
  this gateway by just setting `base_url` and using `model: "claude-*"`. No
  protocol mismatch.

## Recommended paths for Claude

**Path 1 — use an OpenAI-speaking client (simplest).**
Point Cline / Continue / Cursor / LibreChat / OpenWebUI at the gateway and
request a Claude model:

```python
# Python OpenAI SDK
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="<key>")
client.chat.completions.create(
    model="claude-3-5-sonnet",
    messages=[{"role": "user", "content": "Explain base_url in one line."}],
)
```

**Path 2 — Claude Code via an Anthropic-protocol shim.**
If you specifically need Claude Code, run an Anthropic-protocol compatible
proxy in front of this gateway (e.g. a lightweight translator that converts
Anthropic Messages calls to OpenAI-compatible calls), then set:

```bash
export ANTHROPIC_BASE_URL="http://localhost:<shim-port>/v1"
export ANTHROPIC_API_KEY="<your-gateway-key>"
```

The shim — not this gateway — is responsible for protocol translation. The
gateway only ever receives OpenAI-compatible requests.

## TL;DR
- Calling **Claude from OpenAI-SDK clients** → works out of the box, swap
  `base_url`, use `model: "claude-*"`.
- Calling **Claude from Claude Code** → needs an Anthropic-protocol shim in
  front; don't point `ANTHROPIC_BASE_URL` at the gateway directly.
