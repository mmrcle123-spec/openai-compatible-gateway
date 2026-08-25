# Front-end / self-hosted configs

All of these speak the OpenAI API, so the only change is the base URL and key.

## LibreChat

`librechat.yaml` → `endpoints.openai`:

```yaml
openai:
  - name: "AirAi"
    apiKey: "<your-gateway-key>"
    baseURL: "https://api.airai.cc/v1"
    models:
      - "gpt-4o-mini"
      - "claude-3-5-sonnet"
      - "deepseek-chat"
```

## OpenWebUI

Settings → Connections → OpenAI API:
- Base URL: `https://api.airai.cc/v1`
- API Key: `<your-gateway-key>`

## SillyTavern

Data Bank → API Connections → Text Completion / Chat Completion:
- API Type: OpenAI
- Base URL: `https://api.airai.cc/v1`
- API Key: `<your-gateway-key>`
- Model: `claude-*`, `deepseek-chat`, `gpt-4o-mini`, etc.

## Cline / Continue / Cursor (BYOK)

Set the extension's "Custom Base URL" / `openaiBaseUrl`:
- URL: `https://api.airai.cc/v1`
- Key: `<your-gateway-key>`
