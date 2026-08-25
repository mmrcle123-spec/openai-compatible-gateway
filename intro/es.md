# Pasarela API LLM Multi-Protocolo — OpenAI / Claude / Gemini Nativo — 80% Más Barato, 468+ Modelos

> ## 🔥 Reduce tu factura de API hasta un **80%** · 🧩 **468+ modelos, multi-protocolo** · 💸 USDT, sin tarjeta, sin KYC
>
> Una pasarela LLM **multi-protocolo**. Habla los formatos **nativos de OpenAI,
> Anthropic Claude y Google Gemini** — no solo el chat de OpenAI. Una cuenta,
> todos los dialectos. **GPT · Claude · DeepSeek · Gemini · imagen · audio ·
> embedding · vídeo · música** detrás de una sola interfaz.

**Resumen — por qué los equipos apuntan aquí**

- 💰 **Hasta 80% más barato** que el precio de lista oficial (hasta ~90% en tramos de alto volumen)
- 🧩 **468+ modelos, una cuenta** — deja de cablear un proveedor distinto por ruta
- ⚡ **Multi-protocolo nativo** — OpenAI, Anthropic Claude y Gemini nativos, más shims Replicate / Fal / Suno
- 🤖 **Cobertura de capacidades** — chat, streaming, visión, function calling, embeddings, audio (ASR+TTS), imagen, vídeo, música, realtime
- 🌍 **USDT (TRC-20)** por defecto, **sin KYC, sin cuota mensual**, pago por uso
- 🧰 **Drop-in para 15+ clientes** — ChatBox, CherryStudio, Cursor, Cline, Codex, aider, LobeChat, Dify, N8N, NextChat, LangChain, LlamaIndex y más

## Formatos de API soportados

Esta pasarela **no** es "solo OpenAI con una capa de traducción". Expone
**endpoints nativos** para los tres SDK principales, así usas la librería
oficial de cada proveedor sin cambios.

| Protocolo | Base URL | Cómo lo llamas | Notas |
|---|---|---|---|
| **OpenAI** | `https://api.airai.cc/v1` | Pon `base_url` en el SDK de OpenAI | chat, streaming (SSE), visión, function calling, embeddings, audio, imágenes, realtime |
| **Anthropic Claude** | `https://api.airai.cc` (raíz) | Pon `ANTHROPIC_BASE_URL` en el SDK de Anthropic / Claude Code | API Messages nativa, streaming, tool use |
| **Google Gemini** | `https://api.airai.cc` (raíz) | Pon `GOOGLE_GEMINI_BASE_URL` en el CLI/SDK de Gemini | generateContent nativo |
| **Replicate** | `https://api.airai.cc/replicate` | Cliente compatible con Replicate | muchos modelos open-weight tras un shim |
| **Fal.ai** | `https://api.airai.cc/fal-ai/{model}` | Cliente compatible con Fal | imagen / vídeo tras un shim |
| **Suno** | `https://api.airai.cc/suno/...` | Cliente compatible con Suno | generación de música |

> **¿Por qué la raíz para Claude y Gemini?** Los SDK de Anthropic y Gemini
> envían peticiones a la raíz del proveedor (p. ej. `https://api.anthropic.com`),
> no a una sub-ruta `/v1`. Apunta `ANTHROPIC_BASE_URL` / `GOOGLE_GEMINI_BASE_URL`
> a `https://api.airai.cc` y la pasarela sirve la ruta nativa. El SDK de OpenAI,
> en cambio, espera `/v1`, así que usa `https://api.airai.cc/v1`.

## Qué puedes construir

| Capacidad | Ejemplo de modelos |
|---|---|
| Chat (texto) | gpt-4o, claude-3.5-sonnet, deepseek-chat, gemini-1.5-pro |
| Streaming (SSE) | todos los modelos de chat |
| Visión (imagen de entrada) | gpt-4o, claude-3.5-sonnet, gemini-1.5-pro |
| Razonamiento (o-series) | o1, o3, o4-mini (`low`/`medium`/`high`) |
| Function calling / tool use | todos los modelos capaces |
| Embeddings | text-embedding-3-small, text-embedding-3-large, ada-002 |
| Audio (ASR + TTS) | whisper-1, tts-1 (6 voces) |
| Imagen | DALL·E 3, gpt-image-1, FLUX, Seedream, imagen-4, qwen-image |
| Realtime (websocket) | gpt-4o-realtime |
| Vídeo (asíncrono) | Kling, Luma, MiniMax, Jimeng, Fal |
| Música | Suno |

## Modelos

Las grandes familias enrutadas a través de esta pasarela:

- **GPT** — gpt-4o, gpt-4o-mini, gpt-4.1, o1 / o3 / o4-mini (razonamiento)
- **Claude** — claude-3.5-sonnet, claude-3.7-sonnet, claude-opus-4, claude-haiku
- **DeepSeek** — deepseek-chat, deepseek-reasoner
- **Gemini** — gemini-1.5-pro, gemini-2.0-flash, gemini-2.5-pro
- **Imagen** — DALL·E 3, gpt-image-1, FLUX.1, Seedream, imagen-4, qwen-image
- **Audio** — whisper-1 (ASR), tts-1 (TTS, 6 voces)
- **Embeddings** — text-embedding-3-small / -3-large, text-embedding-ada-002
- **Realtime** — gpt-4o-realtime (websocket)
- **Vídeo** — Kling, Luma, MiniMax, Jimeng, Fal (asíncrono)
- **Música** — Suno

Referencia completa: [`../models.md`](../models.md).

## Software y clientes (tutoriales)

Cada cliente de abajo fue verificado contra esta pasarela. La configuración
siempre es la misma idea: apunta su `base_url` (estilo OpenAI) o su variable de
entorno de proveedor (Claude / Gemini) a las direcciones de arriba.

| Cliente / herramienta | Protocolo | Dónde configurar |
|---|---|---|
| **ChatBox** | OpenAI | API personalizada + base URL |
| **CherryStudio** | OpenAI + Claude MCP | ajustes de modelo; URL del servidor MCP |
| **Cursor** | OpenAI (BYOK) | truco del prefijo `new-` |
| **Cline** | OpenAI | base URL compatible con OpenAI |
| **Codex** | OpenAI | `config.toml` (3 plataformas) |
| **aider** | OpenAI | `--openai-api-base` |
| **Gemini CLI** | Gemini nativo | `GOOGLE_GEMINI_BASE_URL` |
| **Claude Code** | Anthropic nativo | `ANTHROPIC_BASE_URL` |
| **LobeChat** | OpenAI | ajustes del proveedor |
| **Dify** | OpenAI | configuración del proveedor de modelo |
| **N8N** | OpenAI | nodo HTTP / OpenAI |
| **NextChat** | OpenAI | variable `BASE_URL` |
| **Immersive Translate** | OpenAI | base de API de traducción |
| **LangChain** | OpenAI / Anthropic / Gemini | `base_url` del modelo de chat |
| **LlamaIndex** | OpenAI | `OPENAI_BASE_URL` |

Guía paso a paso de los 15: [`../examples/frontends.md`](../examples/frontends.md).

## Inicio rápido

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",          # al registrarte o por TG @mmrcle
)
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role":"user","content":"Hola"}],
)
print(r.choices[0].message.content)
```

Claude nativo: `export ANTHROPIC_BASE_URL="https://api.airai.cc"`. Gemini
nativo: `export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"`.

- Python: [`../examples/python.md`](../examples/python.md)
- Node: [`../examples/node.md`](../examples/node.md)
- curl: [`../examples/curl.md`](../examples/curl.md)
- Claude Code: [`../examples/claude-code.md`](../examples/claude-code.md)
- Gemini CLI: [`../examples/gemini-cli.md`](../examples/gemini-cli.md)
- Imagen / audio / embeddings / realtime / tareas asíncronas: [`../examples/`](../examples/)

## Obtén una clave de prueba

1. **Regístrate en la pasarela** → se emiten créditos de prueba al registrarse,
   sin tarjeta. Úsalos para validar latencia, cobertura de modelos y calidad.
2. **Escríbenos por TG:** `@mmrcle` — para proveedor *white-label* / suministro
   mayorista, claves de prueba o dudas de integración.

## Precios

Tres tramos, expresados como **multiplicador del precio de lista oficial**:

| Tramo | Multiplicador | vs oficial | Para |
|---|---|---|---|
| **Standard** | 0.3× | ~70% menos | desarrolladores, pago por uso |
| **Pro** | 0.15× | ~85% menos | equipos con volumen estable |
| **Wholesale** | 0.09× | ~91% menos | alto volumen / revendedores |

Modelo de **grupo de tarifas**: cada familia (chat, razonamiento, visión,
imagen, audio, embedding, vídeo, música, realtime) lleva un pequeño ajuste sobre
el multiplicador de tu tramo. Detalle: [`../PRICING.md`](../PRICING.md).

## Región y disponibilidad

La disponibilidad es **según los términos de servicio de la pasarela**. No se
hace ninguna afirmación geográfica; consulta los términos para tu región antes
de enrutar tráfico de producción.

## Liquidación

- **USDT** (TRC-20) por defecto — sin tarjeta, sin KYC.
- Otras criptos (BTC, etc.) para cuentas **mayoristas / grandes**.

## Preguntas frecuentes

**¿Es esto solo un proxy de OpenAI?**
No. Expone endpoints nativos de Anthropic y Gemini, así puedes seguir usando el
SDK oficial de cada proveedor. También hace de shim para Replicate / Fal / Suno.

**¿Necesito reescribir mi código?**
No. Si tu cliente ya habla OpenAI / Anthropic / Gemini, solo cambias la base URL
(o la variable de entorno del proveedor). Nada más.

**¿Cómo lo verifico antes de pagar?**
Regístrate → créditos de prueba → ejecuta tus cargas contra el endpoint.

🔗 Documentación completa en inglés: [README.md](../README.md) · Ejemplos: [examples/](../examples/) · Modelos: [models.md](../models.md)
