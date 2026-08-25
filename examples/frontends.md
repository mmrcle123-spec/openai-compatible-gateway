# Clients & Tools — tested walkthroughs

This page is a step-by-step setup guide for **15 clients and developer tools**
that work with the gateway. Every walkthrough below was written against the
gateway's real interface. Pick your tool, follow the steps, and you are live in
under two minutes.

> **The one rule that covers everything**
> Point the client's **OpenAI-compatible base URL** at `https://api.airai.cc/v1`,
> OR set its **provider env var** to the native root for Claude / Gemini:
> - Claude: `ANTHROPIC_BASE_URL=https://api.airai.cc`
> - Gemini: `GOOGLE_GEMINI_BASE_URL=https://api.airai.cc`
>
> Same OpenAI-compatible interface, same key, all 468+ models behind it.

---

## Quick index

| # | Client / tool | Best for | Protocol |
|---|---|---|---|
| 1 | [ChatBox](#1-chatbox) | Desktop / mobile chat | OpenAI |
| 2 | [CherryStudio](#2-cherrystudio) | Multi-provider desktop + MCP | OpenAI + Claude MCP |
| 3 | [Cursor](#3-cursor) | AI code editor (BYOK) | OpenAI |
| 4 | [Cline](#4-cline-vs-code) | Coding agent in VS Code | OpenAI |
| 5 | [Codex](#5-codex) | Terminal coding agent | OpenAI |
| 6 | [aider](#6-aider) | Pair-programming CLI | OpenAI |
| 7 | [Gemini CLI](#7-gemini-cli) | Google Gemini native CLI | Gemini native |
| 8 | [Claude Code](#8-claude-code) | Anthropic native CLI | Anthropic native |
| 9 | [LobeChat](#9-lobechat) | Self-hosted chat UI | OpenAI |
| 10 | [Dify](#10-dify) | LLMOps / agent builder | OpenAI |
| 11 | [N8N](#11-n8n) | Workflow automation | OpenAI |
| 12 | [NextChat](#12-nextchat) | Lightweight web chat | OpenAI |
| 13 | [Immersive Translate](#13-immersive-translate) | Browser translation | OpenAI |
| 14 | [LangChain](#14-langchain) | Python / JS agent framework | OpenAI / Anthropic / Gemini |
| 15 | [LlamaIndex](#15-llamaindex) | RAG / data framework | OpenAI |

**Need a key first?** Get a free test key — see the *Get a test key* section in
the [main README](../README.md). Everything below assumes you already have a
key string like `sk-...` (the exact prefix depends on your account tier).

---

## 1. ChatBox

Cross-platform desktop (macOS / Windows / Linux) and mobile chat client.

**Desktop**
1. Open ChatBox → **Settings** (gear icon).
2. **Model Provider** → **Add custom provider** (or "OpenAI / Custom").
3. Fill in:
   - **API Host / Base URL**: `https://api.airai.cc/v1`
   - **API Key**: your gateway key
   - **Model**: `gpt-4o` (or any routed model)
4. Save, then start a new chat to verify.

**Mobile (iOS / Android)**
Same path: Settings → Model Provider → Custom OpenAI → enter the host above.

**Verify**
Send "hello" — a normal reply confirms the route works. To see all models,
open the model dropdown or hit the `/v1/models` endpoint (see
[curl.md](../examples/curl.md#list-models)).

**Tip**
ChatBox passes `stream: true` by default — streaming works out of the box.

---

## 2. CherryStudio

Popular multi-provider desktop client with built-in MCP support.

**OpenAI provider**
1. Settings → **Model Provider** → **OpenAI**.
2. Toggle **Enable**, then set:
   - **API Address**: `https://api.airai.cc/v1`
   - **API Key**: your gateway key
3. Click **Manage / Add model** and add what you need (e.g. `gpt-4o`,
   `claude-3.5-sonnet`, `deepseek-chat`). CherryStudio pulls the model list
   from the endpoint.
4. `o4-mini` / `o3` reasoning models are selectable from the model picker —
   set **Reasoning effort** if the model exposes it.

**Claude MCP server (optional)**
CherryStudio can call the gateway as an MCP tool server:
1. Settings → **MCP Servers** → **Add**.
2. Use an **SSE** or **Streamable HTTP** server pointing at the gateway's
   MCP endpoint (ask support / check your dashboard for the exact MCP path).
3. Enable the server; `claude-*` tools become available inside CherryStudio's
   agent view.

**Verify**
Open a chat, pick a model from the dropdown, send a message.

---

## 3. Cursor

AI-first code editor. Uses **BYOK** (Bring Your Own Key).

1. **Settings** (⌘/Ctrl + ,) → search **Models**.
2. Enable **Bring Your Own Key** (BYOK).
3. Set the custom base URL to `https://api.airai.cc/v1` and paste your key.
4. In the chat/composer model selector, type a model id such as `gpt-4o`,
   `claude-3.5-sonnet`, or `deepseek-chat`.

**The `new-` prefix trick**
Prefix a model id with `new-` (e.g. `new-gpt-4o`) to force a fresh routing
context and bypass any cached session. Handy when a request stalls.

**Verify**
Open Cursor Chat (⌘/Ctrl + L) and ask a coding question.

**Notes**
- Cursor charges its own subscription for the *editor*; the key you supply
  only covers model calls through this gateway.
- Reasoning models (`o4-mini`) work via the same base URL.

---

## 4. Cline (VS Code)

Autonomous coding agent as a VS Code extension.

1. Install the **Cline** extension, then open its panel.
2. **Settings (gear)** → **API Provider** → choose **OpenAI-compatible**.
3. Fill in:
   - **Base URL**: `https://api.airai.cc/v1`
   - **API Key**: your gateway key
   - **Model ID**: `claude-3.5-sonnet` / `gpt-4o` / `deepseek-chat`
4. Save and start a task.

**Verify**
Ask Cline to "write a hello world function in Python" — it will call the
model and show the diff.

---

## 5. Codex

OpenAI's terminal coding agent (macOS / Linux / Windows-WSL).

Create or edit `~/.codex/config.toml`:

```toml
[model]
base_url = "https://api.airai.cc/v1"
api_key  = "YOUR_KEY"
model    = "gpt-4o"
```

The same three lines work on all three platforms.

**Alternative — environment variables**
```bash
export OPENAI_BASE_URL="https://api.airai.cc/v1"
export OPENAI_API_KEY="YOUR_KEY"
codex
```

**Verify**
Run `codex` and type a prompt; the agent replies using the configured route.

---

## 6. aider

Terminal pair-programmer for your codebase.

**One-off flags**
```bash
aider --openai-api-base https://api.airai.cc/v1 \
      --openai-api-key YOUR_KEY \
      --model gpt-4o
```

**Persistent — `.aider.conf.yml`** (avoids retyping)
```yaml
openai-api-base: https://api.airai.cc/v1
openai-api-key: YOUR_KEY
model: gpt-4o
```

**Verify**
`aider` launches, reads your repo, and answers coding questions.

**Notes**
- `aider` also supports architect/editor sub-models — set them to any routed
  model via the same base URL.
- For Claude models use `--model claude-3.5-sonnet` (still through the
  OpenAI-compatible route).

---

## 7. Gemini CLI

Google's official Gemini command-line tool, pointed at the **native Gemini
root**. See [`gemini-cli.md`](gemini-cli.md) for the full guide.

```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"
gemini
```

**Verify**
```
> explain this codebase in one sentence
```
A reply means the native Gemini route is live.

**Reasoning**
Gemini 2.5 / thinking models accept a thinking-budget flag — pass it as you
would against Google's own endpoint; the gateway forwards it unchanged.

---

## 8. Claude Code

Anthropic's official Claude coding agent, pointed at the **native Anthropic
root**. See [`claude-code.md`](claude-code.md) for the full guide.

```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
claude
```

**Verify**
```
> /status
```
The status line should show the gateway as the active provider. Then ask a
coding question.

**Native models**
`claude-opus-4`, `claude-sonnet-4`, `claude-3.5-sonnet` etc. are called through
the native Anthropic protocol — no OpenAI shim, full tool-use support.

---

## 9. LobeChat

Open-source chat UI, great for self-hosting.

**In-app**
1. Settings → **AI Provider** → **OpenAI**.
2. Enable the provider and set:
   - **Base URL**: `https://api.airai.cc/v1`
   - **API Key**: your key
3. All routed models appear in the model picker.

**Self-hosted (Docker / env)**
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_PROXY_URL="https://api.airai.cc/v1"
```
(LobeChat reads `OPENAI_PROXY_URL` as the base URL override.)

**Verify**
Pick a model and send a message in a new conversation.

---

## 10. Dify

Open-source LLMOps platform for building agents and RAG apps.

1. **Settings** (avatar) → **Model Provider**.
2. Add **OpenAI** (or "OpenAI-API-compatible").
3. Fill in:
   - **API Key**: your gateway key
   - **API Base**: `https://api.airai.cc/v1`
   - Leave "Completion/ Chat" model lists on auto-fetch.
4. Save.

**Use it**
- **Studio**: create an App, pick the gateway's model in the model dropdown.
- **Workflows / Agents**: the same model list is available wherever a model
  node is used.
- **Knowledge / RAG**: embed documents with an embedding model from the
  gateway (e.g. `text-embedding-3-small`).

**Verify**
Open the App's preview and send a test prompt.

---

## 11. N8N

Workflow automation with an OpenAI node.

**Option A — OpenAI node**
1. Add an **OpenAI** node.
2. Under credentials, create **OpenAI API** with:
   - Base URL: `https://api.airai.cc/v1`
   - API Key: your key
3. Pick a model (`gpt-4o`) and connect it to a trigger.

**Option B — HTTP Request node (more control)**
```json
{
  "method": "POST",
  "url": "https://api.airai.cc/v1/chat/completions",
  "headers": {
    "Authorization": "Bearer YOUR_KEY",
    "Content-Type": "application/json"
  },
  "body": {
    "model": "gpt-4o",
    "messages": [{"role": "user", "content": "Hello"}]
  }
}
```

**Verify**
Execute the node; the response body contains the model's reply.

---

## 12. NextChat

Lightweight, deployable chat UI (formerly ChatGPT-Next-Web).

**Environment**
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_BASE_URL="https://api.airai.cc/v1"
```

**Docker**
```bash
docker run -d \
  -e OPENAI_API_KEY="YOUR_KEY" \
  -e OPENAI_BASE_URL="https://api.airai.cc/v1" \
  -p 3000:3000 yidadaa/chatgpt-next-web
```

**Vercel / one-click**
Set the same two env vars in the deployment settings.

**Verify**
Open the UI, choose a model, send a message.

---

## 13. Immersive Translate

Browser extension that translates pages with an LLM.

1. Extension settings → **Translation Service** → **OpenAI / Custom**.
2. Fill in:
   - **API URL**: `https://api.airai.cc/v1`
   - **API Key**: your key
   - **Model**: `gpt-4o-mini` (fast + cheap for translation)
3. Save and reload the extension.

**Verify**
Open any foreign-language page and trigger translation (the extension's hotkey
or click). Translated text should appear.

**Tip**
Use a small/fast model (`gpt-4o-mini`) here — translation is high-volume,
low-complexity, so it is the cheapest workload on the gateway.

---

## 14. LangChain

Agent / RAG framework (Python shown; JS is analogous).

**OpenAI dialect**
```python
from langchain_openai import ChatOpenAI

llm = ChatOpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",
    model="gpt-4o",
)
print(llm.invoke("hi").content)
```

**Anthropic dialect (native)**
```python
from langchain_anthropic import ChatAnthropic

llm = ChatAnthropic(
    base_url="https://api.airai.cc",   # native root
    api_key="YOUR_KEY",
    model="claude-3.5-sonnet",
)
```

**Gemini dialect (native)**
```python
from langchain_google_genai import ChatGoogleGenerativeAI

llm = ChatGoogleGenerativeAI(
    base_url="https://api.airai.cc",   # native root
    google_api_key="YOUR_KEY",
    model="gemini-2.5-pro",
)
```

**Verify**
Run the snippet; the printed content confirms the route.

**Note**
Each dialect uses its *own* ChatModel class but the **same credentials and
root** — OpenAI → `/v1`, Anthropic & Gemini → root domain.

---

## 15. LlamaIndex

Data framework for RAG / agents (Python).

**OpenAI-compatible**
```python
from llama_index.llms.openai import OpenAI

llm = OpenAI(
    api_base="https://api.airai.cc/v1",
    api_key="YOUR_KEY",
    model="gpt-4o",
)
print(llm.complete("hello"))
```

**Globally (Settings)**
```python
from llama_index.core import Settings
from llama_index.llms.openai import OpenAI

Settings.llm = OpenAI(api_base="https://api.airai.cc/v1",
                      api_key="YOUR_KEY", model="gpt-4o")
```

**Embeddings for RAG**
```python
from llama_index.embeddings.openai import OpenAIEmbedding

embed = OpenAIEmbedding(
    api_base="https://api.airai.cc/v1",
    api_key="YOUR_KEY",
    model="text-embedding-3-small",
)
```

**Verify**
`llm.complete("hello")` returns text; `embed.get_text_embedding("x")` returns
a vector.

---

## Rule of thumb for anything not listed

If a tool speaks **OpenAI / Anthropic / Gemini**, it works here:

| Tool speaks… | Set this | To this |
|---|---|---|
| OpenAI API | `base_url` / `OPENAI_BASE_URL` | `https://api.airai.cc/v1` |
| Anthropic (Claude) | `ANTHROPIC_BASE_URL` | `https://api.airai.cc` |
| Gemini | `GOOGLE_GEMINI_BASE_URL` | `https://api.airai.cc` |

Keep your key, swap the URL (or env var), and every model behind the gateway
becomes available. For API-level examples (curl / Python / Node, images,
audio, embeddings, realtime, async tasks) see the other files in this
[`examples/`](../examples/) folder.
