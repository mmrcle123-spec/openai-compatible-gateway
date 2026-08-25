# Клиенты и инструменты — пошаговые руководства

Эта страница — пошаговое руководство по настройке **15 клиентов и
инструментов разработчика**, которые работают с шлюзом. Каждое руководство
написано по реальному интерфейсу шлюза. Выберите инструмент, выполните шаги —
и через две минуты всё заработает.

> **Правило, которое покрывает всё**
> Направьте **базовый URL, совместимый с OpenAI**, вашего клиента на
> `https://api.airai.cc/v1`, ИЛИ задайте **переменную окружения провайдера**
> на нативный корень для Claude / Gemini:
> - Claude: `ANTHROPIC_BASE_URL=https://api.airai.cc`
> - Gemini: `GOOGLE_GEMINI_BASE_URL=https://api.airai.cc`
>
> Тот же интерфейс, совместимый с OpenAI, тот же ключ, за ним 468+ моделей.

---

## Быстрое содержание

| # | Клиент / инструмент | Лучше всего для | Протокол |
|---|---|---|---|
| 1 | [ChatBox](#1-chatbox) | Чат на ПК / мобильном | OpenAI |
| 2 | [CherryStudio](#2-cherrystudio) | Мульти-провайдер + MCP | OpenAI + Claude MCP |
| 3 | [Cursor](#3-cursor) | ИИ-редактор кода (BYOK) | OpenAI |
| 4 | [Cline](#4-cline-vs-code) | Код-агент в VS Code | OpenAI |
| 5 | [Codex](#5-codex) | Код-агент в терминале | OpenAI |
| 6 | [aider](#6-aider) | Парное программирование в CLI | OpenAI |
| 7 | [Gemini CLI](#7-gemini-cli) | Нативный CLI Google Gemini | Gemini native |
| 8 | [Claude Code](#8-claude-code) | Нативный CLI Anthropic | Anthropic native |
| 9 | [LobeChat](#9-lobechat) | Self-hosted чат UI | OpenAI |
| 10 | [Dify](#10-dify) | LLMOps / конструктор агентов | OpenAI |
| 11 | [N8N](#11-n8n) | Автоматизация сценариев | OpenAI |
| 12 | [NextChat](#12-nextchat) | Лёгкий веб-чат | OpenAI |
| 13 | [Immersive Translate](#13-immersive-translate) | Перевод в браузере | OpenAI |
| 14 | [LangChain](#14-langchain) | Фреймворк агентов | OpenAI / Anthropic / Gemini |
| 15 | [LlamaIndex](#15-llamaindex) | Фреймворк RAG / данных | OpenAI |

**Нужен ключ сначала?** Получите бесплатный тестовый ключ — раздел
*Get a test key* в [основном README](../README.md).

---

## 1. ChatBox

Кроссплатформенный (macOS / Windows / Linux) и мобильный чат-клиент.

**ПК**
1. Откройте ChatBox → **Settings** (шестерёнка).
2. **Model Provider** → **Add custom provider**.
3. Заполните: API Host `https://api.airai.cc/v1`, API Key ваш ключ, Model `gpt-4o`.
4. Сохраните, начните новый чат.

**Мобильный (iOS / Android)**: тот же путь.

**Проверка**: отправьте "привет" — ответ подтверждает работу.

---

## 2. CherryStudio

Популярный мульти-провайдерный клиент с поддержкой MCP.

**Провайдер OpenAI**
1. Settings → **Model Provider** → **OpenAI**.
2. Включите, задайте API Address `https://api.airai.cc/v1` + API Key.
3. **Manage / Add model** — добавьте нужное.
4. Модели рассуждения `o4-mini` / `o3` доступны.

**MCP-сервер Claude (опц.)**: Settings → **MCP Servers** → **Add** → SSE/HTTP
сервер на MCP-эндпоинт шлюза.

---

## 3. Cursor

ИИ-редактор кода. Использует **BYOK**.

1. **Settings** (⌘/Ctrl + ,) → найдите **Models**.
2. Включите **Bring Your Own Key** (BYOK).
3. Укажите базовый URL `https://api.airai.cc/v1` и вставьте ключ.
4. В выборе модели введите `gpt-4o`, `claude-3.5-sonnet`.

**Трюк с префиксом `new-`**: добавьте `new-` к модели (напр. `new-gpt-4o`).

---

## 4. Cline (VS Code)

Автономный код-агент как расширение VS Code.

1. Установите **Cline**, откройте панель.
2. **Settings** → **API Provider** → **OpenAI-compatible**.
3. Base URL `https://api.airai.cc/v1`, API Key, Model ID `claude-3.5-sonnet` / `gpt-4o` / `deepseek-chat`.

---

## 5. Codex

Терминальный код-агент OpenAI (macOS / Linux / Windows-WSL).

Создайте `~/.codex/config.toml`:
```toml
[model]
base_url = "https://api.airai.cc/v1"
api_key  = "YOUR_KEY"
model    = "gpt-4o"
```
**Альтернатива — переменные окружения**: `export OPENAI_BASE_URL="https://api.airai.cc/v1"` + `export OPENAI_API_KEY="YOUR_KEY"`.

---

## 6. aider

Парное программирование в терминале.
```bash
aider --openai-api-base https://api.airai.cc/v1 --openai-api-key YOUR_KEY --model gpt-4o
```
**Постоянно — `.aider.conf.yml`**: `openai-api-base: https://api.airai.cc/v1` / `openai-api-key: YOUR_KEY` / `model: gpt-4o`.

---

## 7. Gemini CLI

Официальный Gemini CLI на **нативном корне Gemini**. См. [`gemini-cli.md`](gemini-cli.md).
```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"
gemini
```

---

## 8. Claude Code

Официальный агент Claude от Anthropic на **нативном корне Anthropic**. См. [`claude-code.md`](claude-code.md).
```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
claude
```

---

## 9. LobeChat

Open-source чат UI, удобен для self-host.

**В приложении**: Settings → **AI Provider** → **OpenAI** → Base URL `https://api.airai.cc/v1` + ключ.

**Self-hosted (Docker / env)**:
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_PROXY_URL="https://api.airai.cc/v1"
```

---

## 10. Dify

Open-source платформа LLMOps для агентов и RAG.

1. **Settings** → **Model Provider**.
2. Добавьте **OpenAI** (или "OpenAI-API-compatible").
3. API Key ваш ключ, API Base `https://api.airai.cc/v1`.
4. Используйте в Apps / Workflows / Agents.

---

## 11. N8N

Автоматизация с узлом OpenAI.

**Вариант A — узел OpenAI**: учётные данные **OpenAI API** с Base URL `https://api.airai.cc/v1`.

**Вариант B — узел HTTP Request**:
```json
{ "method": "POST", "url": "https://api.airai.cc/v1/chat/completions",
  "headers": {"Authorization": "Bearer YOUR_KEY", "Content-Type": "application/json"},
  "body": {"model": "gpt-4o", "messages": [{"role": "user", "content": "Hello"}]} }
```

---

## 12. NextChat

Лёгкий веб-чат (бывший ChatGPT-Next-Web).
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

Браузерное расширение для перевода страниц через LLM.

1. Настройки → **Translation Service** → **OpenAI / Custom**.
2. API URL `https://api.airai.cc/v1`, API Key ваш ключ, Model `gpt-4o-mini`.

**Совет**: используйте `gpt-4o-mini` — перевод высокообъёмный и простой.

---

## 14. LangChain

Фреймворк агентов / RAG (Python; JS аналогично).

**Диалект OpenAI**
```python
from langchain_openai import ChatOpenAI
llm = ChatOpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
```
**Диалект Anthropic (нативный)**
```python
from langchain_anthropic import ChatAnthropic
llm = ChatAnthropic(base_url="https://api.airai.cc", api_key="YOUR_KEY", model="claude-3.5-sonnet")
```
**Диалект Gemini (нативный)**
```python
from langchain_google_genai import ChatGoogleGenerativeAI
llm = ChatGoogleGenerativeAI(base_url="https://api.airai.cc", google_api_key="YOUR_KEY", model="gemini-2.5-pro")
```

---

## 15. LlamaIndex

Фреймворк данных для RAG / агентов (Python).
```python
from llama_index.llms.openai import OpenAI
llm = OpenAI(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
print(llm.complete("hello"))
```
**Эмбеддинги для RAG**
```python
from llama_index.embeddings.openai import OpenAIEmbedding
embed = OpenAIEmbedding(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="text-embedding-3-small")
```

---

## Общее правило для остального

Если инструмент говорит на **OpenAI / Anthropic / Gemini**, он здесь работает:

| Говорит… | Задайте | В |
|---|---|---|
| OpenAI API | `base_url` / `OPENAI_BASE_URL` | `https://api.airai.cc/v1` |
| Anthropic (Claude) | `ANTHROPIC_BASE_URL` | `https://api.airai.cc` |
| Gemini | `GOOGLE_GEMINI_BASE_URL` | `https://api.airai.cc` |

Сохраните ключ, смените URL — и все модели станут доступны. Примеры на уровне
API (curl / Python / Node, изображения, аудио, эмбеддинги, realtime, async)
смотрите в других файлах папки [`examples/`](../examples/).
