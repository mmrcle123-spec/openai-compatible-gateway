# Clientes e ferramentas — guias passo a passo

Esta página é um guia de configuração passo a passo para **15 clientes e
ferramentas de desenvolvimento** que funcionam com o gateway. Cada guia foi
escrita contra a interface real do gateway. Escolha sua ferramenta, siga os
passos e estará funcionando em menos de dois minutos.

> **A regra que cobre tudo**
> Aponte a **URL base compatível com OpenAI** da ferramenta para
> `https://api.airai.cc/v1`, OU defina sua **variável de ambiente do
> provedor** para a raiz nativa de Claude / Gemini:
> - Claude: `ANTHROPIC_BASE_URL=https://api.airai.cc`
> - Gemini: `GOOGLE_GEMINI_BASE_URL=https://api.airai.cc`
>
> Mesma interface compatível com OpenAI, mesma chave, os 468+ modelos por trás.

---

## Índice rápido

| # | Cliente / ferramenta | Melhor para | Protocolo |
|---|---|---|---|
| 1 | [ChatBox](#1-chatbox) | Chat desktop / móvel | OpenAI |
| 2 | [CherryStudio](#2-cherrystudio) | Multi-provedor + MCP | OpenAI + Claude MCP |
| 3 | [Cursor](#3-cursor) | Editor de código com IA (BYOK) | OpenAI |
| 4 | [Cline](#4-cline-vs-code) | Agente de código no VS Code | OpenAI |
| 5 | [Codex](#5-codex) | Agente de código no terminal | OpenAI |
| 6 | [aider](#6-aider) | CLI de programação em par | OpenAI |
| 7 | [Gemini CLI](#7-gemini-cli) | CLI nativa do Google Gemini | Gemini nativo |
| 8 | [Claude Code](#8-claude-code) | CLI nativa da Anthropic | Anthropic nativo |
| 9 | [LobeChat](#9-lobechat) | UI de chat self-hosted | OpenAI |
| 10 | [Dify](#10-dify) | LLMOps / construtor de agentes | OpenAI |
| 11 | [N8N](#11-n8n) | Automação de fluxos | OpenAI |
| 12 | [NextChat](#12-nextchat) | Chat web leve | OpenAI |
| 13 | [Immersive Translate](#13-immersive-translate) | Tradução no navegador | OpenAI |
| 14 | [LangChain](#14-langchain) | Framework de agentes | OpenAI / Anthropic / Gemini |
| 15 | [LlamaIndex](#15-llamaindex) | Framework RAG / dados | OpenAI |

**Precisa de uma chave primeiro?** Obtenha uma chave de teste grátis — veja a
seção *Get a test key* no [README principal](../README.md).

---

## 1. ChatBox

Cliente de chat multiplataforma (macOS / Windows / Linux) e móvel.

**Desktop**
1. Abra ChatBox → **Settings** (engrenagem).
2. **Model Provider** → **Add custom provider**.
3. Preencha: API Host `https://api.airai.cc/v1`, API Key sua chave, Model `gpt-4o`.
4. Salve e inicie um chat novo.

**Móvel (iOS / Android)**
Mesma rota: Settings → Model Provider → Custom OpenAI.

**Verificar**: envie "olá" — uma resposta confirma a rota.

---

## 2. CherryStudio

Cliente desktop multi-provedor popular, com suporte MCP.

**Provedor OpenAI**
1. Settings → **Model Provider** → **OpenAI**.
2. Ative e defina API Address `https://api.airai.cc/v1` + API Key.
3. Clique em **Manage / Add model** e adicione o que precisar.
4. Modelos `o4-mini` / `o3` de raciocínio são selecionáveis.

**Servidor MCP do Claude (opcional)**
Settings → **MCP Servers** → **Add** → servidor SSE/HTTP apontando ao
endpoint MCP do gateway.

---

## 3. Cursor

Editor de código com IA. Usa **BYOK**.

1. **Settings** (⌘/Ctrl + ,) → procure **Models**.
2. Ative **Bring Your Own Key** (BYOK).
3. Defina a URL base `https://api.airai.cc/v1` e cole sua chave.
4. No seletor de modelo digite `gpt-4o`, `claude-3.5-sonnet`, etc.

**Truque do prefixo `new-`**
Anteponha `new-` a um modelo (ex. `new-gpt-4o`) para forçar um contexto novo.

---

## 4. Cline (VS Code)

Agente de código autônomo como extensão do VS Code.

1. Instale **Cline**, abra o painel.
2. **Settings** → **API Provider** → **OpenAI-compatible**.
3. Preencha: Base URL `https://api.airai.cc/v1`, API Key, Model ID `claude-3.5-sonnet` / `gpt-4o` / `deepseek-chat`.

---

## 5. Codex

Agente de código no terminal da OpenAI (macOS / Linux / Windows-WSL).

Crie `~/.codex/config.toml`:
```toml
[model]
base_url = "https://api.airai.cc/v1"
api_key  = "YOUR_KEY"
model    = "gpt-4o"
```

**Alternativa — variáveis de ambiente**
```bash
export OPENAI_BASE_URL="https://api.airai.cc/v1"
export OPENAI_API_KEY="YOUR_KEY"
codex
```

---

## 6. aider

Programador em par no terminal.

```bash
aider --openai-api-base https://api.airai.cc/v1 \
      --openai-api-key YOUR_KEY --model gpt-4o
```

**Persistente — `.aider.conf.yml`**
```yaml
openai-api-base: https://api.airai.cc/v1
openai-api-key: YOUR_KEY
model: gpt-4o
```

---

## 7. Gemini CLI

CLI oficial do Gemini, na **raiz nativa Gemini**. Ver [`gemini-cli.md`](gemini-cli.md).
```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"
gemini
```

---

## 8. Claude Code

Agente Claude oficial da Anthropic, na **raiz nativa Anthropic**. Ver [`claude-code.md`](claude-code.md).
```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
claude
```

---

## 9. LobeChat

UI de chat open-source, ideal para self-host.

**No app**: Settings → **AI Provider** → **OpenAI** → Base URL `https://api.airai.cc/v1` + chave.

**Self-hosted (Docker / env)**
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_PROXY_URL="https://api.airai.cc/v1"
```

---

## 10. Dify

Plataforma open-source LLMOps para agentes e RAG.

1. **Settings** → **Model Provider**.
2. Adicione **OpenAI** (ou "OpenAI-API-compatible").
3. Preencha: API Key sua chave, API Base `https://api.airai.cc/v1`.
4. Use em Apps / Workflows / Agents.

---

## 11. N8N

Automação com nó OpenAI.

**Opção A — nó OpenAI**: crie credenciais **OpenAI API** com Base URL `https://api.airai.cc/v1`.

**Opção B — nó HTTP Request**
```json
{ "method": "POST", "url": "https://api.airai.cc/v1/chat/completions",
  "headers": {"Authorization": "Bearer YOUR_KEY", "Content-Type": "application/json"},
  "body": {"model": "gpt-4o", "messages": [{"role": "user", "content": "Hello"}]} }
```

---

## 12. NextChat

UI de chat leve (antes ChatGPT-Next-Web).
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_BASE_URL="https://api.airai.cc/v1"
```
Docker:
```bash
docker run -d -e OPENAI_API_KEY="YOUR_KEY" -e OPENAI_BASE_URL="https://api.airai.cc/v1" -p 3000:3000 yidadaa/chatgpt-next-web
```

---

## 13. Immersive Translate

Extensão de navegador que traduz páginas com um LLM.

1. Ajustes → **Translation Service** → **OpenAI / Custom**.
2. Preencha: API URL `https://api.airai.cc/v1`, API Key sua chave, Model `gpt-4o-mini`.

**Dica**: use `gpt-4o-mini` — tradução é de alto volume e baixa complexidade.

---

## 14. LangChain

Framework de agentes / RAG (Python; JS análogo).

**Dialeto OpenAI**
```python
from langchain_openai import ChatOpenAI
llm = ChatOpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
```
**Dialeto Anthropic (nativo)**
```python
from langchain_anthropic import ChatAnthropic
llm = ChatAnthropic(base_url="https://api.airai.cc", api_key="YOUR_KEY", model="claude-3.5-sonnet")
```
**Dialeto Gemini (nativo)**
```python
from langchain_google_genai import ChatGoogleGenerativeAI
llm = ChatGoogleGenerativeAI(base_url="https://api.airai.cc", google_api_key="YOUR_KEY", model="gemini-2.5-pro")
```

---

## 15. LlamaIndex

Framework de dados para RAG / agentes (Python).
```python
from llama_index.llms.openai import OpenAI
llm = OpenAI(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
print(llm.complete("hello"))
```
**Embeddings para RAG**
```python
from llama_index.embeddings.openai import OpenAIEmbedding
embed = OpenAIEmbedding(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="text-embedding-3-small")
```

---

## Regra geral para o não listado

Se uma ferramenta fala **OpenAI / Anthropic / Gemini**, funciona aqui:

| Fala… | Defina isto | Para isto |
|---|---|---|
| OpenAI API | `base_url` / `OPENAI_BASE_URL` | `https://api.airai.cc/v1` |
| Anthropic (Claude) | `ANTHROPIC_BASE_URL` | `https://api.airai.cc` |
| Gemini | `GOOGLE_GEMINI_BASE_URL` | `https://api.airai.cc` |

Mantenha sua chave, troque a URL e todos os modelos ficam disponíveis. Para
exemplos de API (curl / Python / Node, imagens, áudio, embeddings, realtime,
tarefas async) veja os outros arquivos de [`examples/`](../examples/).
