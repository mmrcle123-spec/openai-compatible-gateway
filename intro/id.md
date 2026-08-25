# Gateway API LLM Multi-Protokol — OpenAI / Claude / Gemini Native — 80% Lebih Murah, 468+ Model

> ## 🔥 Pangkas tagihan API hingga **80%** · 🧩 **468+ model, multi-protokol** · 💸 USDT, tanpa kartu, tanpa KYC
>
> Sebuah gateway LLM **multi-protokol**. Bicara format **native OpenAI,
> Anthropic Claude, dan Google Gemini** — bukan hanya chat OpenAI. Satu akun,
> semua dialek. **GPT · Claude · DeepSeek · Gemini · gambar · audio · embedding ·
> video · musik** di balik satu antarmuka.

**Ringkas — mengapa tim mengarahkan ke sini**

- 💰 **Hingga 80% lebih murah** dari harga resmi (hingga ~90% di tier volume tinggi)
- 🧩 **468+ model, satu akun** — berhenti menyambungkan penyedia berbeda per rute
- ⚡ **Multi-protokol native** — OpenAI, Anthropic Claude, dan Gemini native, plus shim Replicate / Fal / Suno
- 🤖 **Cakupan kapabilitas** — chat, streaming, visi, function calling, embeddings, audio (ASR+TTS), gambar, video, musik, realtime
- 🌍 **USDT (TRC-20)** bawaan, **tanpa KYC, tanpa biaya bulanan**, bayar per pakai
- 🧰 **Drop-in untuk 15+ klien** — ChatBox, CherryStudio, Cursor, Cline, Codex, aider, LobeChat, Dify, N8N, NextChat, LangChain, LlamaIndex, dan lebih banyak lagi

## Format API yang didukung

Gateway ini **bukan** "hanya OpenAI dengan lapisan terjemahan". Mengekspos
**endpoint native** untuk tiga SDK utama, sehingga Anda menggunakan pustaka resmi
masing-masing penyedia tanpa perubahan.

| Protokol | Base URL | Cara memanggil | Catatan |
|---|---|---|---|
| **OpenAI** | `https://api.airai.cc/v1` | Set `base_url` di SDK OpenAI | chat, streaming (SSE), visi, function calling, embeddings, audio, gambar, realtime |
| **Anthropic Claude** | `https://api.airai.cc` (root) | Set `ANTHROPIC_BASE_URL` di SDK Anthropic / Claude Code | API Messages native, streaming, tool use |
| **Google Gemini** | `https://api.airai.cc` (root) | Set `GOOGLE_GEMINI_BASE_URL` di CLI/SDK Gemini | generateContent native |
| **Replicate** | `https://api.airai.cc/replicate` | Klien kompatibel Replicate | banyak model open-weight di balik satu shim |
| **Fal.ai** | `https://api.airai.cc/fal-ai/{model}` | Klien kompatibel Fal | gambar / video di balik shim |
| **Suno** | `https://api.airai.cc/suno/...` | Klien kompatibel Suno | generasi musik |

> **Mengapa root untuk Claude dan Gemini?** SDK Anthropic dan Gemini mengirim
> permintaan ke root penyedia (mis. `https://api.anthropic.com`), bukan sub-path
> `/v1`. Arahkan `ANTHROPIC_BASE_URL` / `GOOGLE_GEMINI_BASE_URL` ke
> `https://api.airai.cc` maka gateway menyajikan rute native. SDK OpenAI justru
> mengharapkan `/v1`, jadi gunakan `https://api.airai.cc/v1`.

## Apa yang bisa dibangun

| Kapabilitas | Contoh model |
|---|---|
| Chat (teks) | gpt-4o, claude-3.5-sonnet, deepseek-chat, gemini-1.5-pro |
| Streaming (SSE) | semua model chat |
| Visi (gambar masukan) | gpt-4o, claude-3.5-sonnet, gemini-1.5-pro |
| Penalaran (o-series) | o1, o3, o4-mini (`low`/`medium`/`high`) |
| Function calling / tool use | semua model yang mampu |
| Embeddings | text-embedding-3-small, text-embedding-3-large, ada-002 |
| Audio (ASR + TTS) | whisper-1, tts-1 (6 suara) |
| Gambar | DALL·E 3, gpt-image-1, FLUX, Seedream, imagen-4, qwen-image |
| Realtime (websocket) | gpt-4o-realtime |
| Video (asinkron) | Kling, Luma, MiniMax, Jimeng, Fal |
| Musik | Suno |

## Model

Keluarga besar yang dirutekan melalui gateway ini:

- **GPT** — gpt-4o, gpt-4o-mini, gpt-4.1, o1 / o3 / o4-mini (penalaran)
- **Claude** — claude-3.5-sonnet, claude-3.7-sonnet, claude-opus-4, claude-haiku
- **DeepSeek** — deepseek-chat, deepseek-reasoner
- **Gemini** — gemini-1.5-pro, gemini-2.0-flash, gemini-2.5-pro
- **Gambar** — DALL·E 3, gpt-image-1, FLUX.1, Seedream, imagen-4, qwen-image
- **Audio** — whisper-1 (ASR), tts-1 (TTS, 6 suara)
- **Embeddings** — text-embedding-3-small / -3-large, text-embedding-ada-002
- **Realtime** — gpt-4o-realtime (websocket)
- **Video** — Kling, Luma, MiniMax, Jimeng, Fal (asinkron)
- **Musik** — Suno

Referensi lengkap: [`../models.md`](../models.md).

## Perangkat lunak & klien (tutorial)

Setiap klien di bawah diverifikasi terhadap gateway ini. Konfigurasi selalu ide
yang sama: arahkan `base_url`-nya (gaya OpenAI) atau variabel lingkungan
penyedia (Claude / Gemini) ke alamat di atas.

| Klien / alat | Protokol | Di mana mengonfigurasi |
|---|---|---|
| **ChatBox** | OpenAI | API kustom + base URL |
| **CherryStudio** | OpenAI + Claude MCP | pengaturan model; URL server MCP |
| **Cursor** | OpenAI (BYOK) | trik awalan `new-` |
| **Cline** | OpenAI | base URL kompatibel OpenAI |
| **Codex** | OpenAI | `config.toml` (3 platform) |
| **aider** | OpenAI | `--openai-api-base` |
| **Gemini CLI** | Gemini native | `GOOGLE_GEMINI_BASE_URL` |
| **Claude Code** | Anthropic native | `ANTHROPIC_BASE_URL` |
| **LobeChat** | OpenAI | pengaturan penyedia |
| **Dify** | OpenAI | konfigurasi penyedia model |
| **N8N** | OpenAI | node HTTP / OpenAI |
| **NextChat** | OpenAI | variabel `BASE_URL` |
| **Immersive Translate** | OpenAI | base API terjemahan |
| **LangChain** | OpenAI / Anthropic / Gemini | `base_url` model chat |
| **LlamaIndex** | OpenAI | `OPENAI_BASE_URL` |

Langkah demi langkah untuk 15 klien: [`../examples/frontends.md`](../examples/frontends.md).

## Mulai cepat

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",          # saat mendaftar atau via TG @mmrcle
)
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role":"user","content":"Halo"}],
)
print(r.choices[0].message.content)
```

Claude native: `export ANTHROPIC_BASE_URL="https://api.airai.cc"`. Gemini native:
`export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"`.

- Python: [`../examples/python.md`](../examples/python.md)
- Node: [`../examples/node.md`](../examples/node.md)
- curl: [`../examples/curl.md`](../examples/curl.md)
- Claude Code: [`../examples/claude-code.md`](../examples/claude-code.md)
- Gemini CLI: [`../examples/gemini-cli.md`](../examples/gemini-cli.md)
- Gambar / audio / embeddings / realtime / tugas asinkron: [`../examples/`](../examples/)

## Dapatkan kunci uji

1. **Daftar di gateway** → kredit uji diberikan saat pendaftaran, tanpa kartu.
   Gunakan untuk memvalidasi latensi, cakupan model, dan kualitas.
2. **Hubungi kami di TG:** `@mmrcle` — untuk pasokan *white-label* / grosir, kunci
   uji, atau pertanyaan integrasi.

## Harga

Tiga tier, dinyatakan sebagai **pengali harga daftar resmi**:

| Tier | Pengali | vs resmi | Untuk |
|---|---|---|---|
| **Standard** | 0.3× | ~70% lebih murah | pengembang, bayar per pakai |
| **Pro** | 0.15× | ~85% lebih murah | tim dengan volume stabil |
| **Wholesale** | 0.09× | ~91% lebih murah | volume tinggi / reseller |

Model **grup tarif**: setiap keluarga (chat, penalaran, visi, gambar, audio,
embedding, video, musik, realtime) membawa penyesuaian kecil di atas pengali
tier Anda. Detail: [`../PRICING.md`](../PRICING.md).

## Region & ketersediaan

Ketersediaan **sesuai ketentuan layanan gateway**. Tidak ada klaim geografis;
periksa ketentuan untuk region Anda sebelum merutekan trafik produksi.

## Penyelesaian

- **USDT** (TRC-20) secara default — tanpa kartu, tanpa KYC.
- Kripto lain (BTC, dll.) untuk akun **grosir / besar**.

## Pertanyaan umum

**Apakah ini hanya proxy OpenAI?**
Tidak. Mengekspos endpoint native Anthropic dan Gemini, sehingga Anda bisa terus
menggunakan SDK resmi masing-masing penyedia. Juga menjadi shim untuk Replicate /
Fal / Suno.

**Apakah saya perlu menulis ulang kode?**
Tidak. Jika klien Anda menggunakan API OpenAI / Anthropic / Gemini, Anda hanya
mengubah `base_url` (atau variabel lingkungan penyedia). Tidak lebih.

**Bagaimana cara memverifikasi sebelum membayar?**
Daftar → kredit uji → jalankan beban kerja Anda ke endpoint.

🔗 Dokumentasi lengkap dalam bahasa Inggris: [README.md](../README.md) ·
Contoh: [examples/](../examples/) · Model: [models.md](../models.md)
