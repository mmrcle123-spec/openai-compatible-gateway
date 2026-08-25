# Image generation & editing

Base: `https://api.airai.cc/v1`. All OpenAI-compatible image endpoints.

## Generation (DALL·E 3 / gpt-image-1 / FLUX / etc.)

```python
from openai import OpenAI
client = OpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY")

r = client.images.generate(
    model="gpt-image-1",                 # or "dall-e-3", "flux-1", "seedream", "imagen-4"
    prompt="a minimalist workspace, soft morning light",
    size="1024x1024",
    # response_format="b64_json"  # if you want raw bytes instead of a URL
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

## Editing (gpt-image-1)

Inputs must be **≤ 4 MB** each.

```python
r = client.images.edit(
    model="gpt-image-1",
    image=open("/path/to/input.png", "rb"),
    prompt="add a red hat",
)
print(r.data[0].url)
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

> Some models return a hosted URL; others return base64. Check the `data[0]`
> shape in the response. Generation is billed under the **image** group
> fee-rate (see `PRICING.md`).
