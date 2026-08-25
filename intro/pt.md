# Gateway de API LLM Multi-Protocolo — OpenAI / Claude / Gemini Nativo — 80% Mais Barato, 468+ Modelos

> ## 🔥 Corte sua conta de API em até **80%** · 🧩 **468+ modelos, multi-protocolo** · 💸 USDT, sem cartão, sem KYC
>
> Um gateway LLM **multi-protocolo**. Fala os formatos **nativos da OpenAI,
> Anthropic Claude e Google Gemini** — não apenas o chat da OpenAI. Uma conta,
> todos os dialetos. **GPT · Claude · DeepSeek · Gemini · imagem · áudio ·
> embedding · vídeo · música** atrás de uma só interface.

**Resumo — por que equipes apontam para cá**

- 💰 **Até 80% mais barato** que o preço de lista oficial (até ~90% no tier de alto volume)
- 🧩 **468+ modelos, uma conta** — pare de conectar um provedor diferente por rota
- ⚡ **Multi-protocolo nativo** — OpenAI, Anthropic Claude e Gemini nativos, mais shims Replicate / Fal / Suno
- 🤖 **Cobertura de capacidades** — chat, streaming, visão, function calling, embeddings, áudio (ASR+TTS), imagem, vídeo, música, realtime
- 🌍 **USDT (TRC-20)** por padrão, **sem KYC, sem mensalidade**, pagamento por uso
- 🧰 **Drop-in para 15+ clientes** — ChatBox, CherryStudio, Cursor, Cline, Codex, aider, LobeChat, Dify, N8N, NextChat, LangChain, LlamaIndex e mais

## Formatos de API suportados

Este gateway **não** é "só OpenAI com uma camada de tradução". Expõe
**endpoints nativos** para os três SDKs principais, então você usa a biblioteca
oficial de cada provedor sem mudanças.

| Protocolo | Base URL | Como chamar | Notas |
|---|---|---|---|
| **OpenAI** | `https://api.airai.cc/v1` | Defina `base_url` no SDK da OpenAI | chat, streaming (SSE), visão, function calling, embeddings, áudio, imagens, realtime |
| **Anthropic Claude** | `https://api.airai.cc` (raiz) | Defina `ANTHROPIC_BASE_URL` no SDK da Anthropic / Claude Code | API Messages nativa, streaming, tool use |
| **Google Gemini** | `https://api.airai.cc` (raiz) | Defina `GOOGLE_GEMINI_BASE_URL` no CLI/SDK do Gemini | generateContent nativo |
| **Replicate** | `https://api.airai.cc/replicate` | Cliente compatível com Replicate | muitos modelos open-weight num shim |
| **Fal.ai** | `https://api.airai.cc/fal-ai/{model}` | Cliente compatível com Fal | imagem / vídeo num shim |
| **Suno** | `https://api.airai.cc/suno/...` | Cliente compatível com Suno | geração de música |

> **Por que a raiz para Claude e Gemini?** Os SDKs da Anthropic e Gemini enviam
> requisições para a raiz do provedor (ex. `https://api.anthropic.com`), não para
> uma sub-rota `/v1`. Aponte `ANTHROPIC_BASE_URL` / `GOOGLE_GEMINI_BASE_URL` para
> `https://api.airai.cc` e o gateway serve a rota nativa. O SDK da OpenAI, por
> outro lado, espera `/v1`, então use `https://api.airai.cc/v1`.

## O que você pode construir

| Capacidade | Exemplo de modelos |
|---|---|
| Chat (texto) | gpt-4o, claude-3.5-sonnet, deepseek-chat, gemini-1.5-pro |
| Streaming (SSE) | todos os modelos de chat |
| Visão (imagem de entrada) | gpt-4o, claude-3.5-sonnet, gemini-1.5-pro |
| Raciocínio (o-series) | o1, o3, o4-mini (`low`/`medium`/`high`) |
| Function calling / tool use | todos os modelos capazes |
| Embeddings | text-embedding-3-small, text-embedding-3-large, ada-002 |
| Áudio (ASR + TTS) | whisper-1, tts-1 (6 vozes) |
| Imagem | DALL·E 3, gpt-image-1, FLUX, Seedream, imagen-4, qwen-image |
| Realtime (websocket) | gpt-4o-realtime |
| Vídeo (assíncrono) | Kling, Luma, MiniMax, Jimeng, Fal |
| Música | Suno |

## Modelos

As grandes famílias roteadas por este gateway:

- **GPT** — gpt-4o, gpt-4o-mini, gpt-4.1, o1 / o3 / o4-mini (raciocínio)
- **Claude** — claude-3.5-sonnet, claude-3.7-sonnet, claude-opus-4, claude-haiku
- **DeepSeek** — deepseek-chat, deepseek-reasoner
- **Gemini** — gemini-1.5-pro, gemini-2.0-flash, gemini-2.5-pro
- **Imagem** — DALL·E 3, gpt-image-1, FLUX.1, Seedream, imagen-4, qwen-image
- **Áudio** — whisper-1 (ASR), tts-1 (TTS, 6 vozes)
- **Embeddings** — text-embedding-3-small / -3-large, text-embedding-ada-002
- **Realtime** — gpt-4o-realtime (websocket)
- **Vídeo** — Kling, Luma, MiniMax, Jimeng, Fal (assíncrono)
- **Música** — Suno

Referência completa: [`../models.md`](../models.md).

## Software e clientes (tutoriais)

Cada cliente abaixo foi verificado contra este gateway. A configuração é sempre
a mesma ideia: aponte sua `base_url` (estilo OpenAI) ou sua variável de ambiente
de provedor (Claude / Gemini) para os endereços acima.

| Cliente / ferramenta | Protocolo | Onde configurar |
|---|---|---|
| **ChatBox** | OpenAI | API personalizada + base URL |
| **CherryStudio** | OpenAI + Claude MCP | configurações de modelo; URL do servidor MCP |
| **Cursor** | OpenAI (BYOK) | truque do prefixo `new-` |
| **Cline** | OpenAI | base URL compatível com OpenAI |
| **Codex** | OpenAI | `config.toml` (3 plataformas) |
| **aider** | OpenAI | `--openai-api-base` |
| **Gemini CLI** | Gemini nativo | `GOOGLE_GEMINI_BASE_URL` |
| **Claude Code** | Anthropic nativo | `ANTHROPIC_BASE_URL` |
| **LobeChat** | OpenAI | configurações do provedor |
| **Dify** | OpenAI | configuração do provedor de modelo |
| **N8N** | OpenAI | nó HTTP / OpenAI |
| **NextChat** | OpenAI | variável `BASE_URL` |
| **Immersive Translate** | OpenAI | base de API de tradução |
| **LangChain** | OpenAI / Anthropic / Gemini | `base_url` do modelo de chat |
| **LlamaIndex** | OpenAI | `OPENAI_BASE_URL` |

Passo a passo dos 15: [`../examples/frontends.md`](../examples/frontends.md).

## Início rápido

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",          # ao se registrar ou via TG @mmrcle
)
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role":"user","content":"Olá"}],
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
- Imagem / áudio / embeddings / realtime / tarefas assíncronas: [`../examples/`](../examples/)

## Obtenha uma chave de teste

1. **Registre-se no gateway** → créditos de teste são emitidos no cadastro, sem
   cartão. Use-os para validar latência, cobertura de modelos e qualidade.
2. **Fale conosco no TG:** `@mmrcle` — para fornecimento *white-label* / atacado,
   chaves de teste ou dúvidas de integração.

## Preços

Três tiers, expressos como **multiplicador do preço de lista oficial**:

| Tier | Multiplicador | vs oficial | Para |
|---|---|---|---|
| **Standard** | 0.3× | ~70% menos | desenvolvedores, pago por uso |
| **Pro** | 0.15× | ~85% menos | equipes com volume estável |
| **Wholesale** | 0.09× | ~91% menos | alto volume / revendedores |

Modelo de **grupo de tarifas**: cada família (chat, raciocínio, visão, imagem,
áudio, embedding, vídeo, música, realtime) leva um pequeno ajuste sobre o
multiplicador do seu tier. Detalhe: [`../PRICING.md`](../PRICING.md).

## Região e disponibilidade

A disponibilidade é **conforme os termos de serviço do gateway**. Nenhuma
afirmação geográfica é feita; consulte os termos para sua região antes de
rotear tráfego de produção.

## Liquidação

- **USDT** (TRC-20) por padrão — sem cartão, sem KYC.
- Outras criptos (BTC, etc.) para contas **atacado / grandes**.

## Perguntas frequentes

**É apenas um proxy de OpenAI?**
Não. Expõe endpoints nativos da Anthropic e Gemini, então você pode seguir usando
o SDK oficial de cada provedor. Também faz shim para Replicate / Fal / Suno.

**Preciso reescrever meu código?**
Não. Se seu cliente já fala OpenAI / Anthropic / Gemini, você só muda a base URL
(ou a variável de ambiente do provedor). Nada mais.

**Como verifico antes de pagar?**
Registre-se → créditos de teste → rode suas cargas contra o endpoint.

🔗 Documentação completa em inglês: [README.md](../README.md) · Exemplos: [examples/](../examples/) · Modelos: [models.md](../models.md)
