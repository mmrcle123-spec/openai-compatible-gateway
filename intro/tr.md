# OpenAI Uyumlu API Ağ Geçidi — Entegrasyon Rehberi

> ## 🔥 API faturanızı **%80'e kadar** düşürün · 🧩 **TEK endpoint arkasında 468+ model** · 💸 USDT, kart yok, KYC yok
>
> *Drop-in*, OpenAI uyumlu bir uç nokta. `base_url` adresinizi değiştirin, mevcut
> kodunuzu koruyun. **GPT · Claude · DeepSeek · görsel · embedding** tek
> arayüzün arkasında.

**Özet — ekipler neden buraya yönlendiriyor**

- 💰 Resmi fiyata göre **%80'e kadar daha ucuz** (yüksek hacimli katmanda %90'a kadar)
- 🧩 **468+ model, tek endpoint** — rota başına ayrı sağlayıcıyı bırakın
- ⚡ **Hazır OpenAI uyumu** — sadece `base_url` değişir, kod yazılmaz
- 🌍 **USDT (TRC-20)** varsayılan, **KYC yok, aylık ücret yok**, kullandığın kadar öde

*Drop-in*, OpenAI uyumlu bir uç nokta. `base_url` adresinizi değiştirin, mevcut
kodunuzu koruyun. Tek bir arayüzün arkasında yüzlerce model — OpenAI, Claude,
DeepSeek, görsel ve *embedding* — böylece rota başına birden çok sağlayıcı
yönetmezsiniz.

Bu rehber, **OpenAI API'sini konuşan bir uygulama, ağ geçidi veya ön yüz
çalıştıran operatörler** için yazılmıştır (Python/Node SDK'ları, Cline,
Continue, Cursor BYOK, LibreChat, OpenWebUI, SillyTavern vb.).

## Neden var (tarafsız çerçeve)

Çoğu yapay zeka uygulaması kart / fiat faturalandırma altyapısı üzerine
kuruludur. Bu altyapı her kesimi karşılamaz: bazı kullanıcıların kartı yoktur,
bazıları varsayılan olarak kripto ile tahsilat yapar ve bazı bölgeler ana
sağlayıcıların hizmet şartları kapsamında değildir.

Bu uç nokta **tahsilat açısından tarafsız bir hat**tır: varsayılan olarak USDT
(kripto), kartsız, KYC'siz. Zaten kullandığınız OpenAI uyumlu arayüz. Mevcut
ödeme yöntemlerinizin *yanında* ek bir rota olarak bulunmak üzere tasarlanmıştır
— onların yerine geçmek için değil.

## Hızlı başlangıç

```python
OPENAI_BASE_URL = "https://api.airai.cc/v1"
OPENAI_API_KEY  = "<anahtarınız>"   # kayıt olurken veya TG @mmrcle üzerinden alın
```

- Python: bkz. [`examples/python.md`](../examples/python.md)
- Node: bkz. [`examples/node.md`](../examples/node.md)
- curl: bkz. [`examples/curl.md`](../examples/curl.md)
- Claude Code / Anthropic protokol notu: bkz. [`examples/claude-code.md`](../examples/claude-code.md)
- LibreChat / OpenWebUI / SillyTavern: bkz. [`examples/frontends.md`](../examples/frontends.md)

## Test anahtarı alma

1. **Ağ geçidinde kayıt olun** → kayıt sırasında kart gerektirmeden deneme
   kredisi verilir. Gecikmeyi, model kapsamını ve kaliteyi doğrulamak için
   kullanın.
2. **TG üzerinden bize ulaşın:** `@mmrcle` — beyaz etiket / toptan tedarik,
   test anahtarları veya entegrasyon soruları için.

## Modeller

Çeşitli ailelerde yüzlerce model, şunlar dahil:

- **OpenAI:** GPT-4o / 4o-mini, o-series akıl yürütme, embeddings
- **Claude:** Opus / Sonnet / Haiku (OpenAI uyumlu rota üzerinden)
- **DeepSeek:** V3 / R1 ve damıtılmış varyantlar
- **Görsel:** SD, Flux ve yaygın batı görsel API'leri
- **Embedding / rerank** mevcut olduğu yerlerde

Canlı liste `/v1/models` ile alınır.

## Fiyatlandırma

Resmi liste fiyatına göre şeffaf kademeler, kademe ve modele göre **~0,03–0,3
aralığında resmi liste fiyatı** civarında. Aylık ücret yok. Kullandığın kadar öde.
Tahsilat USDT ile.

- **Standard** (~0,3): genel kullanım, görsel, embeddings
- **Pro** (~0,15): ağır Claude / kodlama iş yükleri
- **Wholesale** (~0,09): yüksek hacimli operatörler, white-label upstream

## Bölge ve kullanılabilirlik

Kullanılabilirlik **ağ geçidinin hizmet şartlarına göre**dir. Hiçbir coğrafi
iddia yapılmaz; üretim trafiği yönlendirmeden önce bölgeniz için şartları
kontrol edin.

## Tahsilat

- Varsayılan olarak **USDT** (TRC-20) — kartsız, KYC'siz.
- Büyük / toptan hesaplar için diğer kriptolar değerlendirilir.

## Sıkça sorulan sorular

**Mevcut sağlayıcımın yerine mi geçiyor?**
Hayır. Mevcut stack'inizin karşılamadığı kesimler (kartsız kullanıcılar,
kripto-doğal tahsilat, sağlayıcınızın şartlarının dışındaki bölgeler) için
çağırabileceğiniz ek bir OpenAI uyumlu rotadır.

**Kodumu yeniden mi yazmalıyım?**
İstemciniz OpenAI API'sini konuşuyorsa, yalnızca `base_url` ve `api_key`
değişir.

**Ödeme yapmadan önce nasıl doğrularım?**
Kayıt olun → deneme kredisi → iş yüklerinizi uç noktaya karşı çalıştırın.

*Teknik entegrasyon rehberi. Bağımsız olarak işletilir; bu belge uç noktayı ve
bağlanma şeklini açıklar, bir satış pitch'i değildir.*

🔗 Tam İngilizce dokümantasyon: [README.md](../README.md) · Örnekler: [examples/](../examples/)
