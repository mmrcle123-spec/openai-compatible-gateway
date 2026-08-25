# İstemci ve araçlar — adım adım kılavuzlar

Bu sayfa, gateway ile çalışan **15 istemci ve geliştirici aracı** için adım
adım kurulum kılavuzudur. Her kılavuz gateway'in gerçek arayüzüne göre
yazılmıştır. Aracınızı seçin, adımları izleyin, iki dakika içinde çalışır
duruma gelin.

> **Her şeyi kapsayan kural**
> Aracın **OpenAI uyumlu temel URL**'sini `https://api.airai.cc/v1` olarak
> ayarlayın, YA DA sağlayıcı ortam değişkenini Claude / Gemini için kök
> adrese yönlendirin:
> - Claude: `ANTHROPIC_BASE_URL=https://api.airai.cc`
> - Gemini: `GOOGLE_GEMINI_BASE_URL=https://api.airai.cc`
>
> Aynı OpenAI uyumlu arayüz, aynı anahtar, arkasında 468+ model.

---

## Hızlı dizin

| # | İstemci / araç | İçin en iyi | Protokol |
|---|---|---|---|
| 1 | [ChatBox](#1-chatbox) | Masaüstü / mobil sohbet | OpenAI |
| 2 | [CherryStudio](#2-cherrystudio) | Çoklu sağlayıcı + MCP | OpenAI + Claude MCP |
| 3 | [Cursor](#3-cursor) | Yapay zekâ kod editörü (BYOK) | OpenAI |
| 4 | [Cline](#4-cline-vs-code) | VS Code'da kod ajanı | OpenAI |
| 5 | [Codex](#5-codex) | Terminal kod ajanı | OpenAI |
| 6 | [aider](#6-aider) | Eşli programlama CLI | OpenAI |
| 7 | [Gemini CLI](#7-gemini-cli) | Google Gemini yerel CLI | Gemini yerel |
| 8 | [Claude Code](#8-claude-code) | Anthropic yerel CLI | Anthropic yerel |
| 9 | [LobeChat](#9-lobechat) | Self-hosted sohbet UI | OpenAI |
| 10 | [Dify](#10-dify) | LLMOps / ajan kurucu | OpenAI |
| 11 | [N8N](#11-n8n) | İş akışı otomasyonu | OpenAI |
| 12 | [NextChat](#12-nextchat) | Hafif web sohbet | OpenAI |
| 13 | [Immersive Translate](#13-immersive-translate) | Tarayıcı çevirisi | OpenAI |
| 14 | [LangChain](#14-langchain) | Ajan çatısı | OpenAI / Anthropic / Gemini |
| 15 | [LlamaIndex](#15-llamaindex) | RAG / veri çatısı | OpenAI |

**Önce anahtar mı lazım?** Ücretsiz test anahtarı alın — [ana README](../README.md)
içindeki *Get a test key* bölümüne bakın.

---

## 1. ChatBox

Çok platformlu (macOS / Windows / Linux) ve mobil sohbet istemcisi.

**Masaüstü**
1. ChatBox → **Settings** (dişli).
2. **Model Provider** → **Add custom provider**.
3. Doldur: API Host `https://api.airai.cc/v1`, API Key anahtarınız, Model `gpt-4o`.
4. Kaydet, yeni sohbet başlat.

**Mobil (iOS / Android)**: Aynı yol.

**Doğrula**: "merhaba" gönder — yanıt rotanın çalıştığını gösterir.

---

## 2. CherryStudio

Popüler çoklu-sağlayıcı masaüstü istemcisi, yerleşik MCP desteği.

**OpenAI sağlayıcı**
1. Settings → **Model Provider** → **OpenAI**.
2. Etkinleştir, API Address `https://api.airai.cc/v1` + API Key.
3. **Manage / Add model** ile ihtiyacınızı ekleyin.
4. `o4-mini` / `o3` muhakeme modelleri seçilebilir.

**Claude MCP sunucusu (isteğe bağlı)**: Settings → **MCP Servers** → **Add**
→ gateway MCP uç noktasına işaret eden SSE/HTTP sunucusu.

---

## 3. Cursor

Yapay zekâ kod editörü. **BYOK** kullanır.

1. **Settings** (⌘/Ctrl + ,) → **Models** ara.
2. **Bring Your Own Key** (BYOK) etkinleştir.
3. Özel temel URL `https://api.airai.cc/v1` ve anahtarınızı yapıştırın.
4. Model seçicide `gpt-4o`, `claude-3.5-sonnet` yazın.

**`new-` ön eki taktiği**: Bir modele `new-` ekleyin (ör. `new-gpt-4o`).

---

## 4. Cline (VS Code)

VS Code uzantısı olarak özerk kod ajanı.

1. **Cline** uzantısını kurun, paneli açın.
2. **Settings** → **API Provider** → **OpenAI-compatible**.
3. Base URL `https://api.airai.cc/v1`, API Key, Model ID `claude-3.5-sonnet` / `gpt-4o` / `deepseek-chat`.

---

## 5. Codex

OpenAI terminal kod ajanı (macOS / Linux / Windows-WSL).

`~/.codex/config.toml` oluşturun:
```toml
[model]
base_url = "https://api.airai.cc/v1"
api_key  = "YOUR_KEY"
model    = "gpt-4o"
```
**Alternatif — ortam değişkeni**: `export OPENAI_BASE_URL="https://api.airai.cc/v1"` + `export OPENAI_API_KEY="YOUR_KEY"`.

---

## 6. aider

Terminalde eşli programlama.
```bash
aider --openai-api-base https://api.airai.cc/v1 --openai-api-key YOUR_KEY --model gpt-4o
```
**Kalıcı — `.aider.conf.yml`**: `openai-api-base: https://api.airai.cc/v1` / `openai-api-key: YOUR_KEY` / `model: gpt-4o`.

---

## 7. Gemini CLI

Resmî Gemini CLI, **Gemini yerel kök** üzerinde. Bakın [`gemini-cli.md`](gemini-cli.md).
```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"
gemini
```

---

## 8. Claude Code

Anthropic resmî Claude ajanı, **Anthropic yerel kök** üzerinde. Bakın [`claude-code.md`](claude-code.md).
```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
claude
```

---

## 9. LobeChat

Self-hosted için ideal open-source sohbet UI.

**Uygulamada**: Settings → **AI Provider** → **OpenAI** → Base URL `https://api.airai.cc/v1` + anahtar.

**Self-hosted (Docker / env)**:
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_PROXY_URL="https://api.airai.cc/v1"
```

---

## 10. Dify

Ajan ve RAG kurmak için open-source LLMOps platformu.

1. **Settings** → **Model Provider**.
2. **OpenAI** (veya "OpenAI-API-compatible") ekleyin.
3. API Key anahtarınız, API Base `https://api.airai.cc/v1`.
4. Apps / Workflows / Agents içinde kullanın.

---

## 11. N8N

OpenAI düğümlü otomasyon.

**Seçenek A — OpenAI düğümü**: **OpenAI API** kimlik bilgileri, Base URL `https://api.airai.cc/v1`.

**Seçenek B — HTTP Request düğümü**:
```json
{ "method": "POST", "url": "https://api.airai.cc/v1/chat/completions",
  "headers": {"Authorization": "Bearer YOUR_KEY", "Content-Type": "application/json"},
  "body": {"model": "gpt-4o", "messages": [{"role": "user", "content": "Hello"}]} }
```

---

## 12. NextChat

Hafif web sohbet UI (eski ChatGPT-Next-Web).
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

Sayfaları LLM ile çeviren tarayıcı uzantısı.

1. Ayarlar → **Translation Service** → **OpenAI / Custom**.
2. API URL `https://api.airai.cc/v1`, API Key anahtarınız, Model `gpt-4o-mini`.

**İpucu**: `gpt-4o-mini` kullanın — çeviri yüksek hacimli, düşük karmaşıklıktır.

---

## 14. LangChain

Ajan / RAG çatısı (Python; JS benzer).

**OpenAI diyalekti**
```python
from langchain_openai import ChatOpenAI
llm = ChatOpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
```
**Anthropic diyalekti (yerel)**
```python
from langchain_anthropic import ChatAnthropic
llm = ChatAnthropic(base_url="https://api.airai.cc", api_key="YOUR_KEY", model="claude-3.5-sonnet")
```
**Gemini diyalekti (yerel)**
```python
from langchain_google_genai import ChatGoogleGenerativeAI
llm = ChatGoogleGenerativeAI(base_url="https://api.airai.cc", google_api_key="YOUR_KEY", model="gemini-2.5-pro")
```

---

## 15. LlamaIndex

RAG / ajanlar için veri çatısı (Python).
```python
from llama_index.llms.openai import OpenAI
llm = OpenAI(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
print(llm.complete("hello"))
```
**RAG için embeddings**
```python
from llama_index.embeddings.openai import OpenAIEmbedding
embed = OpenAIEmbedding(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="text-embedding-3-small")
```

---

## Listelenmeyenler için genel kural

Bir araç **OpenAI / Anthropic / Gemini** konuşuyorsa burada çalışır:

| Konuşan… | Bunu ayarla | Şuna |
|---|---|---|
| OpenAI API | `base_url` / `OPENAI_BASE_URL` | `https://api.airai.cc/v1` |
| Anthropic (Claude) | `ANTHROPIC_BASE_URL` | `https://api.airai.cc` |
| Gemini | `GOOGLE_GEMINI_BASE_URL` | `https://api.airai.cc` |

Anahtarınızı koruyun, URL'yi değiştirin, tüm modeller kullanılabilir olur. API
düzeyinde örnekler için [`examples/`](../examples/) içindeki diğer dosyalara bakın.
