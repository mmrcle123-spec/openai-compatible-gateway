# Çok Protokollü LLM API Ağ Geçidi — OpenAI / Claude / Gemini Native — %80 Daha Ucuz, 468+ Model

> ## 🔥 API faturanızı **%80'e kadar** düşürün · 🧩 **468+ model, çok protokollü** · 💸 USDT, kart yok, KYC yok
>
> Bir **çok protokollü** LLM ağ geçidi. **OpenAI, Anthropic Claude ve Google
> Gemini native formatlarını** konuşur — sadece OpenAI sohbeti değil. Tek hesap,
> her diyalekt. **GPT · Claude · DeepSeek · Gemini · görsel · ses · embedding ·
> video · müzik** tek arayüzün arkasında.

**Özet — ekipler neden buraya yönlendiriyor**

- 💰 Resmi fiyata göre **%80'e kadar daha ucuz** (yüksek hacimli katmanda ~%90'a kadar)
- 🧩 **468+ model, tek hesap** — rota başına ayrı sağlayıcıyı bırakın
- ⚡ **Çok protokollü native** — OpenAI, Anthropic Claude ve Gemini native, artı Replicate / Fal / Suno shimleri
- 🤖 **Yetenek kapsamı** — sohbet, streaming, görsel, function calling, embedding, ses (ASR+TTS), görsel, video, müzik, realtime
- 🌍 **USDT (TRC-20)** varsayılan, **KYC yok, aylık ücret yok**, kullandığın kadar öde
- 🧰 **15+ istemci için drop-in** — ChatBox, CherryStudio, Cursor, Cline, Codex, aider, LobeChat, Dify, N8N, NextChat, LangChain, LlamaIndex ve daha fazlası

## Desteklenen API formatları

Bu ağ geçidi **"çeviri katmanlı sadece OpenAI" değildir**. Üç ana SDK için
**native endpointler** sunar; böylece her sağlayıcının kendi resmi
kütüphanesini değiştirmeden kullanırsınız.

| Protokol | Base URL | Nasıl çağrılır | Notlar |
|---|---|---|---|
| **OpenAI** | `https://api.airai.cc/v1` | OpenAI SDK'de `base_url` ayarla | sohbet, streaming (SSE), görsel, function calling, embedding, ses, görsel, realtime |
| **Anthropic Claude** | `https://api.airai.cc` (kök) | Anthropic SDK / Claude Code'da `ANTHROPIC_BASE_URL` ayarla | native Messages API, streaming, tool use |
| **Google Gemini** | `https://api.airai.cc` (kök) | Gemini CLI/SDK'da `GOOGLE_GEMINI_BASE_URL` ayarla | native generateContent |
| **Replicate** | `https://api.airai.cc/replicate` | Replicate uyumlu istemci | tek shim arkası açık modeller |
| **Fal.ai** | `https://api.airai.cc/fal-ai/{model}` | Fal uyumlu istemci | görsel / video tek shim |
| **Suno** | `https://api.airai.cc/suno/...` | Suno uyumlu istemci | müzik üretimi |

> **Claude ve Gemini için neden kök alan?** Anthropic ve Gemini SDK'leri
> istekleri sağlayıcı köküne gönderir (ör. `https://api.anthropic.com`), `/v1`
> alt yolu değil. `ANTHROPIC_BASE_URL` / `GOOGLE_GEMINI_BASE_URL` değerini
> `https://api.airai.cc` yapın; ağ geçidi native rotayı sunar. OpenAI SDK ise
> `/v1` bekler, dolayısıyla `https://api.airai.cc/v1` kullanın.

## Neler yapabilirsiniz

| Yetenek | Örnek modeller |
|---|---|
| Sohbet (metin) | gpt-4o, claude-3.5-sonnet, deepseek-chat, gemini-1.5-pro |
| Streaming (SSE) | tüm sohbet modelleri |
| Görsel (görsel girişi) | gpt-4o, claude-3.5-sonnet, gemini-1.5-pro |
| Akıl yürütme (o-series) | o1, o3, o4-mini (`low`/`medium`/`high`) |
| Function calling / tool use | tüm yetenekli modeller |
| Embedding | text-embedding-3-small, text-embedding-3-large, ada-002 |
| Ses (ASR + TTS) | whisper-1, tts-1 (6 ses) |
| Görsel | DALL·E 3, gpt-image-1, FLUX, Seedream, imagen-4, qwen-image |
| Realtime (websocket) | gpt-4o-realtime |
| Video (asenkron) | Kling, Luma, MiniMax, Jimeng, Fal |
| Müzik | Suno |

## Modeller

Bu ağ geçidi üzerinden yönlendirilen büyük aileler:

- **GPT** — gpt-4o, gpt-4o-mini, gpt-4.1, o1 / o3 / o4-mini (akıl yürütme)
- **Claude** — claude-3.5-sonnet, claude-3.7-sonnet, claude-opus-4, claude-haiku
- **DeepSeek** — deepseek-chat, deepseek-reasoner
- **Gemini** — gemini-1.5-pro, gemini-2.0-flash, gemini-2.5-pro
- **Görsel** — DALL·E 3, gpt-image-1, FLUX.1, Seedream, imagen-4, qwen-image
- **Ses** — whisper-1 (ASR), tts-1 (TTS, 6 ses)
- **Embedding** — text-embedding-3-small / -3-large, text-embedding-ada-002
- **Realtime** — gpt-4o-realtime (websocket)
- **Video** — Kling, Luma, MiniMax, Jimeng, Fal (asenkron)
- **Müzik** — Suno

Tam referans: [`../models.md`](../models.md).

## Yazılım ve istemciler (eğitimler)

Aşağıdaki her istemci bu ağ geçidine karşı doğrulanmıştır. Yapılandırma hep aynı
fikirdir: `base_url`'ini (OpenAI tarzı) veya sağlayıcı ortam değişkenini (Claude /
Gemini) yukarıdaki adreslere yönlendirin.

| İstemci / araç | Protokol | Nerede yapılandırılır |
|---|---|---|
| **ChatBox** | OpenAI | özel API + base URL |
| **CherryStudio** | OpenAI + Claude MCP | model ayarları; MCP sunucu URL'si |
| **Cursor** | OpenAI (BYOK) | `new-` önek numarası püf noktası |
| **Cline** | OpenAI | OpenAI uyumlu base URL |
| **Codex** | OpenAI | `config.toml` (3 platform) |
| **aider** | OpenAI | `--openai-api-base` |
| **Gemini CLI** | Gemini native | `GOOGLE_GEMINI_BASE_URL` |
| **Claude Code** | Anthropic native | `ANTHROPIC_BASE_URL` |
| **LobeChat** | OpenAI | sağlayıcı ayarları |
| **Dify** | OpenAI | model sağlayıcı yapılandırması |
| **N8N** | OpenAI | HTTP / OpenAI düğümü |
| **NextChat** | OpenAI | `BASE_URL` değişkeni |
| **Immersive Translate** | OpenAI | çeviri API base'i |
| **LangChain** | OpenAI / Anthropic / Gemini | chat model `base_url` |
| **LlamaIndex** | OpenAI | `OPENAI_BASE_URL` |

15 istemcinin adım adım kılavuzu: [`../examples/frontends.md`](../examples/frontends.md).

## Hızlı başlangıç

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",          # kayıt olurken veya TG @mmrcle üzerinden
)
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role":"user","content":"Merhaba"}],
)
print(r.choices[0].message.content)
```

Native Claude: `export ANTHROPIC_BASE_URL="https://api.airai.cc"`. Native Gemini:
`export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"`.

- Python: [`../examples/python.md`](../examples/python.md)
- Node: [`../examples/node.md`](../examples/node.md)
- curl: [`../examples/curl.md`](../examples/curl.md)
- Claude Code: [`../examples/claude-code.md`](../examples/claude-code.md)
- Gemini CLI: [`../examples/gemini-cli.md`](../examples/gemini-cli.md)
- Görsel / ses / embedding / realtime / asenkron görevler: [`../examples/`](../examples/)

## Test anahtarı alma

1. **Ağ geçidinde kayıt olun** → kayıt sırasında kart gerektirmeden deneme
   kredisi verilir. Gecikmeyi, model kapsamını ve kaliteyi doğrulamak için kullanın.
2. **TG üzerinden bize ulaşın:** `@mmrcle` — beyaz etiket / toptan tedarik, test
   anahtarları veya entegrasyon soruları için.

## Fiyatlandırma

Üç katman, **resmi liste fiyatının çarpanı** olarak ifade edilir:

| Katman | Çarpan | resmiyye göre | İçin |
|---|---|---|---|
| **Standard** | 0.3× | ~%70 daha az | geliştiriciler, kullandığın kadar |
| **Pro** | 0.15× | ~%85 daha az | istikrarlı hacimli ekipler |
| **Wholesale** | 0.09× | ~%91 daha az | yüksek hacim / bayiler |

**Grup ücret** modeli: her aile (sohbet, akıl yürütme, görsel, görsel, ses,
embedding, video, müzik, realtime) katman çarpanınız üzerinde küçük bir ayar
taşır. Detay: [`../PRICING.md`](../PRICING.md).

## Bölge ve kullanılabilirlik

Kullanılabilirlik **ağ geçidinin hizmet şartlarına göre**dir. Hiçbir coğrafi
iddia yapılmaz; üretim trafiği yönlendirmeden önce bölgeniz için şartları
kontrol edin.

## Tahsilat

- Varsayılan olarak **USDT** (TRC-20) — kartsız, KYC'siz.
- Büyük / toptan hesaplar için diğer kriptolar (BTC vb.) değerlendirilir.

## Sıkça sorulan sorular

**Bu sadece bir OpenAI proxy'si mi?**
Hayır. Anthropic ve Gemini için native endpointler sunar; böylece her sağlayıcının
resmi SDK'sını kullanmaya devam edersiniz. Ayrıca Replicate / Fal / Suno için shim
görevi görür.

**Kodumu yeniden mi yazmalıyım?**
Hayır. İstemciniz OpenAI / Anthropic / Gemini konuşuyorsa, yalnızca base URL'i
(veya sağlayıcı ortam değişkenini) değiştirirsiniz. Başka bir şey değil.

**Ödeme yapmadan önce nasıl doğrularım?**
Kayıt olun → deneme kredisi → iş yüklerinizi uç noktaya karşı çalıştırın.

🔗 Tam İngilizce dokümantasyon: [README.md](../README.md) · Örnekler: [examples/](../examples/) · Modeller: [models.md](../models.md)
