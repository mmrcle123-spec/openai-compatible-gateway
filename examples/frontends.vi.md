# Khách hàng và công cụ — hướng dẫn từng bước

Trang này là hướng dẫn thiết lập từng bước cho **15 khách hàng và công cụ lập
trình** hoạt động với gateway. Mỗi hướng dẫn được viết dựa trên giao diện thật
của gateway. Chọn công cụ, làm theo các bước và bạn sẽ chạy trong chưa đầy hai
phút.

> **Quy tắc bao quát tất cả**
> Trỏ **URL cơ sở tương thích OpenAI** của công cụ tới
> `https://api.airai.cc/v1`, HOẶC đặt **biến môi trường nhà cung cấp** vào gốc
> gốc bản địa cho Claude / Gemini:
> - Claude: `ANTHROPIC_BASE_URL=https://api.airai.cc`
> - Gemini: `GOOGLE_GEMINI_BASE_URL=https://api.airai.cc`
>
> Cùng giao diện tương thích OpenAI, cùng khóa, 468+ mô hình phía sau.

---

## Mục lục nhanh

| # | Khách hàng / công cụ | Tốt nhất cho | Giao thức |
|---|---|---|---|
| 1 | [ChatBox](#1-chatbox) | Chat máy tính / di động | OpenAI |
| 2 | [CherryStudio](#2-cherrystudio) | Đa nhà cung cấp + MCP | OpenAI + Claude MCP |
| 3 | [Cursor](#3-cursor) | Trình soạn code AI (BYOK) | OpenAI |
| 4 | [Cline](#4-cline-vs-code) | Tác tử code trong VS Code | OpenAI |
| 5 | [Codex](#5-codex) | Tác tử code trong terminal | OpenAI |
| 6 | [aider](#6-aider) | Lập trình cặp (CLI) | OpenAI |
| 7 | [Gemini CLI](#7-gemini-cli) | CLI gốc Google Gemini | Gemini gốc |
| 8 | [Claude Code](#8-claude-code) | CLI gốc Anthropic | Anthropic gốc |
| 9 | [LobeChat](#9-lobechat) | UI chat tự lưu trữ | OpenAI |
| 10 | [Dify](#10-dify) | LLMOps / xây dựng tác tử | OpenAI |
| 11 | [N8N](#11-n8n) | Tự động hóa luồng | OpenAI |
| 12 | [NextChat](#12-nextchat) | Chat web nhẹ | OpenAI |
| 13 | [Immersive Translate](#13-immersive-translate) | Dịch trong trình duyệt | OpenAI |
| 14 | [LangChain](#14-langchain) | Framework tác tử | OpenAI / Anthropic / Gemini |
| 15 | [LlamaIndex](#15-llamaindex) | Framework RAG / dữ liệu | OpenAI |

**Cần khóa trước?** Lấy khóa dùng thử miễn phí — xem mục *Get a test key* trong
[README chính](../README.md).

---

## 1. ChatBox

Khách hàng chat đa nền tảng (macOS / Windows / Linux) và di động.

**Máy tính**
1. Mở ChatBox → **Settings** (bánh răng).
2. **Model Provider** → **Add custom provider**.
3. Điền: API Host `https://api.airai.cc/v1`, API Key khóa của bạn, Model `gpt-4o`.
4. Lưu, bắt đầu cuộc trò chuyện mới.

**Di động (iOS / Android)**: cùng đường dẫn.

**Xác minh**: gửi "xin chào" — phản hồi xác nhận route hoạt động.

---

## 2. CherryStudio

Khách hàng máy tính đa nhà cung cấp phổ biến, tích hợp sẵn MCP.

**Nhà cung cấp OpenAI**
1. Settings → **Model Provider** → **OpenAI**.
2. Bật, đặt API Address `https://api.airai.cc/v1` + API Key.
3. **Manage / Add model** và thêm mô hình cần thiết.
4. Các mô hình suy luận `o4-mini` / `o3` có thể chọn.

**Máy chủ MCP Claude (tùy chọn)**: Settings → **MCP Servers** → **Add** → máy
chủ SSE/HTTP trỏ tới endpoint MCP của gateway.

---

## 3. Cursor

Trình soạn code AI. Dùng **BYOK**.

1. **Settings** (⌘/Ctrl + ,) → tìm **Models**.
2. Bật **Bring Your Own Key** (BYOK).
3. Đặt URL cơ sở `https://api.airai.cc/v1` và dán khóa.
4. Trong bộ chọn mô hình, gõ `gpt-4o`, `claude-3.5-sonnet`, v.v.

**Mẹo tiền tố `new-`**: thêm `new-` vào mô hình (vd. `new-gpt-4o`).

---

## 4. Cline (VS Code)

Tác tử code tự chủ dưới dạng tiện ích VS Code.

1. Cài **Cline**, mở panel.
2. **Settings** → **API Provider** → **OpenAI-compatible**.
3. Base URL `https://api.airai.cc/v1`, API Key, Model ID `claude-3.5-sonnet` / `gpt-4o` / `deepseek-chat`.

---

## 5. Codex

Tác tử code terminal của OpenAI (macOS / Linux / Windows-WSL).

Tạo `~/.codex/config.toml`:
```toml
[model]
base_url = "https://api.airai.cc/v1"
api_key  = "YOUR_KEY"
model    = "gpt-4o"
```
**Thay thế — biến môi trường**: `export OPENAI_BASE_URL="https://api.airai.cc/v1"` + `export OPENAI_API_KEY="YOUR_KEY"`.

---

## 6. aider

Lập trình cặp trong terminal.
```bash
aider --openai-api-base https://api.airai.cc/v1 --openai-api-key YOUR_KEY --model gpt-4o
```
**Cố định — `.aider.conf.yml`**: `openai-api-base: https://api.airai.cc/v1` / `openai-api-key: YOUR_KEY` / `model: gpt-4o`.

---

## 7. Gemini CLI

CLI Gemini chính thức trên **gốc gốc Gemini**. Xem [`gemini-cli.md`](gemini-cli.md).
```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"
gemini
```

---

## 8. Claude Code

Tác tử Claude chính thức của Anthropic trên **gốc gốc Anthropic**. Xem [`claude-code.md`](claude-code.md).
```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
claude
```

---

## 9. LobeChat

UI chat mã nguồn mở, lý tưởng để tự lưu trữ.

**Trong ứng dụng**: Settings → **AI Provider** → **OpenAI** → Base URL `https://api.airai.cc/v1` + khóa.

**Tự lưu trữ (Docker / env)**:
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_PROXY_URL="https://api.airai.cc/v1"
```

---

## 10. Dify

Nền tảng LLMOps mã nguồn mở để xây dựng tác tử và RAG.

1. **Settings** → **Model Provider**.
2. Thêm **OpenAI** (hoặc "OpenAI-API-compatible").
3. API Key khóa của bạn, API Base `https://api.airai.cc/v1`.
4. Dùng trong Apps / Workflows / Agents.

---

## 11. N8N

Tự động hóa với node OpenAI.

**Tùy chọn A — node OpenAI**: tạo thông tin **OpenAI API** với Base URL `https://api.airai.cc/v1`.

**Tùy chọn B — node HTTP Request**:
```json
{ "method": "POST", "url": "https://api.airai.cc/v1/chat/completions",
  "headers": {"Authorization": "Bearer YOUR_KEY", "Content-Type": "application/json"},
  "body": {"model": "gpt-4o", "messages": [{"role": "user", "content": "Hello"}]} }
```

---

## 12. NextChat

UI chat web nhẹ (trước là ChatGPT-Next-Web).
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

Tiện ích trình duyệt dịch trang bằng LLM.

1. Cài đặt → **Translation Service** → **OpenAI / Custom**.
2. API URL `https://api.airai.cc/v1`, API Key khóa của bạn, Model `gpt-4o-mini`.

**Mẹo**: dùng `gpt-4o-mini` — dịch có khối lượng lớn, độ phức tạp thấp.

---

## 14. LangChain

Framework tác tử / RAG (Python; JS tương tự).

**Phương ngữ OpenAI**
```python
from langchain_openai import ChatOpenAI
llm = ChatOpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
```
**Phương ngữ Anthropic (gốc)**
```python
from langchain_anthropic import ChatAnthropic
llm = ChatAnthropic(base_url="https://api.airai.cc", api_key="YOUR_KEY", model="claude-3.5-sonnet")
```
**Phương ngữ Gemini (gốc)**
```python
from langchain_google_genai import ChatGoogleGenerativeAI
llm = ChatGoogleGenerativeAI(base_url="https://api.airai.cc", google_api_key="YOUR_KEY", model="gemini-2.5-pro")
```

---

## 15. LlamaIndex

Framework dữ liệu cho RAG / tác tử (Python).
```python
from llama_index.llms.openai import OpenAI
llm = OpenAI(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
print(llm.complete("hello"))
```
**Embedding cho RAG**
```python
from llama_index.embeddings.openai import OpenAIEmbedding
embed = OpenAIEmbedding(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="text-embedding-3-small")
```

---

## Quy tắc chung cho phần còn lại

Nếu công cụ nói **OpenAI / Anthropic / Gemini**, nó hoạt động ở đây:

| Nói… | Đặt biến này | Thành |
|---|---|---|
| OpenAI API | `base_url` / `OPENAI_BASE_URL` | `https://api.airai.cc/v1` |
| Anthropic (Claude) | `ANTHROPIC_BASE_URL` | `https://api.airai.cc` |
| Gemini | `GOOGLE_GEMINI_BASE_URL` | `https://api.airai.cc` |

Giữ khóa, đổi URL và mọi mô hình đều sẵn sàng. Với ví dụ cấp API (curl /
Python / Node, ảnh, audio, embedding, realtime, tác vụ async), xem các tệp
khác trong [`examples/`](../examples/).
