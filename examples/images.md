# Image generation & editing

Base: `https://api.airai.cc/v1`. All OpenAI-compatible image endpoints
(`/images/generations`, `/images/edits`). See also the
[model family page](../models/image.md).

## Generation

```python
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")

r = client.images.generate(
    model="gpt-image-1",                 # dall-e-3 | gpt-image-1 | flux-1 | seedream | imagen-4 | qwen-image
    prompt="a minimalist workspace, soft morning light",
    size="1024x1024",
    # response_format="b64_json"        # raw bytes instead of a hosted URL
)
print(r.data[0].url)        # or r.data[0].b64_json
```

curl:

```bash
curl https://api.airai.cc/v1/images/generations \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"flux-1","prompt":"a cat on a rooftop","size":"1024x1024"}'
```

### Size & format notes

- Common `size` values: `1024x1024`, `1024x1792`, `1792x1024`.
- Not every model supports every size — if a size is rejected, the error
  message tells you the allowed set.
- `response_format`:
  - `"url"` (default) → `data[0].url` is a hosted image link.
  - `"b64_json"` → `data[0].b64_json` is base64 — decode and write to disk
    when you need the bytes directly.

### Handling the response shape

```python
img = r.data[0]
if img.url:
    print("hosted:", img.url)
elif img.b64_json:
    import base64
    open("out.png", "wb").write(base64.b64decode(img.b64_json))
```

## Editing (gpt-image-1)

Inputs must be **≤ 4 MB** each.

```python
r = client.images.edit(
    model="gpt-image-1",
    image=open("/path/to/input.png", "rb"),
    prompt="add a red hat",
    # mask=open("/path/to/mask.png","rb"),   # optional inpainting mask
)
print(r.data[0].url)
```

curl (multipart):

```bash
curl https://api.airai.cc/v1/images/edits \
  -H "Authorization: Bearer $KEY" \
  -F "model=gpt-image-1" \
  -F "prompt=add a red hat" \
  -F "image=@/path/to/input.png"
```

## Available image models

| Model | Notes |
|---|---|
| `dall-e-3` | OpenAI, prompt-following |
| `gpt-image-1` | OpenAI, supports edit |
| `flux-1` | Open-weight, high quality |
| `seedream` | |
| `imagen-4` | Google imagen |
| `qwen-image` | |

## Billing

Generation and editing are billed under the **image** group fee-rate (see
[`PRICING.md`](../PRICING.md)) — a premium over base due to GPU cost.

## Related

- [Image model family](../models/image.md)
- [Async video / music](../examples/async-tasks.md)
