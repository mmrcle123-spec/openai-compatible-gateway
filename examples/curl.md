# Raw curl

```bash
# Chat
curl https://api.airai.cc/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o-mini",
    "messages": [{"role": "user", "content": "Hello from the gateway."}]
  }'

# List models
curl https://api.airai.cc/v1/models \
  -H "Authorization: Bearer $OPENAI_API_KEY"

# Image
curl https://api.airai.cc/v1/images/generations \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"flux-1","prompt":"a minimalist workspace","size":"1024x1024"}'
```

```bash
export OPENAI_API_KEY="<your-gateway-key>"
```
