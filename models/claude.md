# Claude models

Anthropic's Claude family, called through the **native Anthropic** route
(root domain, not `/v1`):

```
ANTHROPIC_BASE_URL=https://api.airai.cc
ANTHROPIC_API_KEY=YOUR_KEY
```

This is the real Anthropic protocol — full tool use, streaming, and system
prompts work exactly as against `api.anthropic.com`.

## Available models

| Model | Notes |
|---|---|
| `claude-opus-4` | Most capable, longest context |
| `claude-sonnet-4` | Balanced speed/capability |
| `claude-3.7-sonnet` | Previous-gen sonnet, strong coding |
| `claude-3.5-sonnet` | Popular, fast, vision-capable |
| `claude-haiku-3.5` | Cheapest, fastest |

## Native SDK example

```python
import anthropic
client = anthropic.Anthropic(
    base_url="https://api.airai.cc",
    api_key="YOUR_KEY",
)
r = client.messages.create(
    model="claude-3.5-sonnet",
    max_tokens=1024,
    system="You are a helpful assistant.",
    messages=[{"role":"user","content":"Explain transformers in one line."}],
)
print(r.content[0].text)
```

## Tool use

Claude's native tool-use format is fully supported:

```python
tools = [{
    "name": "get_weather",
    "description": "Get weather for a city",
    "input_schema": {"type":"object","properties":{"city":{"type":"string"}}},
}]
r = client.messages.create(
    model="claude-3.5-sonnet", max_tokens=1024,
    tools=tools, messages=[{"role":"user","content":"Weather in Lagos?"}],
)
# r.stop_reason == "tool_use" -> call the function, return result
```

## CLI

```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
claude   # Claude Code / Claude CLI
```

See [`examples/claude-code.md`](../examples/claude-code.md).

## Group fee-rate

Claude models are billed under the **base / chat** group (see
[PRICING](../PRICING.md)) when used for normal chat. Heavy tool-use / agent
workloads may route through the **reasoning** group depending on token mix.

## Related

- [GPT](../models/gpt.md) · [DeepSeek](../models/deepseek.md) ·
  [Gemini](../models/gemini.md)
- Back to [model index](../models.md)
