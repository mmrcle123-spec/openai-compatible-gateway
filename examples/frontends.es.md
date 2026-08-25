# Clientes y herramientas — guías paso a paso

Esta página es una guía de configuración paso a paso para **15 clientes y
herramientas de desarrollo** que funcionan con la pasarela. Cada guía fue
escrita contra la interfaz real de la pasarela. Elige tu herramienta, sigue los
pasos y estarás operativo en menos de dos minutos.

> **La regla que lo cubre todo**
> Apunta la **URL base compatible con OpenAI** de la herramienta a
> `https://api.airai.cc/v1`, O define su **variable de entorno del proveedor**
> a la raíz nativa para Claude / Gemini:
> - Claude: `ANTHROPIC_BASE_URL=https://api.airai.cc`
> - Gemini: `GOOGLE_GEMINI_BASE_URL=https://api.airai.cc`
>
> Misma interfaz compatible con OpenAI, misma clave, los 468+ modelos detrás.

---

## Índice rápido

| # | Cliente / herramienta | Mejor para | Protocolo |
|---|---|---|---|
| 1 | [ChatBox](#1-chatbox) | Chat de escritorio / móvil | OpenAI |
| 2 | [CherryStudio](#2-cherrystudio) | Multi-proveedor + MCP | OpenAI + Claude MCP |
| 3 | [Cursor](#3-cursor) | Editor de código con IA (BYOK) | OpenAI |
| 4 | [Cline](#4-cline-vs-code) | Agente de código en VS Code | OpenAI |
| 5 | [Codex](#5-codex) | Agente de código en terminal | OpenAI |
| 6 | [aider](#6-aider) | CLI de programación en pareja | OpenAI |
| 7 | [Gemini CLI](#7-gemini-cli) | CLI nativa de Google Gemini | Gemini nativo |
| 8 | [Claude Code](#8-claude-code) | CLI nativa de Anthropic | Anthropic nativo |
| 9 | [LobeChat](#9-lobechat) | UI de chat auto-alojable | OpenAI |
| 10 | [Dify](#10-dify) | LLMOps / constructor de agentes | OpenAI |
| 11 | [N8N](#11-n8n) | Automatización de flujos | OpenAI |
| 12 | [NextChat](#12-nextchat) | Chat web ligero | OpenAI |
| 13 | [Immersive Translate](#13-immersive-translate) | Traducción en navegador | OpenAI |
| 14 | [LangChain](#14-langchain) | Framework de agentes | OpenAI / Anthropic / Gemini |
| 15 | [LlamaIndex](#15-llamaindex) | Framework RAG / datos | OpenAI |

**¿Necesitas una clave primero?** Consigue una clave de prueba gratuita — ve
la sección *Get a test key* en el [README principal](../README.md). Todo lo
anterior asume que ya tienes una clave como `sk-...`.

---

## 1. ChatBox

Cliente de chat multiplataforma (macOS / Windows / Linux) y móvil.

**Escritorio**
1. Abre ChatBox → **Settings** (icono de engranaje).
2. **Model Provider** → **Add custom provider** (o "OpenAI / Custom").
3. Completa:
   - **API Host / Base URL**: `https://api.airai.cc/v1`
   - **API Key**: tu clave
   - **Model**: `gpt-4o` (o cualquier modelo enrutado)
4. Guarda y abre un chat nuevo para verificar.

**Móvil (iOS / Android)**
Misma ruta: Settings → Model Provider → Custom OpenAI → ingresa el host.

**Verificar**
Envía "hola" — una respuesta normal confirma que la ruta funciona.

---

## 2. CherryStudio

Cliente de escritorio multi-proveedor popular, con soporte MCP integrado.

**Proveedor OpenAI**
1. Settings → **Model Provider** → **OpenAI**.
2. Activa y define:
   - **API Address**: `https://api.airai.cc/v1`
   - **API Key**: tu clave
3. Haz clic en **Manage / Add model** y agrega lo que necesites.
4. Los modelos `o4-mini` / `o3` de razonamiento son seleccionables.

**Servidor MCP de Claude (opcional)**
Settings → **MCP Servers** → **Add** → usa un servidor SSE/HTTP apuntando al
endpoint MCP de la pasarela.

---

## 3. Cursor

Editor de código con IA. Usa **BYOK** (Bring Your Own Key).

1. **Settings** (⌘/Ctrl + ,) → busca **Models**.
2. Activa **Bring Your Own Key** (BYOK).
3. Define la URL base personalizada `https://api.airai.cc/v1` y pega tu clave.
4. En el selector de modelo escribe `gpt-4o`, `claude-3.5-sonnet`, etc.

**Truco del prefijo `new-`**
Antepón `new-` a un modelo (ej. `new-gpt-4o`) para forzar un contexto de
enrutamiento nuevo.

---

## 4. Cline (VS Code)

Agente de código autónomo como extensión de VS Code.

1. Instala **Cline**, abre su panel.
2. **Settings** → **API Provider** → **OpenAI-compatible**.
3. Completa:
   - **Base URL**: `https://api.airai.cc/v1`
   - **API Key**: tu clave
   - **Model ID**: `claude-3.5-sonnet` / `gpt-4o` / `deepseek-chat`

---

## 5. Codex

Agente de código en terminal de OpenAI (macOS / Linux / Windows-WSL).

Crea `~/.codex/config.toml`:

```toml
[model]
base_url = "https://api.airai.cc/v1"
api_key  = "YOUR_KEY"
model    = "gpt-4o"
```

**Alternativa — variables de entorno**
```bash
export OPENAI_BASE_URL="https://api.airai.cc/v1"
export OPENAI_API_KEY="YOUR_KEY"
codex
```

---

## 6. aider

Programador en pareja en terminal.

```bash
aider --openai-api-base https://api.airai.cc/v1 \
      --openai-api-key YOUR_KEY \
      --model gpt-4o
```

**Persistente — `.aider.conf.yml`**
```yaml
openai-api-base: https://api.airai.cc/v1
openai-api-key: YOUR_KEY
model: gpt-4o
```

---

## 7. Gemini CLI

CLI oficial de Gemini, apuntando a la **raíz nativa Gemini**. Ver
[`gemini-cli.md`](gemini-cli.md).

```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"
gemini
```

---

## 8. Claude Code

Agente Claude oficial de Anthropic, en la **raíz nativa Anthropic**. Ver
[`claude-code.md`](claude-code.md).

```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
claude
```

---

## 9. LobeChat

UI de chat open-source, ideal para auto-alojar.

**En la app**
1. Settings → **AI Provider** → **OpenAI**.
2. Activa y define: Base URL `https://api.airai.cc/v1` + clave.

**Auto-alojado (Docker / env)**
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_PROXY_URL="https://api.airai.cc/v1"
```

---

## 10. Dify

Plataforma open-source LLMOps para construir agentes y RAG.

1. **Settings** → **Model Provider**.
2. Agrega **OpenAI** (o "OpenAI-API-compatible").
3. Completa: API Key = tu clave, API Base = `https://api.airai.cc/v1`.
4. Úsalo en Apps / Workflows / Agents.

---

## 11. N8N

Automatización con nodo OpenAI.

**Opción A — nodo OpenAI**
Crea credenciales **OpenAI API** con Base URL `https://api.airai.cc/v1`.

**Opción B — nodo HTTP Request**
```json
{ "method": "POST",
  "url": "https://api.airai.cc/v1/chat/completions",
  "headers": {"Authorization": "Bearer YOUR_KEY", "Content-Type": "application/json"},
  "body": {"model": "gpt-4o", "messages": [{"role": "user", "content": "Hello"}]} }
```

---

## 12. NextChat

UI de chat ligera (antes ChatGPT-Next-Web).

```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_BASE_URL="https://api.airai.cc/v1"
```

Docker:
```bash
docker run -d -e OPENAI_API_KEY="YOUR_KEY" \
  -e OPENAI_BASE_URL="https://api.airai.cc/v1" -p 3000:3000 yidadaa/chatgpt-next-web
```

---

## 13. Immersive Translate

Extensión de navegador que traduce páginas con un LLM.

1. Ajustes → **Translation Service** → **OpenAI / Custom**.
2. Completa: API URL `https://api.airai.cc/v1`, API Key tu clave,
   Model `gpt-4o-mini`.

**Tip**: usa `gpt-4o-mini` — la traducción es de alto volumen y baja
complejidad, la carga más barata.

---

## 14. LangChain

Framework de agentes / RAG (Python; JS es análogo).

**Dialecto OpenAI**
```python
from langchain_openai import ChatOpenAI
llm = ChatOpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
```

**Dialecto Anthropic (nativo)**
```python
from langchain_anthropic import ChatAnthropic
llm = ChatAnthropic(base_url="https://api.airai.cc", api_key="YOUR_KEY", model="claude-3.5-sonnet")
```

**Dialecto Gemini (nativo)**
```python
from langchain_google_genai import ChatGoogleGenerativeAI
llm = ChatGoogleGenerativeAI(base_url="https://api.airai.cc", google_api_key="YOUR_KEY", model="gemini-2.5-pro")
```

---

## 15. LlamaIndex

Framework de datos para RAG / agentes (Python).

```python
from llama_index.llms.openai import OpenAI
llm = OpenAI(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
print(llm.complete("hello"))
```

**Embeddings para RAG**
```python
from llama_index.embeddings.openai import OpenAIEmbedding
embed = OpenAIEmbedding(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY",
                        model="text-embedding-3-small")
```

---

## Regla general para lo no listado

Si una herramienta habla **OpenAI / Anthropic / Gemini**, funciona aquí:

| Habla… | Define esto | A esto |
|---|---|---|
| OpenAI API | `base_url` / `OPENAI_BASE_URL` | `https://api.airai.cc/v1` |
| Anthropic (Claude) | `ANTHROPIC_BASE_URL` | `https://api.airai.cc` |
| Gemini | `GOOGLE_GEMINI_BASE_URL` | `https://api.airai.cc` |

Conserva tu clave, cambia la URL y todos los modelos quedan disponibles. Para
ejemplos a nivel API (curl / Python / Node, imágenes, audio, embeddings,
realtime, tareas async) ve los otros archivos de [`examples/`](../examples/).
