# Image generation & editing models

Turn text (and images) into pictures. Called through the **OpenAI-compatible**
route: base URL `https://api.airai.cc/v1`, endpoint `/images/generations`
(and `/images/edits` for `gpt-image-1`).

## Available models

| Model | Type | Notes |
|---|---|---|
| `dall-e-3` | OpenAI | Strong prompt-following |
| `gpt-image-1` | OpenAI | Supports **edit**; ≤ 4 MB inputs |
| `flux-1` | Open-weight | High-quality, fast |
| `seedream` | — | Text-to-image |
| `imagen-4` | Google | Google Imagen quality |
| `qwen-image` | — | Open-weight |

## Generation

```python
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")
r = client.images.generate(
    model="flux-1",                       # or dall-e-3, gpt-image-1, imagen-4...
    prompt="a minimalist workspace, soft morning light",
    size="1024x1024",
    # response_format="b64_json"         # raw bytes instead of URL
)
print(r.data[0].url)        # or r.data[0].b64_json
```

Common `size` values: `1024x1024`, `1024x1792`, `1792x1024`. Not every model
supports every size — check the error message if a size is rejected.

## Editing (gpt-image-1)

```python
r = client.images.edit(
    model="gpt-image-1",
    image=open("/path/to/input.png", "rb"),   # ≤ 4 MB
    prompt="add a red hat",
)
print(r.data[0].url)
```

`gpt-image-1` also supports a mask image for inpainting:
`mask=open("mask.png","rb")`.

## Response shape

- Some models return a **hosted URL** in `data[0].url`.
- Others return **base64** in `data[0].b64_json`.
- Inspect the actual shape before persisting — it varies by model.

## Group fee-rate

All image generation is billed under the **image** group (see
[PRICING](../PRICING.md)), which carries a premium over base because of GPU
cost. Editing uses the same image group.

## Related

- [Audio](../models/audio.md) · [Video](../models/video.md)
- [Async tasks example](../examples/async-tasks.md)
- Back to [model index](../models.md)
