# Gateway API Kompatibel OpenAI — Panduan Integrasi

> ## 🔥 Pangkas tagihan API hingga **80%** · 🧩 **468+ model di balik SATU endpoint** · 💸 USDT, tanpa kartu, tanpa KYC
>
> Sebuah endpoint *drop-in*, kompatibel dengan API OpenAI. Ganti `base_url` dan
> kode tetap sama. **GPT · Claude · DeepSeek · gambar · embedding** di balik satu
> antarmuka.

**Ringkas — mengapa tim mengarahkan ke sini**

- 💰 **Hingga 80% lebih murah** dari harga resmi (hingga 90% di tier volume tinggi)
- 🧩 **468+ model, satu endpoint** — berhenti menyambungkan penyedia berbeda per rute
- ⚡ **Kompatibel OpenAI langsung pakai** — cukup ganti `base_url`, tanpa tulis ulang kode
- 🌍 **USDT (TRC-20)** bawaan, **tanpa KYC, tanpa biaya bulanan**, bayar per pakai

Sebuah endpoint *drop-in*, kompatibel dengan API OpenAI. Ganti `base_url` Anda
dan pertahankan kode yang sudah ada. Beberapa ratus model di balik satu
antarmuka — OpenAI, Claude, DeepSeek, gambar, dan *embedding* — sehingga Anda
tidak perlu mengelola banyak penyedia per rute.

Panduan ini ditulis untuk **operator yang sudah menjalankan aplikasi, gateway,
atau front-end yang menggunakan API OpenAI** (SDK Python/Node, Cline, Continue,
Cursor BYOK, LibreChat, OpenWebUI, SillyTavern, dll.).

## Mengapa ada (kerangka netral)

Sebagian besar aplikasi AI dibangun di atas infrastruktur penagihan kartu /
fiat. Infrastruktur tersebut tidak melayani semua segmen: sebagian pengguna
tidak punya kartu, sebagian menyelesaikan pembayaran dalam kripto secara
default, dan sebagian region tidak dicakup oleh ketentuan layanan penyedia
utama.

Endpoint ini adalah **jalur penyelesaian yang agnostik**: USDT (kripto) secara
default, tanpa kartu, tanpa KYC. Antarmuka kompatibel-OpenAI yang sama yang
sudah Anda gunakan. Dibuat untuk berdampingan *bersama* metode pembayaran Anda
saat ini sebagai rute tambahan — bukan pengganti.

## Mulai cepat

```python
OPENAI_BASE_URL = "https://api.airai.cc/v1"
OPENAI_API_KEY  = "<kunci-anda>"   # dapatkan saat mendaftar atau via TG @mmrcle
```

- Python: lihat [`examples/python.md`](../examples/python.md)
- Node: lihat [`examples/node.md`](../examples/node.md)
- curl: lihat [`examples/curl.md`](../examples/curl.md)
- Catatan Claude Code / protokol Anthropic: lihat [`examples/claude-code.md`](../examples/claude-code.md)
- LibreChat / OpenWebUI / SillyTavern: lihat [`examples/frontends.md`](../examples/frontends.md)

## Dapatkan kunci uji

1. **Daftar di gateway** → kredit uji diberikan saat pendaftaran, tanpa kartu.
   Gunakan untuk memvalidasi latensi, cakupan model, dan kualitas.
2. **Hubungi kami di TG:** `@mmrcle` — untuk pasokan *white-label* / grosir, kunci
   uji, atau pertanyaan integrasi.

## Model

Beberapa ratus model dalam berbagai keluarga, termasuk:

- **OpenAI:** GPT-4o / 4o-mini, penalaran o-series, embedding
- **Claude:** Opus / Sonnet / Haiku (via rute kompatibel OpenAI)
- **DeepSeek:** V3 / R1 dan varian terdestilasi
- **Gambar:** SD, Flux, dan API gambar barat umum
- **Embedding / rerank** di mana tersedia

Daftar langsung dari `/v1/models`.

## Harga

Tingkatan transparan relatif terhadap harga daftar resmi, dalam kisaran
**~0,03–0,3 dari harga daftar resmi** tergantung tingkat dan keluarga. Tanpa
biaya bulanan. Bayar sesuai pemakaian. Penyelesaian dalam USDT.

- **Standard** (~0,3): penggunaan umum, gambar, embedding
- **Pro** (~0,15): beban kerja Claude / pengodean berat
- **Wholesale** (~0,09): operator volume tinggi, white-label upstream

## Region & ketersediaan

Ketersediaan **sesuai ketentuan layanan gateway**. Tidak ada klaim geografis;
periksa ketentuan untuk region Anda sebelum merutekan trafik produksi.

## Penyelesaian

- **USDT** (TRC-20) secara default — tanpa kartu, tanpa KYC.
- Kripto lain dipertimbangkan untuk akun grosir / besar.

## Pertanyaan umum

**Apakah ini pengganti penyedia saya saat ini?**
Tidak. Ini rute tambahan yang kompatibel dengan OpenAI yang bisa Anda panggil
untuk segmen yang tidak dilayani stack Anda saat ini (pengguna tanpa kartu,
penyelesaian kripto-native, region di luar ketentuan penyedia Anda).

**Apakah saya perlu menulis ulang kode?**
Jika klien Anda menggunakan API OpenAI, Anda hanya mengubah `base_url` dan
`api_key`.

**Bagaimana cara memverifikasi sebelum membayar?**
Daftar → kredit uji → jalankan beban kerja Anda ke endpoint.

*Panduan integrasi teknis. Dikelola secara independen; dokumen ini menjelaskan
endpoint dan cara menyambungkannya, bukan penawaran penjualan.*

🔗 Dokumentasi lengkap dalam bahasa Inggris: [README.md](../README.md) ·
Contoh: [examples/](../examples/)
