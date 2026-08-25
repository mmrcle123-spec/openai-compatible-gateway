# بوابة API متعددة البروتوكولات لـ LLM — OpenAI / Claude / Gemini أصلي — أرخص بـ 80%، 468+ نموذجاً

> ## 🔥 خفّض فاتورة واجهة برمجة التطبيقات حتى **80%** · 🧩 **468+ نموذجاً، متعدد البروتوكولات** · 💸 USDT، بدون بطاقة، بدون KYC
>
> بوابة LLM **متعددة البروتوكولات**. تتحدث الصيغ **الأصلية لـ OpenAI وAnthropic
> Claude وGoogle Gemini** — ليست مجرد دردشة OpenAI. حساب واحد، كل اللهجات. **GPT ·
> Claude · DeepSeek · Gemini · صور · صوت · تضمين · فيديو · موسيقى** خلف واجهة واحدة.

**ملخص — لماذا توجّه الفرق حِملها هنا**

- 💰 **أرخص بنسبة تصل إلى 80%** من السعر الرسمي (حتى ~90% في فئات الحجم العالي)
- 🧩 **468+ نموذجاً، حساب واحد** — توقّف عن ربط مزوّد مختلف لكل مسار
- ⚡ **متعدد البروتوكولات الأصلي** — OpenAI وAnthropic Claude وGemini الأصلي، إضافة إلى shim لـ Replicate / Fal / Suno
- 🤖 **تغطية كاملة للقدرات** — دردشة، تدفق، رؤية، استدعاء دوال، تضمين، صوت (ASR+TTS)، صور، فيديو، موسيقى، realtime
- 🌍 **USDT (TRC-20)** افتراضياً، **بدون KYC، بدون رسوم شهرية**، ادفع حسب الاستخدام
- 🧰 **Drop-in لـ 15+ عميلاً** — ChatBox وCherryStudio وCursor وCline وCodex وaider وLobeChat وDify وN8N وNextChat وLangChain وLlamaIndex والمزيد

## صيغ API المدعومة

هذه البوابة **ليست** «مجرد OpenAI مع طبقة ترجمة». تكشف **نقاط نهاية أصلية** للـ
SDK الثلاثة الرئيسية، فتستخدم المكتبة الرسمية لكل مزوّد دون تغيير.

| البروتوكول | Base URL | كيفية الاستدعاء | ملاحظات |
|---|---|---|---|
| **OpenAI** | `https://api.airai.cc/v1` | اضبط `base_url` في SDK الخاص بـ OpenAI | دردشة، تدفق (SSE)، رؤية، استدعاء دوال، تضمين، صوت، صور، realtime |
| **Anthropic Claude** | `https://api.airai.cc` (الجذر) | اضبط `ANTHROPIC_BASE_URL` في SDK الخاص بـ Anthropic / Claude Code | واجهة Messages الأصلية، تدفق، tool use |
| **Google Gemini** | `https://api.airai.cc` (الجذر) | اضبط `GOOGLE_GEMINI_BASE_URL` في CLI/SDK الخاص بـ Gemini | generateContent الأصلي |
| **Replicate** | `https://api.airai.cc/replicate` | عميل متوافق مع Replicate | نماذج open-weight خلف shim واحد |
| **Fal.ai** | `https://api.airai.cc/fal-ai/{model}` | عميل متوافق مع Fal | صور / فيديو خلف shim |
| **Suno** | `https://api.airai.cc/suno/...` | عميل متوافق مع Suno | توليد موسيقى |

> **لماذا الجذر لـ Claude وGemini؟** SDK الخاص بـ Anthropic وGemini يرسل الطلبات
> إلى جذر المزوّد (مثلاً `https://api.anthropic.com`)، لا إلى مسار فرعي `/v1`.
> وجّه `ANTHROPIC_BASE_URL` / `GOOGLE_GEMINI_BASE_URL` إلى `https://api.airai.cc`
> فتقدّم البوابة المسار الأصلي. أما SDK الخاص بـ OpenAI فيتوقع `/v1`، لذا استخدم
> `https://api.airai.cc/v1`.

## ماذا يمكنك بناء

| القدرة | أمثلة النماذج |
|---|---|
| دردشة (نص) | gpt-4o، claude-3.5-sonnet، deepseek-chat، gemini-1.5-pro |
| تدفق (SSE) | كل نماذج الدردشة |
| رؤية (صورة مدخلة) | gpt-4o، claude-3.5-sonnet، gemini-1.5-pro |
| استدلال (o-series) | o1، o3، o4-mini (`low`/`medium`/`high`) |
| استدعاء دوال / tool use | كل النماذج القادرة |
| تضمين | text-embedding-3-small، text-embedding-3-large، ada-002 |
| صوت (ASR + TTS) | whisper-1، tts-1 (6 أصوات) |
| صور | DALL·E 3، gpt-image-1، FLUX، Seedream، imagen-4، qwen-image |
| Realtime (websocket) | gpt-4o-realtime |
| فيديو (غير متزامن) | Kling، Luma، MiniMax، Jimeng، Fal |
| موسيقى | Suno |

## النماذج

العائلات الكبيرة الموجّهة عبر هذه البوابة:

- **GPT** — gpt-4o، gpt-4o-mini، gpt-4.1، o1 / o3 / o4-mini (استدلال)
- **Claude** — claude-3.5-sonnet، claude-3.7-sonnet، claude-opus-4، claude-haiku
- **DeepSeek** — deepseek-chat، deepseek-reasoner
- **Gemini** — gemini-1.5-pro، gemini-2.0-flash، gemini-2.5-pro
- **صور** — DALL·E 3، gpt-image-1، FLUX.1، Seedream، imagen-4، qwen-image
- **صوت** — whisper-1 (ASR)، tts-1 (TTS، 6 أصوات)
- **تضمين** — text-embedding-3-small / -3-large، text-embedding-ada-002
- **Realtime** — gpt-4o-realtime (websocket)
- **فيديو** — Kling، Luma، MiniMax، Jimeng، Fal (غير متزامن)
- **موسيقى** — Suno

المرجع الكامل: [`../models.md`](../models.md).

## البرامج والعملاء (دروس)

كل عميل أدناه تم التحقق منه مقابل هذه البوابة. الإعداد دائماً نفس الفكرة: وجّه
`base_url` الخاص به (أسلوب OpenAI) أو متغيّر بيئة المزوّد (Claude / Gemini) إلى
العناوين أعلاه.

| العميل / الأداة | البروتوكول | أين يُضبط |
|---|---|---|
| **ChatBox** | OpenAI | API مخصّص + base URL |
| **CherryStudio** | OpenAI + Claude MCP | إعدادات النموذج؛ رابط خادم MCP |
| **Cursor** | OpenAI (BYOK) | حيلة البادئة `new-` |
| **Cline** | OpenAI | base URL متوافق مع OpenAI |
| **Codex** | OpenAI | `config.toml` (3 منصات) |
| **aider** | OpenAI | `--openai-api-base` |
| **Gemini CLI** | Gemini أصلي | `GOOGLE_GEMINI_BASE_URL` |
| **Claude Code** | Anthropic أصلي | `ANTHROPIC_BASE_URL` |
| **LobeChat** | OpenAI | إعدادات المزوّد |
| **Dify** | OpenAI | إعداد مزوّد النموذج |
| **N8N** | OpenAI | عقدة HTTP / OpenAI |
| **NextChat** | OpenAI | متغيّر `BASE_URL` |
| **Immersive Translate** | OpenAI | قاعدة واجهة ترجمة API |
| **LangChain** | OpenAI / Anthropic / Gemini | `base_url` لنموذج الدردشة |
| **LlamaIndex** | OpenAI | `OPENAI_BASE_URL` |

دليل خطوة بخطوة للـ 15: [`../examples/frontends.md`](../examples/frontends.md).

## البداية السريعة

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",          # عند التسجيل أو عبر TG @mmrcle
)
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role":"user","content":"مرحبا"}],
)
print(r.choices[0].message.content)
```

Claude الأصلي: `export ANTHROPIC_BASE_URL="https://api.airai.cc"`. Gemini الأصلي:
`export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"`.

- Python: [`../examples/python.md`](../examples/python.md)
- Node: [`../examples/node.md`](../examples/node.md)
- curl: [`../examples/curl.md`](../examples/curl.md)
- Claude Code: [`../examples/claude-code.md`](../examples/claude-code.md)
- Gemini CLI: [`../examples/gemini-cli.md`](../examples/gemini-cli.md)
- صور / صوت / تضمين / realtime / مهام غير متزامنة: [`../examples/`](../examples/)

## الحصول على مفتاح تجريبي

1. **سجّل في البوابة** ← تُمنح أرصدة تجريبية عند التسجيل، بلا بطاقة. استخدمها
   للتحقق من زمن الاستجابة وتغطية النماذج والجودة.
2. **راسلنا على TG:** `@mmrcle` — لمناقشة التوريد الأبيض (white-label) / الجملة،
   أو مفاتيح تجريبية، أو أسئلة التكامل.

## التسعير

ثلاثة فئات، تُعبَّر كـ **مضاعِف لسعر القائمة الرسمي**:

| الفئة | المضاعِف | مقارنة بالرسمي | لـ |
|---|---|---|---|
| **Standard** | 0.3× | ~70% أقل | المطوّرون، ادفع حسب الاستخدام |
| **Pro** | 0.15× | ~85% أقل | الفرق ذات الحجم المستقر |
| **Wholesale** | 0.09× | ~91% أقل | الحجم العالي / الموزّعون |

نموذج **مجموعة تسعير**: كل عائلة (دردشة، استدلال، رؤية، صور، صوت، تضمين، فيديو،
موسيقى، realtime) تحمل تعديلاً بسيطاً فوق مضاعِف فئتك. التفاصيل:
[`../PRICING.md`](../PRICING.md).

## المنطقة والتوفر

التوفر **وفقاً لشروط خدمة البوابة**. لا يُدلى بأي ادعاء جغرافي؛ راجع الشروط
لمنطقتك قبل توجيه حركة الإنتاج.

## التسوية

- **USDT** (TRC-20) افتراضياً — بلا بطاقة، بلا KYC.
- تُنظر العملات المشفرة الأخرى (BTC وغيره) لحسابات الجملة / الكبيرة.

## أسئلة شائعة

**هل هذا مجرد proxy لـ OpenAI؟**
لا. يكشف نقاط نهاية أصلية لـ Anthropic وGemini، فيمكنك متابعة استخدام SDK الرسمي
لكل مزوّد. كما يعمل shim لـ Replicate / Fal / Suno.

**هل أحتاج لإعادة كتابة كودي؟**
لا. إن كان عميلك يتحدث API OpenAI / Anthropic / Gemini، فتتغير فقط `base_url`
(أو متغيّر بيئة المزوّد). لا شيء غير ذلك.

**كيف أتحقق قبل الدفع؟**
سجّل ← أرصدة تجريبية ← شغّل أعباء عملك على النقطة.

🔗 التوثيق الكامل بالإنجليزية: [README.md](../README.md) · أمثلة: [examples/](../examples/) · النماذج: [models.md](../models.md)
