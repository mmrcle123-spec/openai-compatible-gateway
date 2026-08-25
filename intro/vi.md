# Cổng API tương thích OpenAI — Hướng dẫn tích hợp

> ## 🔥 Cắt giảm hóa đơn API lên đến **80%** · 🧩 **468+ mô hình sau MỘT endpoint** · 💸 USDT, không cần thẻ, không KYC
>
> Một endpoint *drop-in*, tương thích với API OpenAI. Đổi `base_url`, code giữ
> nguyên. **GPT · Claude · DeepSeek · ảnh · embedding** sau một giao diện.

**Tóm tắt — tại sao các đội hướng về đây**

- 💰 **Rẻ hơn tới 80%** so với giá chính thức (tới 90% ở gói khối lượng lớn)
- 🧩 **468+ mô hình, một endpoint** — thôi cắm riêng từng nhà cung cấp mỗi route
- ⚡ **Tương thích OpenAI sẵn sàng** — chỉ đổi `base_url`, không viết lại code
- 🌍 **USDT (TRC-20)** mặc định, **không KYC, không phí hàng tháng**, trả tiền theo dùng

Một endpoint *drop-in*, tương thích với API OpenAI. Đổi `base_url` và giữ nguyên
mã hiện tại. Hàng trăm mô hình đứng sau một giao diện — OpenAI, Claude,
DeepSeek, hình ảnh và *embedding* — để bạn không phải quản lý nhiều nhà cung cấp
cho mỗi route.

Hướng dẫn này viết cho **các operator đã chạy sẵn app, gateway hoặc front-end
nói API OpenAI** (SDK Python/Node, Cline, Continue, Cursor BYOK, LibreChat,
OpenWebUI, SillyTavern, v.v.).

## Tại sao tồn tại (góc nhìn trung lập)

Hầu hết ứng dụng AI được xây dựng trên hạ tầng thanh toán bằng thẻ / fiat. Hạ
tầng đó không phục vụ mọi phân khúc: một số người dùng không có thẻ, một số
thanh toán bằng crypto theo mặc định, và một số khu vực không nằm trong điều
khoản dịch vụ của các nhà cung cấp chính.

Endpoint này là một **luồng thanh toán trung lập**: USDT (crypto) mặc định,
không thẻ, không KYC. Cùng giao diện tương thích OpenAI bạn đang dùng. Được
thiết kế để tồn tại *cạnh* các phương thức thanh toán hiện tại như một route
bổ sung — không thay thế chúng.

## Bắt đầu nhanh

```python
OPENAI_BASE_URL = "https://api.airai.cc/v1"
OPENAI_API_KEY  = "<khóa-của-bạn>"   # lấy khi đăng ký hoặc qua TG @mmrcle
```

- Python: xem [`examples/python.md`](../examples/python.md)
- Node: xem [`examples/node.md`](../examples/node.md)
- curl: xem [`examples/curl.md`](../examples/curl.md)
- Ghi chú Claude Code / giao thức Anthropic: xem [`examples/claude-code.md`](../examples/claude-code.md)
- LibreChat / OpenWebUI / SillyTavern: xem [`examples/frontends.md`](../examples/frontends.md)

## Lấy khóa dùng thử

1. **Đăng ký tại gateway** → cấp tín dụng dùng thử khi đăng ký, không cần thẻ.
   Dùng để kiểm tra độ trễ, độ phủ mô hình và chất lượng.
2. **Liên hệ qua TG:** `@mmrcle` — cho cung ứng *white-label* / bán sỉ, khóa dùng
   thử hoặc câu hỏi tích hợp.

## Mô hình

Hàng trăm mô hình trong nhiều họ, bao gồm:

- **OpenAI:** GPT-4o / 4o-mini, chuỗi suy luận o-series, embedding
- **Claude:** Opus / Sonnet / Haiku (qua route tương thích OpenAI)
- **DeepSeek:** V3 / R1 và các biến thể chắt lọc
- **Hình ảnh:** SD, Flux và các image-API phương Tây phổ biến
- **Embedding / rerank** khi có sẵn

Danh sách trực tiếp lấy từ `/v1/models`.

## Giá

Các mức minh bạch so với giá niêm yết chính thức, trong dải **~0,03–0,3 giá
niêm yết chính thức** tuỳ mức và họ mô hình. Không phí tháng. Trả theo dùng.
Thanh toán bằng USDT.

- **Standard** (~0,3): dùng chung, hình ảnh, embedding
- **Pro** (~0,15): tải trọng Claude / lập trình nặng
- **Wholesale** (~0,09): operator khối lượng lớn, white-label upstream

## Khu vực và khả dụng

Khả dụng **theo điều khoản dịch vụ của gateway**. Không đưa ra bất kỳ tuyên bố
địa lý nào; hãy kiểm tra điều khoản cho khu vực của bạn trước khi route traffic
sản xuất.

## Thanh toán

- **USDT** (TRC-20) mặc định — không thẻ, không KYC.
- Các crypto khác được cân nhắc cho tài khoản bán sỉ / lớn.

## Câu hỏi thường gặp

**Đây có thay thế nhà cung cấp hiện tại của tôi không?**
Không. Đây là route bổ sung tương thích OpenAI bạn có thể gọi cho các phân khúc
mà stack hiện tại không phục vụ (người dùng không thẻ, thanh toán crypto-native,
khu vực ngoài điều khoản nhà cung cấp).

**Tôi có phải viết lại mã không?**
Nếu client của bạn nói API OpenAI, bạn chỉ đổi `base_url` và `api_key`.

**Làm sao xác minh trước khi trả tiền?**
Đăng ký → tín dụng dùng thử → chạy workload của bạn qua endpoint.

*Hướng dẫn tích hợp kỹ thuật. Vận hành độc lập; tài liệu này mô tả endpoint và
cách kết nối, không phải lời chào bán.*

🔗 Tài liệu đầy đủ tiếng Anh: [README.md](../README.md) · Ví dụ: [examples/](../examples/)
