# Klien dan alat — panduan langkah demi langkah

Halaman ini adalah panduan pengaturan langkah demi langkah untuk **15 klien
dan alat pengembang** yang bekerja dengan gateway. Setiap panduan ditulis
melawan antarmuka gateway yang sesungguhnya. Pilih alat Anda, ikuti langkah,
dan Anda sudah aktif dalam kurang dari dua menit.

> **Aturan yang mencakup semuanya**
> Arahkan **URL dasar yang kompatibel dengan OpenAI** pada alat ke
> `https://api.airai.cc/v1`, ATAU atur **variabel lingkungan penyedia** ke
> akar asli untuk Claude / Gemini:
> - Claude: `ANTHROPIC_BASE_URL=https://api.airai.cc`
> - Gemini: `GOOGLE_GEMINI_BASE_URL=https://api.airai.cc`
>
> Antarmuka kompatibel OpenAI yang sama, kunci yang sama, 468+ model di
> belakangnya.

---

## Indeks cepat

| # | Klien / alat | Terbaik untuk | Protokol |
|---|---|---|---|
| 1 | [ChatBox](#1-chatbox) | Chat desktop / seluler | OpenAI |
| 2 | [CherryStudio](#2-cherrystudio) | Multi-penyedia + MCP | OpenAI + Claude MCP |
| 3 | [Cursor](#3-cursor) | Editor kode AI (BYOK) | OpenAI |
| 4 | [Cline](#4-cline-vs-code) | Agen kode di VS Code | OpenAI |
| 5 | [Codex](#5-codex) | Agen kode di terminal | OpenAI |
| 6 | [aider](#6-aider) | CLI pemrograman berpasangan | OpenAI |
| 7 | [Gemini CLI](#7-gemini-cli) | CLI asli Google Gemini | Gemini asli |
| 8 | [Claude Code](#8-claude-code) | CLI asli Anthropic | Anthropic asli |
| 9 | [LobeChat](#9-lobechat) | UI chat self-hosted | OpenAI |
| 10 | [Dify](#10-dify) | LLMOps / pembangun agen | OpenAI |
| 11 | [N8N](#11-n8n) | Otomasi alur kerja | OpenAI |
| 12 | [NextChat](#12-nextchat) | Chat web ringan | OpenAI |
| 13 | [Immersive Translate](#13-immersive-translate) | Terjemahan di browser | OpenAI |
| 14 | [LangChain](#14-langchain) | Framework agen | OpenAI / Anthropic / Gemini |
| 15 | [LlamaIndex](#15-llamaindex) | Framework RAG / data | OpenAI |

**Perlu kunci dulu?** Dapatkan kunci uji gratis — lihat bagian *Get a test key*
di [README utama](../README.md).

---

## 1. ChatBox

Klien chat lintas platform (macOS / Windows / Linux) dan seluler.

**Desktop**
1. Buka ChatBox → **Settings** (roda gigi).
2. **Model Provider** → **Add custom provider**.
3. Isi: API Host `https://api.airai.cc/v1`, API Key kunci Anda, Model `gpt-4o`.
4. Simpan, mulai obrolan baru.

**Seluler (iOS / Android)**: jalur sama.

**Verifikasi**: kirim "halo" — balasan mengonfirmasi rute berfungsi.

---

## 2. CherryStudio

Klien desktop multi-penyedia populer dengan dukungan MCP.

**Penyedia OpenAI**
1. Settings → **Model Provider** → **OpenAI**.
2. Aktifkan, atur API Address `https://api.airai.cc/v1` + API Key.
3. **Manage / Add model** dan tambahkan yang Anda butuhkan.
4. Model penalaran `o4-mini` / `o3` dapat dipilih.

**Server MCP Claude (opsional)**: Settings → **MCP Servers** → **Add** → server
SSE/HTTP yang menunjuk ke endpoint MCP gateway.

---

## 3. Cursor

Editor kode AI. Menggunakan **BYOK**.

1. **Settings** (⌘/Ctrl + ,) → cari **Models**.
2. Aktifkan **Bring Your Own Key** (BYOK).
3. Atur URL dasar `https://api.airai.cc/v1` dan tempel kunci Anda.
4. Di pemilih model ketik `gpt-4o`, `claude-3.5-sonnet`, dll.

**Trik awalan `new-`**: tambahkan `new-` ke model (mis. `new-gpt-4o`).

---

## 4. Cline (VS Code)

Agen kode otonom sebagai ekstensi VS Code.

1. Pasang **Cline**, buka panel.
2. **Settings** → **API Provider** → **OpenAI-compatible**.
3. Base URL `https://api.airai.cc/v1`, API Key, Model ID `claude-3.5-sonnet` / `gpt-4o` / `deepseek-chat`.

---

## 5. Codex

Agen kode terminal OpenAI (macOS / Linux / Windows-WSL).

Buat `~/.codex/config.toml`:
```toml
[model]
base_url = "https://api.airai.cc/v1"
api_key  = "YOUR_KEY"
model    = "gpt-4o"
```
**Alternatif — variabel lingkungan**: `export OPENAI_BASE_URL="https://api.airai.cc/v1"` + `export OPENAI_API_KEY="YOUR_KEY"`.

---

## 6. aider

Pemrograman berpasangan di terminal.
```bash
aider --openai-api-base https://api.airai.cc/v1 --openai-api-key YOUR_KEY --model gpt-4o
```
**Tetap — `.aider.conf.yml`**: `openai-api-base: https://api.airai.cc/v1` / `openai-api-key: YOUR_KEY` / `model: gpt-4o`.

---

## 7. Gemini CLI

CLI Gemini resmi pada **akar asli Gemini**. Lihat [`gemini-cli.md`](gemini-cli.md).
```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"
gemini
```

---

## 8. Claude Code

Agen Claude resmi Anthropic pada **akar asli Anthropic**. Lihat [`claude-code.md`](claude-code.md).
```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
claude
```

---

## 9. LobeChat

UI chat open-source, ideal untuk self-host.

**Dalam aplikasi**: Settings → **AI Provider** → **OpenAI** → Base URL `https://api.airai.cc/v1` + kunci.

**Self-hosted (Docker / env)**:
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_PROXY_URL="https://api.airai.cc/v1"
```

---

## 10. Dify

Platform LLMOps open-source untuk agen dan RAG.

1. **Settings** → **Model Provider**.
2. Tambahkan **OpenAI** (atau "OpenAI-API-compatible").
3. API Key kunci Anda, API Base `https://api.airai.cc/v1`.
4. Gunakan di Apps / Workflows / Agents.

---

## 11. N8N

Otomasi dengan node OpenAI.

**Opsi A — node OpenAI**: buat kredensial **OpenAI API** dengan Base URL `https://api.airai.cc/v1`.

**Opsi B — node HTTP Request**:
```json
{ "method": "POST", "url": "https://api.airai.cc/v1/chat/completions",
  "headers": {"Authorization": "Bearer YOUR_KEY", "Content-Type": "application/json"},
  "body": {"model": "gpt-4o", "messages": [{"role": "user", "content": "Hello"}]} }
```

---

## 12. NextChat

UI chat web ringan (dulu ChatGPT-Next-Web).
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

Ekstensi browser yang menerjemahkan halaman dengan LLM.

1. Pengaturan → **Translation Service** → **OpenAI / Custom**.
2. API URL `https://api.airai.cc/v1`, API Key kunci Anda, Model `gpt-4o-mini`.

**Tip**: gunakan `gpt-4o-mini` — terjemahan bervolume tinggi dan kompleksitas
rendah, beban termurah.

---

## 14. LangChain

Framework agen / RAG (Python; JS serupa).

**Dialek OpenAI**
```python
from langchain_openai import ChatOpenAI
llm = ChatOpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
```
**Dialek Anthropic (asli)**
```python
from langchain_anthropic import ChatAnthropic
llm = ChatAnthropic(base_url="https://api.airai.cc", api_key="YOUR_KEY", model="claude-3.5-sonnet")
```
**Dialek Gemini (asli)**
```python
from langchain_google_genai import ChatGoogleGenerativeAI
llm = ChatGoogleGenerativeAI(base_url="https://api.airai.cc", google_api_key="YOUR_KEY", model="gemini-2.5-pro")
```

---

## 15. LlamaIndex

Framework data untuk RAG / agen (Python).
```python
from llama_index.llms.openai import OpenAI
llm = OpenAI(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
print(llm.complete("hello"))
```
**Embedding untuk RAG**
```python
from llama_index.embeddings.openai import OpenAIEmbedding
embed = OpenAIEmbedding(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="text-embedding-3-small")
```

---

## Aturan umum untuk yang tidak terdaftar

Jika alat berbicara **OpenAI / Anthropic / Gemini**, alat itu bekerja di sini:

| Berbicara… | Atur ini | Ke |
|---|---|---|
| OpenAI API | `base_url` / `OPENAI_BASE_URL` | `https://api.airai.cc/v1` |
| Anthropic (Claude) | `ANTHROPIC_BASE_URL` | `https://api.airai.cc` |
| Gemini | `GOOGLE_GEMINI_BASE_URL` | `https://api.airai.cc` |

Simpan kunci Anda, ganti URL, dan semua model menjadi tersedia. Untuk contoh
tingkat API (curl / Python / Node, gambar, audio, embedding, realtime, tugas
async) lihat file lain di [`examples/`](../examples/).
