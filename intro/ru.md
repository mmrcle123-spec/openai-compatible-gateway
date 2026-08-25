# Мультипротокольный LLM API-шлюз — OpenAI / Claude / Gemini Native — дешевле на 80%, 468+ моделей

> ## 🔥 Сократите счёт за API до **80%** · 🧩 **468+ моделей, мультипротокол** · 💸 USDT, без карты, без KYC
>
> **Мультипротокольный** LLM-шлюз. Говорит на **нативных форматах OpenAI,
> Anthropic Claude и Google Gemini** — не только чат OpenAI. Один аккаунт, все
> диалекты. **GPT · Claude · DeepSeek · Gemini · изображения · аудио · embedding ·
> видео · музыка** за единым интерфейсом.

**Кратко — почему команды подключают сюда**

- 💰 **До 80% дешевле** официальной цены (до ~90% на высоком объёме)
- 🧩 **468+ моделей, один аккаунт** — больше нет отдельного провайдера на маршрут
- ⚡ **Мультипротокол native** — OpenAI, Anthropic Claude и Gemini native, плюс shim'ы Replicate / Fal / Suno
- 🤖 **Полный охват возможностей** — чат, streaming, визуальный ввод, function calling, embeddings, аудио (ASR+TTS), изображения, видео, музыка, realtime
- 🌍 **USDT (TRC-20)** по умолчанию, **без KYC, без абонентской платы**, оплата за использование
- 🧰 **Drop-in для 15+ клиентов** — ChatBox, CherryStudio, Cursor, Cline, Codex, aider, LobeChat, Dify, N8N, NextChat, LangChain, LlamaIndex и др.

## Поддерживаемые форматы API

Этот шлюз — **не** «только OpenAI с переводом». Он предоставляет **нативные
endpoint'ы** для трёх главных SDK, поэтому вы используете официальную библиотеку
каждого провайдера без изменений.

| Протокол | Base URL | Как вызывать | Примечания |
|---|---|---|---|
| **OpenAI** | `https://api.airai.cc/v1` | указать `base_url` в SDK OpenAI | чат, streaming (SSE), визуальный ввод, function calling, embeddings, аудио, изображения, realtime |
| **Anthropic Claude** | `https://api.airai.cc` (корень) | указать `ANTHROPIC_BASE_URL` в SDK Anthropic / Claude Code | нативный Messages API, streaming, tool use |
| **Google Gemini** | `https://api.airai.cc` (корень) | указать `GOOGLE_GEMINI_BASE_URL` в CLI/SDK Gemini | нативный generateContent |
| **Replicate** | `https://api.airai.cc/replicate` | клиент, совместимый с Replicate | многие open-weight модели за одним shim'ом |
| **Fal.ai** | `https://api.airai.cc/fal-ai/{model}` | клиент, совместимый с Fal | изображения / видео за shim'ом |
| **Suno** | `https://api.airai.cc/suno/...` | клиент, совместимый с Suno | генерация музыки |

> **Почему корень для Claude и Gemini?** SDK Anthropic и Gemini отправляют
> запросы на корень провайдера (напр. `https://api.anthropic.com`), а не на
> под-путь `/v1`. Направьте `ANTHROPIC_BASE_URL` / `GOOGLE_GEMINI_BASE_URL` на
> `https://api.airai.cc` — шлюз отдаёт нативный маршрут. А SDK OpenAI ждёт `/v1`,
> поэтому используйте `https://api.airai.cc/v1`.

## Что можно построить

| Возможность | Примеры моделей |
|---|---|
| Чат (текст) | gpt-4o, claude-3.5-sonnet, deepseek-chat, gemini-1.5-pro |
| Streaming (SSE) | все чат-модели |
| Визуальный ввод | gpt-4o, claude-3.5-sonnet, gemini-1.5-pro |
| Рассуждение (o-series) | o1, o3, o4-mini (`low`/`medium`/`high`) |
| Function calling / tool use | все capable модели |
| Embeddings | text-embedding-3-small, text-embedding-3-large, ada-002 |
| Аудио (ASR + TTS) | whisper-1, tts-1 (6 голосов) |
| Изображения | DALL·E 3, gpt-image-1, FLUX, Seedream, imagen-4, qwen-image |
| Realtime (websocket) | gpt-4o-realtime |
| Видео (асинхронно) | Kling, Luma, MiniMax, Jimeng, Fal |
| Музыка | Suno |

## Модели

Большие семейства, маршрутизируемые через этот шлюз:

- **GPT** — gpt-4o, gpt-4o-mini, gpt-4.1, o1 / o3 / o4-mini (рассуждение)
- **Claude** — claude-3.5-sonnet, claude-3.7-sonnet, claude-opus-4, claude-haiku
- **DeepSeek** — deepseek-chat, deepseek-reasoner
- **Gemini** — gemini-1.5-pro, gemini-2.0-flash, gemini-2.5-pro
- **Изображения** — DALL·E 3, gpt-image-1, FLUX.1, Seedream, imagen-4, qwen-image
- **Аудио** — whisper-1 (ASR), tts-1 (TTS, 6 голосов)
- **Embeddings** — text-embedding-3-small / -3-large, text-embedding-ada-002
- **Realtime** — gpt-4o-realtime (websocket)
- **Видео** — Kling, Luma, MiniMax, Jimeng, Fal (асинхронно)
- **Музыка** — Suno

Полная справка: [`../models.md`](../models.md).

## ПО и клиенты (обучение)

Каждый клиент ниже проверен против этого шлюза. Настройка всегда одна и та же:
направьте его `base_url` (стиля OpenAI) или переменную окружения провайдера
(Claude / Gemini) на адреса выше.

| Клиент / инструмент | Протокол | Где настраивать |
|---|---|---|
| **ChatBox** | OpenAI | пользовательский API + base URL |
| **CherryStudio** | OpenAI + Claude MCP | настройки модели; URL MCP-сервера |
| **Cursor** | OpenAI (BYOK) | трюк с префиксом `new-` |
| **Cline** | OpenAI | OpenAI-совместимый base URL |
| **Codex** | OpenAI | `config.toml` (3 платформы) |
| **aider** | OpenAI | `--openai-api-base` |
| **Gemini CLI** | Gemini native | `GOOGLE_GEMINI_BASE_URL` |
| **Claude Code** | Anthropic native | `ANTHROPIC_BASE_URL` |
| **LobeChat** | OpenAI | настройки провайдера |
| **Dify** | OpenAI | конфигурация провайдера моделей |
| **N8N** | OpenAI | HTTP / OpenAI узел |
| **NextChat** | OpenAI | переменная `BASE_URL` |
| **Immersive Translate** | OpenAI | base переводческого API |
| **LangChain** | OpenAI / Anthropic / Gemini | `base_url` чат-модели |
| **LlamaIndex** | OpenAI | `OPENAI_BASE_URL` |

Пошагово для всех 15: [`../examples/frontends.md`](../examples/frontends.md).

## Быстрый старт

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",          # при регистрации или в TG @mmrcle
)
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role":"user","content":"Привет"}],
)
print(r.choices[0].message.content)
```

Нативный Claude: `export ANTHROPIC_BASE_URL="https://api.airai.cc"`. Нативный
Gemini: `export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"`.

- Python: [`../examples/python.md`](../examples/python.md)
- Node: [`../examples/node.md`](../examples/node.md)
- curl: [`../examples/curl.md`](../examples/curl.md)
- Claude Code: [`../examples/claude-code.md`](../examples/claude-code.md)
- Gemini CLI: [`../examples/gemini-cli.md`](../examples/gemini-cli.md)
- Изображения / аудио / embeddings / realtime / асинхронные задачи: [`../examples/`](../examples/)

## Получить тестовый ключ

1. **Зарегистрируйтесь на шлюзе** → при регистрации выдаются тестовые кредиты
   без карты. Используйте их, чтобы проверить задержку, покрытие моделей и качество.
2. **Напишите в TG:** `@mmrcle` — по вопросам *white-label* / оптовых поставок,
   тестовых ключей или интеграции.

## Цены

Три уровня, выражены как **множитель официальной розничной цены**:

| Уровень | Множитель | к официальной | Для |
|---|---|---|---|
| **Standard** | 0.3× | ~70% дешевле | разработчики, оплата за использование |
| **Pro** | 0.15× | ~85% дешевле | команды с устойчивым объёмом |
| **Wholesale** | 0.09× | ~91% дешевле | высокий объём / реселлеры |

Модель **групповых тарифов**: каждая семья (чат, рассуждение, визуальный ввод,
изображения, аудио, embedding, видео, музыка, realtime) несёт небольшую надбавку
к множителю вашего уровня. Детали: [`../PRICING.md`](../PRICING.md).

## Регион и доступность

Доступность определяется **условиями обслуживания шлюза**. Никаких географических
заявлений не делается; перед продакшен-трафиком проверьте условия для своего региона.

## Расчёт

- По умолчанию **USDT** (TRC-20) — без карты, без KYC.
- Для крупных / оптовых аккаунтов возможны другие криптовалюты (BTC и т.п.).

## Частые вопросы

**Это просто OpenAI-прокси?**
Нет. Предоставляет нативные endpoint'ы Anthropic и Gemini, поэтому можно
продолжать использовать официальный SDK каждого провайдера. Также делает shim для
Replicate / Fal / Suno.

**Нужно ли переписывать код?**
Нет. Если ваш клиент говорит на API OpenAI / Anthropic / Gemini, меняются только
`base_url` (или переменная окружения провайдера). Ничего больше.

**Как проверить до оплаты?**
Регистрация → тестовые кредиты → прогоните свои задачи через endpoint.

🔗 Полная документация на английском: [README.md](../README.md) · Примеры: [examples/](../examples/) · Модели: [models.md](../models.md)
