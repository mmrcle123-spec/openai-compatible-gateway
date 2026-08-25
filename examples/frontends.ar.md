# العملاء والأدوات — أدلة خطوة بخطوة

هذه الصفحة دليل إعداد خطوة بخطوة لـ **15 عميلاً وأداة تطوير** تعمل مع البوابة.
كُتب كل دليل مقابل الواجهة الحقيقية للبوابة. اختر أداتك، اتبع الخطوات، وستعمل
خلال أقل من دقيقتين.

> **القاعدة التي تغطي كل شيء**
> وجّه **عنوان URL الأساسي المتوافق مع OpenAI** في أداتك إلى
> `https://api.airai.cc/v1`، أو عيّن **متغير بيئة المزوّد** إلى الجذر الأصلي
> لـ Claude / Gemini:
> - Claude: `ANTHROPIC_BASE_URL=https://api.airai.cc`
> - Gemini: `GOOGLE_GEMINI_BASE_URL=https://api.airai.cc`
>
> نفس واجهة OpenAI المتوافقة، ونفس المفتاح، و468+ نموذج خلفها.

---

## فهرس سريع

| # | العميل / الأداة | الأنسب لـ | البروتوكول |
|---|---|---|---|
| 1 | [ChatBox](#1-chatbox) | دردشة سطح المكتب / الجوال | OpenAI |
| 2 | [CherryStudio](#2-cherrystudio) | متعدد المزوّدات + MCP | OpenAI + Claude MCP |
| 3 | [Cursor](#3-cursor) | محرر أكواد بالذكاء الاصطناعي (BYOK) | OpenAI |
| 4 | [Cline](#4-cline-vs-code) | وكيل أكواد في VS Code | OpenAI |
| 5 | [Codex](#5-codex) | وكيل أكواد في الطرفية | OpenAI |
| 6 | [aider](#6-aider) | برمجة زوجية في CLI | OpenAI |
| 7 | [Gemini CLI](#7-gemini-cli) | واجهة Gemini الأصلية | Gemini أصلي |
| 8 | [Claude Code](#8-claude-code) | واجهة Anthropic الأصلية | Anthropic أصلي |
| 9 | [LobeChat](#9-lobechat) | واجهة دردشة مُستضافة ذاتياً | OpenAI |
| 10 | [Dify](#10-dify) | LLMOps / بناء الوكلاء | OpenAI |
| 11 | [N8N](#11-n8n) | أتمتة سير العمل | OpenAI |
| 12 | [NextChat](#12-nextchat) | دردشة ويب خفيفة | OpenAI |
| 13 | [Immersive Translate](#13-immersive-translate) | الترجمة في المتصفح | OpenAI |
| 14 | [LangChain](#14-langchain) | إطار العملاء | OpenAI / Anthropic / Gemini |
| 15 | [LlamaIndex](#15-llamaindex) | إطار RAG / البيانات | OpenAI |

**تحتاج مفتاحاً أولاً؟** احصل على مفتاح تجريبي مجاني — راجع قسم
*Get a test key* في [README الرئيسي](../README.md).

---

## 1. ChatBox

عميل دردشة متعدد المنصات (macOS / Windows / Linux) وجوال.

**سطح المكتب**
1. افتح ChatBox ← **Settings** (الترس).
2. **Model Provider** ← **Add custom provider**.
3. املأ: API Host `https://api.airai.cc/v1`، API Key مفتاحك، Model `gpt-4o`.
4. احفظ وابدأ محادثة جديدة.

**الجوال (iOS / Android)**: نفس المسار.

**تحقق**: أرسل "مرحباً" — أي رد يؤكد عمل المسار.

---

## 2. CherryStudio

عميل سطح مكتب متعدد المزوّدات مع دعم MCP مدمج.

**مزوّد OpenAI**
1. Settings ← **Model Provider** ← **OpenAI**.
2. فعّل، واضبط API Address `https://api.airai.cc/v1` + API Key.
3. **Manage / Add model** وأضف ما تحتاجه.
4. نماذج التفكير `o4-mini` / `o3` قابلة للاختيار.

**خادم Claude MCP (اختياري)**: Settings ← **MCP Servers** ← **Add** ← خادم
SSE/HTTP يشير إلى نقطة MCP الخاصة بالبوابة.

---

## 3. Cursor

محرر أكواد بالذكاء الاصطناعي. يستخدم **BYOK**.

1. **Settings** (⌘/Ctrl + ,) ← ابحث عن **Models**.
2. فعّل **Bring Your Own Key** (BYOK).
3. اضبط عنوان URL الأساسي `https://api.airai.cc/v1` والصق مفتاحك.
4. في محدد النموذج اكتب `gpt-4o` أو `claude-3.5-sonnet`.

**حيلة البادئة `new-`**: أضف `new-` قبل النموذج (مثلاً `new-gpt-4o`).

---

## 4. Cline (VS Code)

وكيل أكواد تلقائي كإضافة لـ VS Code.

1. ثبّت **Cline** وافتح لوحته.
2. **Settings** ← **API Provider** ← **OpenAI-compatible**.
3. Base URL `https://api.airai.cc/v1`، API Key، Model ID `claude-3.5-sonnet` / `gpt-4o` / `deepseek-chat`.

---

## 5. Codex

وكيل أكواد طرفي من OpenAI (macOS / Linux / Windows-WSL).

أنشئ `~/.codex/config.toml`:
```toml
[model]
base_url = "https://api.airai.cc/v1"
api_key  = "YOUR_KEY"
model    = "gpt-4o"
```
**بديل — متغيرات البيئة**: `export OPENAI_BASE_URL="https://api.airai.cc/v1"` + `export OPENAI_API_KEY="YOUR_KEY"`.

---

## 6. aider

برمجة زوجية في الطرفية.
```bash
aider --openai-api-base https://api.airai.cc/v1 --openai-api-key YOUR_KEY --model gpt-4o
```
**دائم — `.aider.conf.yml`**: `openai-api-base: https://api.airai.cc/v1` / `openai-api-key: YOUR_KEY` / `model: gpt-4o`.

---

## 7. Gemini CLI

واجهة Gemini الرسمية على **الجذر الأصلي Gemini**. انظر [`gemini-cli.md`](gemini-cli.md).
```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"
gemini
```

---

## 8. Claude Code

وكيل Claude الرسمي من Anthropic على **الجذر الأصلي Anthropic**. انظر [`claude-code.md`](claude-code.md).
```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
claude
```

---

## 9. LobeChat

واجهة دردشة مفتوحة المصدر، مثالية للاستضافة الذاتية.

**داخل التطبيق**: Settings ← **AI Provider** ← **OpenAI** ← Base URL `https://api.airai.cc/v1` + المفتاح.

**مستضافة ذاتياً (Docker / env)**:
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_PROXY_URL="https://api.airai.cc/v1"
```

---

## 10. Dify

منصة LLMOps مفتوحة المصدر لبناء الوكلاء وRAG.

1. **Settings** ← **Model Provider**.
2. أضف **OpenAI** (أو "OpenAI-API-compatible").
3. API Key مفتاحك، API Base `https://api.airai.cc/v1`.
4. استخدمها في Apps / Workflows / Agents.

---

## 11. N8N

أتمتة مع عقدة OpenAI.

**الخيار أ — عقدة OpenAI**: بيانات اعتماد **OpenAI API** مع Base URL `https://api.airai.cc/v1`.

**الخيار ب — عقدة HTTP Request**:
```json
{ "method": "POST", "url": "https://api.airai.cc/v1/chat/completions",
  "headers": {"Authorization": "Bearer YOUR_KEY", "Content-Type": "application/json"},
  "body": {"model": "gpt-4o", "messages": [{"role": "user", "content": "Hello"}]} }
```

---

## 12. NextChat

دردشة ويب خفيفة (سابقاً ChatGPT-Next-Web).
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

إضافة متصفح تترجم الصفحات باستخدام LLM.

1. الإعدادات ← **Translation Service** ← **OpenAI / Custom**.
2. API URL `https://api.airai.cc/v1`، API Key مفتاحك، Model `gpt-4o-mini`.

**نصيحة**: استخدم `gpt-4o-mini` — الترجمة عالية الحجم ومنخفضة التعقيد.

---

## 14. LangChain

إطار العملاء / RAG (Python؛ JS مشابه).

**لهجة OpenAI**
```python
from langchain_openai import ChatOpenAI
llm = ChatOpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
```
**لهجة Anthropic (أصلية)**
```python
from langchain_anthropic import ChatAnthropic
llm = ChatAnthropic(base_url="https://api.airai.cc", api_key="YOUR_KEY", model="claude-3.5-sonnet")
```
**لهجة Gemini (أصلية)**
```python
from langchain_google_genai import ChatGoogleGenerativeAI
llm = ChatGoogleGenerativeAI(base_url="https://api.airai.cc", google_api_key="YOUR_KEY", model="gemini-2.5-pro")
```

---

## 15. LlamaIndex

إطار بيانات لـ RAG / العملاء (Python).
```python
from llama_index.llms.openai import OpenAI
llm = OpenAI(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
print(llm.complete("hello"))
```
**تضمينات لـ RAG**
```python
from llama_index.embeddings.openai import OpenAIEmbedding
embed = OpenAIEmbedding(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="text-embedding-3-small")
```

---

## قاعدة عامة لما عدا ذلك

إذا كانت الأداة تتحدث **OpenAI / Anthropic / Gemini**، فهي تعمل هنا:

| تتحدث… | عيّن هذا | إلى |
|---|---|---|
| OpenAI API | `base_url` / `OPENAI_BASE_URL` | `https://api.airai.cc/v1` |
| Anthropic (Claude) | `ANTHROPIC_BASE_URL` | `https://api.airai.cc` |
| Gemini | `GOOGLE_GEMINI_BASE_URL` | `https://api.airai.cc` |

احتفظ بمفتاحك، استبدل URL — وتصبح كل النماذج متاحة. لأمثلة على مستوى API
(curl / Python / Node والصور والصوت والتضمينات وrealtime والمهام غير المتزامنة)
راجع بقية ملفات [`examples/`](../examples/).
