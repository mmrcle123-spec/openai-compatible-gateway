# Cổng API LLM Đa Giao Thức — OpenAI / Claude / Gemini Native — Rẻ Hơn 80%, 468+ Mô Hình

> ## 🔥 Cắt giảm hóa đơn API lên đến **80%** · 🧩 **468+ mô hình, đa giao thức** · 💸 USDT, không cần thẻ, không KYC
>
> Một cổng LLM **đa giao thức**. Nói các định dạng **native của OpenAI, Anthropic
> Claude và Google Gemini** — không chỉ chat OpenAI. Một tài khoản, mọi phương
> ngữ. **GPT · Claude · DeepSeek · Gemini · ảnh · âm thanh · embedding · video ·
> nhạc** sau một giao diện.

**Tóm tắt — tại sao các đội hướng về đây**

- 💰 **Rẻ hơn tới 80%** so với giá chính thức (tới ~90% ở gói khối lượng lớn)
- 🧩 **468+ mô hình, một tài khoản** — thôi cắm riêng từng nhà cung cấp mỗi route
- ⚡ **Đa giao thức native** — OpenAI, Anthropic Claude và Gemini native, cộng shim Replicate / Fal / Suno
- 🤖 **Phủ hết năng lực** — chat, streaming, thị giác, function calling, embedding, âm thanh (ASR+TTS), ảnh, video, nhạc, realtime
- 🌍 **USDT (TRC-20)** mặc định, **không KYC, không phí tháng**, trả theo dùng
- 🧰 **Drop-in cho 15+ client** — ChatBox, CherryStudio, Cursor, Cline, Codex, aider, LobeChat, Dify, N8N, NextChat, LangChain, LlamaIndex và hơn thế

## Các định dạng API hỗ trợ

Cổng này **không** phải "chỉ OpenAI với lớp dịch". Nó phơi ra các **endpoint
native** cho 3 SDK chính, nên bạn dùng thư viện chính chủ của từng nhà cung cấp
mà không đổi code.

| Giao thức | Base URL | Cách gọi | Ghi chú |
|---|---|---|---|
| **OpenAI** | `https://api.airai.cc/v1` | Đặt `base_url` trong SDK OpenAI | chat, streaming (SSE), thị giác, function calling, embedding, âm thanh, ảnh, realtime |
| **Anthropic Claude** | `https://api.airai.cc` (gốc) | Đặt `ANTHROPIC_BASE_URL` trong SDK Anthropic / Claude Code | API Messages native, streaming, tool use |
| **Google Gemini** | `https://api.airai.cc` (gốc) | Đặt `GOOGLE_GEMINI_BASE_URL` trong CLI/SDK Gemini | generateContent native |
| **Replicate** | `https://api.airai.cc/replicate` | Client tương thích Replicate | nhiều mô hình open-weight sau một shim |
| **Fal.ai** | `https://api.airai.cc/fal-ai/{model}` | Client tương thích Fal | ảnh / video sau một shim |
| **Suno** | `https://api.airai.cc/suno/...` | Client tương thích Suno | sinh nhạc |

> **Sao lại là gốc cho Claude và Gemini?** SDK Anthropic và Gemini gửi request
> lên gốc nhà cung cấp (vd `https://api.anthropic.com`), không phải sub-path
> `/v1`. Trỏ `ANTHROPIC_BASE_URL` / `GOOGLE_GEMINI_BASE_URL` vào
> `https://api.airai.cc` thì cổng phục vụ route native. SDK OpenAI lại expects
> `/v1`, nên dùng `https://api.airai.cc/v1`.

## Bạn có thể xây gì

| Năng lực | Ví dụ mô hình |
|---|---|
| Chat (văn bản) | gpt-4o, claude-3.5-sonnet, deepseek-chat, gemini-1.5-pro |
| Streaming (SSE) | mọi mô hình chat |
| Thị giác (ảnh đầu vào) | gpt-4o, claude-3.5-sonnet, gemini-1.5-pro |
| Lập luận (o-series) | o1, o3, o4-mini (`low`/`medium`/`high`) |
| Function calling / tool use | mọi mô hình có khả năng |
| Embedding | text-embedding-3-small, text-embedding-3-large, ada-002 |
| Âm thanh (ASR + TTS) | whisper-1, tts-1 (6 giọng) |
| Ảnh | DALL·E 3, gpt-image-1, FLUX, Seedream, imagen-4, qwen-image |
| Realtime (websocket) | gpt-4o-realtime |
| Video (bất đồng bộ) | Kling, Luma, MiniMax, Jimeng, Fal |
| Nhạc | Suno |

## Mô hình

Các họ lớn được route qua cổng này:

- **GPT** — gpt-4o, gpt-4o-mini, gpt-4.1, o1 / o3 / o4-mini (lập luận)
- **Claude** — claude-3.5-sonnet, claude-3.7-sonnet, claude-opus-4, claude-haiku
- **DeepSeek** — deepseek-chat, deepseek-reasoner
- **Gemini** — gemini-1.5-pro, gemini-2.0-flash, gemini-2.5-pro
- **Ảnh** — DALL·E 3, gpt-image-1, FLUX.1, Seedream, imagen-4, qwen-image
- **Âm thanh** — whisper-1 (ASR), tts-1 (TTS, 6 giọng)
- **Embedding** — text-embedding-3-small / -3-large, text-embedding-ada-002
- **Realtime** — gpt-4o-realtime (websocket)
- **Video** — Kling, Luma, MiniMax, Jimeng, Fal (bất đồng bộ)
- **Nhạc** — Suno

Tham khảo đầy đủ: [`../models.md`](../models.md).

## Phần mềm và client (hướng dẫn)

Mỗi client dưới đây đã được xác minh với cổng này. Cấu hình luôn cùng một ý: trỏ
`base_url` (kiểu OpenAI) hoặc biến môi trường nhà cung cấp (Claude / Gemini) vào
các địa chỉ trên.

| Client / công cụ | Giao thức | Nơi cấu hình |
|---|---|---|
| **ChatBox** | OpenAI | API tùy chỉnh + base URL |
| **CherryStudio** | OpenAI + Claude MCP | cài đặt model; URL server MCP |
| **Cursor** | OpenAI (BYOK) | mẹo tiền tố `new-` |
| **Cline** | OpenAI | base URL tương thích OpenAI |
| **Codex** | OpenAI | `config.toml` (3 nền tảng) |
| **aider** | OpenAI | `--openai-api-base` |
| **Gemini CLI** | Gemini native | `GOOGLE_GEMINI_BASE_URL` |
| **Claude Code** | Anthropic native | `ANTHROPIC_BASE_URL` |
| **LobeChat** | OpenAI | cài đặt provider |
| **Dify** | OpenAI | cấu hình model provider |
| **N8N** | OpenAI | HTTP / OpenAI node |
| **NextChat** | OpenAI | biến `BASE_URL` |
| **Immersive Translate** | OpenAI | base API dịch |
| **LangChain** | OpenAI / Anthropic / Gemini | `base_url` chat model |
| **LlamaIndex** | OpenAI | `OPENAI_BASE_URL` |

Từng bước cho 15 client: [`../examples/frontends.md`](../examples/frontends.md).

## Bắt đầu nhanh

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",          # khi đăng ký hoặc qua TG @mmrcle
)
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role":"user","content":"Xin chào"}],
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
- Ảnh / âm thanh / embedding / realtime / tác vụ bất đồng bộ: [`../examples/`](../examples/)

## Lấy khóa dùng thử

1. **Đăng ký tại gateway** → cấp tín dụng dùng thử khi đăng ký, không cần thẻ.
   Dùng để kiểm tra độ trễ, độ phủ mô hình và chất lượng.
2. **Liên hệ qua TG:** `@mmrcle` — cho cung ứng *white-label* / bán sỉ, khóa dùng
   thử hoặc câu hỏi tích hợp.

## Giá

Ba tier, biểu diễn bằng **hệ số của giá niêm yết chính thức**:

| Tier | Hệ số | so với chính thức | Cho |
|---|---|---|---|
| **Standard** | 0.3× | ~70% rẻ hơn | dev, trả theo dùng |
| **Pro** | 0.15× | ~85% rẻ hơn | đội có volume ổn định |
| **Wholesale** | 0.09× | ~91% rẻ hơn | volume lớn / reseller |

Mô hình **nhóm giá**: mỗi họ (chat, lập luận, thị giác, ảnh, âm thanh, embedding,
video, nhạc, realtime) chịu một điều chỉnh nhỏ trên hệ số tier của bạn. Chi tiết:
[`../PRICING.md`](../PRICING.md).

## Khu vực và khả dụng

Khả dụng **theo điều khoản dịch vụ của gateway**. Không đưa ra bất kỳ tuyên bố
địa lý nào; hãy kiểm tra điều khoản cho khu vực của bạn trước khi route traffic
sản xuất.

## Thanh toán

- **USDT** (TRC-20) mặc định — không thẻ, không KYC.
- Crypto khác (BTC, v.v.) cho tài khoản **bán sỉ / lớn**.

## Câu hỏi thường gặp

**Đây có phải chỉ là OpenAI proxy?**
Không. Nó phơi ra endpoint native của Anthropic và Gemini, nên bạn tiếp tục dùng
SDK chính chủ của từng nhà cung cấp. Cũng làm shim cho Replicate / Fal / Suno.

**Tôi có phải viết lại mã không?**
Không. Nếu client của bạn nói API OpenAI / Anthropic / Gemini, bạn chỉ đổi
`base_url` (hoặc biến môi trường provider). Không hơn.

**Làm sao xác minh trước khi trả tiền?**
Đăng ký → tín dụng dùng thử → chạy workload của bạn qua endpoint.

🔗 Tài liệu đầy đủ tiếng Anh: [README.md](../README.md) · Ví dụ: [examples/](../examples/) · Mô hình: [models.md](../models.md)
