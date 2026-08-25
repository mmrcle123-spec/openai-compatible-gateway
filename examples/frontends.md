# Clients & Tools — tested walkthroughs

Every client below was verified against this gateway. The pattern is always the
same: point its **OpenAI-compatible base URL** at `https://api.airai.cc/v1`, or
its **provider env var** at the native root for Claude / Gemini.

| # | Client / tool | Protocol | Key setting |
|---|---|---|---|
| 1 | ChatBox | OpenAI | custom API + base URL |
| 2 | CherryStudio | OpenAI + Claude MCP | model settings; MCP server |
| 3 | Cursor | OpenAI (BYOK) | `new-` model prefix |
| 4 | Cline | OpenAI | OpenAI-compatible base URL |
| 5 | Codex | OpenAI | `config.toml` |
| 6 | aider | OpenAI | `--openai-api-base` |
| 7 | Gemini CLI | Gemini native | `GOOGLE_GEMINI_BASE_URL` |
| 8 | Claude Code | Anthropic native | `ANTHROPIC_BASE_URL` |
| 9 | LobeChat | OpenAI | provider settings |
| 10 | Dify | OpenAI | model provider config |
| 11 | N8N | OpenAI | HTTP / OpenAI node |
| 12 | NextChat | OpenAI | `BASE_URL` env |
| 13 | Immersive Translate | OpenAI | translation API base |
| 14 | LangChain | OpenAI / Anthropic / Gemini | chat model `base_url` |
| 15 | LlamaIndex | OpenAI | `OPENAI_BASE_URL` |

---

## 1. ChatBox (desktop)

Settings → Model Provider → **Add custom provider**:
- API Host: `https://api.airai.cc/v1`
- API Key: your gateway key
- Model: `gpt-4o` (or any routed model)

## 2. CherryStudio

Settings → Model Provider → add **OpenAI** with base URL
`https://api.airai.cc/v1`. For Claude MCP: Settings → MCP Servers → add a
server whose base URL points at the gateway; call `claude-*` models directly.
Supports `o4-mini` reasoning via the model picker.

## 3. Cursor (BYOK)

Settings → Models → enable **Bring Your Own Key**, set base URL
`https://api.airai.cc/v1`. Trick: prefix a model id with `new-` (e.g.
`new-gpt-4o`) to force a fresh context / bypass cached routing when needed.

## 4. Cline (VS Code)

Cline extension → Settings → API Provider → **OpenAI-compatible** →
- Base URL: `https://api.airai.cc/v1`
- API Key: your key
- Model ID: `claude-3.5-sonnet` / `gpt-4o` / `deepseek-chat`

## 5. Codex (3 platforms)

`~/.codex/config.toml`:

```toml
[model]
base_url = "https://api.airai.cc/v1"
api_key = "YOUR_KEY"
model = "gpt-4o"
```

Same three lines work on macOS / Linux / Windows (WSL).

## 6. aider

```bash
aider --openai-api-base https://api.airai.cc/v1 \
      --openai-api-key YOUR_KEY \
      --model gpt-4o
```

## 7. Gemini CLI

```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"
gemini
```
See [`gemini-cli.md`](gemini-cli.md).

## 8. Claude Code

```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
claude
```
See [`claude-code.md`](claude-code.md).

## 9. LobeChat

Settings → AI Provider → **OpenAI** → fill base URL
`https://api.airai.cc/v1` + key. All routed models appear in the model picker.

## 10. Dify

Model Provider → Add **OpenAI** (or "OpenAI-API-compatible") →
- API Key: your key
- API Base: `https://api.airai.cc/v1`
Use inside apps / workflows / agents.

## 11. N8N

Use the **OpenAI node** with:
- Base URL: `https://api.airai.cc/v1`
- API Key: your key
Or an HTTP Request node POSTing to `/v1/chat/completions`.

## 12. NextChat

Env / config:
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_BASE_URL="https://api.airai.cc/v1"
```

## 13. Immersive Translate (browser)

Extension settings → Translation Service → **OpenAI** →
- API URL: `https://api.airai.cc/v1`
- API Key: your key
- Model: `gpt-4o-mini`

## 14. LangChain (Python)

```python
from langchain_openai import ChatOpenAI
llm = ChatOpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",
    model="gpt-4o",
)
# Anthropic / Gemini dialects also route via their own ChatModel base_url
```

## 15. LlamaIndex

```python
from llama_index.llms.openai import OpenAI
llm = OpenAI(
    api_base="https://api.airai.cc/v1",
    api_key="YOUR_KEY",
    model="gpt-4o",
)
```

---

Need a client not listed? The rule holds for anything that speaks OpenAI /
Anthropic / Gemini: swap the base URL (or provider env var) and keep your key.
