# Passerelle API LLM Multi-Protocoles — OpenAI / Claude / Gemini Natif — 80% Moins Cher, 468+ Modèles

> ## 🔥 Réduisez votre facture API jusqu'à **80%** · 🧩 **468+ modèles, multi-protocoles** · 💸 USDT, sans carte, sans KYC
>
> Une passerelle LLM **multi-protocoles**. Parle les formats **natifs d'OpenAI,
> d'Anthropic Claude et de Google Gemini** — pas seulement le chat OpenAI. Un
> compte, tous les dialectes. **GPT · Claude · DeepSeek · Gemini · image · audio ·
> embedding · vidéo · musique** derrière une seule interface.

**En bref — pourquoi les équipes pointent ici**

- 💰 **Jusqu'à 80% moins cher** que le tarif officiel (jusqu'à ~90% sur les niveaux à fort volume)
- 🧩 **468+ modèles, un compte** — arrêtez de câbler un fournisseur différent par route
- ⚡ **Multi-protocoles natif** — OpenAI, Anthropic Claude et Gemini natifs, plus shims Replicate / Fal / Suno
- 🤖 **Couverture des capacités** — chat, streaming, vision, function calling, embeddings, audio (ASR+TTS), image, vidéo, musique, realtime
- 🌍 **USDT (TRC-20)** par défaut, **sans KYC, sans abonnement**, paiement à l'usage
- 🧰 **Drop-in pour 15+ clients** — ChatBox, CherryStudio, Cursor, Cline, Codex, aider, LobeChat, Dify, N8N, NextChat, LangChain, LlamaIndex et plus

## Formats d'API pris en charge

Cette passerelle **n'est pas** « seulement OpenAI avec une couche de
traduction ». Elle expose des **endpoints natifs** pour les trois SDK
principaux, donc vous utilisez la bibliothèque officielle de chaque fournisseur
sans modification.

| Protocole | Base URL | Comment l'appeler | Notes |
|---|---|---|---|
| **OpenAI** | `https://api.airai.cc/v1` | Définissez `base_url` dans le SDK OpenAI | chat, streaming (SSE), vision, function calling, embeddings, audio, images, realtime |
| **Anthropic Claude** | `https://api.airai.cc` (racine) | Définissez `ANTHROPIC_BASE_URL` dans le SDK Anthropic / Claude Code | API Messages native, streaming, tool use |
| **Google Gemini** | `https://api.airai.cc` (racine) | Définissez `GOOGLE_GEMINI_BASE_URL` dans le CLI/SDK Gemini | generateContent natif |
| **Replicate** | `https://api.airai.cc/replicate` | Client compatible Replicate | nombreux modèles open-weight derrière un shim |
| **Fal.ai** | `https://api.airai.cc/fal-ai/{model}` | Client compatible Fal | image / vidéo derrière un shim |
| **Suno** | `https://api.airai.cc/suno/...` | Client compatible Suno | génération musicale |

> **Pourquoi la racine pour Claude et Gemini ?** Les SDK Anthropic et Gemini
> envoient les requêtes à la racine du fournisseur (ex. `https://api.anthropic.com`),
> pas à un sous-chemin `/v1`. Pointez `ANTHROPIC_BASE_URL` / `GOOGLE_GEMINI_BASE_URL`
> vers `https://api.airai.cc` et la passerelle sert la route native. Le SDK OpenAI,
> lui, attend `/v1`, donc utilisez `https://api.airai.cc/v1`.

## Ce que vous pouvez construire

| Capacité | Exemples de modèles |
|---|---|
| Chat (texte) | gpt-4o, claude-3.5-sonnet, deepseek-chat, gemini-1.5-pro |
| Streaming (SSE) | tous les modèles de chat |
| Vision (image en entrée) | gpt-4o, claude-3.5-sonnet, gemini-1.5-pro |
| Raisonnement (o-series) | o1, o3, o4-mini (`low`/`medium`/`high`) |
| Function calling / tool use | tous les modèles capables |
| Embeddings | text-embedding-3-small, text-embedding-3-large, ada-002 |
| Audio (ASR + TTS) | whisper-1, tts-1 (6 voix) |
| Image | DALL·E 3, gpt-image-1, FLUX, Seedream, imagen-4, qwen-image |
| Realtime (websocket) | gpt-4o-realtime |
| Vidéo (asynchrone) | Kling, Luma, MiniMax, Jimeng, Fal |
| Musique | Suno |

## Modèles

Les grandes familles routées via cette passerelle :

- **GPT** — gpt-4o, gpt-4o-mini, gpt-4.1, o1 / o3 / o4-mini (raisonnement)
- **Claude** — claude-3.5-sonnet, claude-3.7-sonnet, claude-opus-4, claude-haiku
- **DeepSeek** — deepseek-chat, deepseek-reasoner
- **Gemini** — gemini-1.5-pro, gemini-2.0-flash, gemini-2.5-pro
- **Image** — DALL·E 3, gpt-image-1, FLUX.1, Seedream, imagen-4, qwen-image
- **Audio** — whisper-1 (ASR), tts-1 (TTS, 6 voix)
- **Embeddings** — text-embedding-3-small / -3-large, text-embedding-ada-002
- **Realtime** — gpt-4o-realtime (websocket)
- **Vidéo** — Kling, Luma, MiniMax, Jimeng, Fal (asynchrone)
- **Musique** — Suno

Référence complète : [`../models.md`](../models.md).

## Logiciels et clients (tutoriels)

Chaque client ci-dessous a été vérifié contre cette passerelle. La configuration
est toujours la même idée : pointez son `base_url` (style OpenAI) ou sa variable
d'environnement fournisseur (Claude / Gemini) vers les adresses ci-dessus.

| Client / outil | Protocole | Où configurer |
|---|---|---|
| **ChatBox** | OpenAI | API personnalisée + base URL |
| **CherryStudio** | OpenAI + Claude MCP | réglages de modèle ; URL du serveur MCP |
| **Cursor** | OpenAI (BYOK) | astuce du préfixe `new-` |
| **Cline** | OpenAI | base URL compatible OpenAI |
| **Codex** | OpenAI | `config.toml` (3 plateformes) |
| **aider** | OpenAI | `--openai-api-base` |
| **Gemini CLI** | Gemini natif | `GOOGLE_GEMINI_BASE_URL` |
| **Claude Code** | Anthropic natif | `ANTHROPIC_BASE_URL` |
| **LobeChat** | OpenAI | réglages du fournisseur |
| **Dify** | OpenAI | configuration du fournisseur de modèle |
| **N8N** | OpenAI | nœud HTTP / OpenAI |
| **NextChat** | OpenAI | variable `BASE_URL` |
| **Immersive Translate** | OpenAI | base de l'API de traduction |
| **LangChain** | OpenAI / Anthropic / Gemini | `base_url` du modèle de chat |
| **LlamaIndex** | OpenAI | `OPENAI_BASE_URL` |

Guide étape par étape des 15 : [`../examples/frontends.md`](../examples/frontends.md).

## Démarrage rapide

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://api.airai.cc/v1",
    api_key="YOUR_KEY",          # à l'inscription ou via TG @mmrcle
)
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role":"user","content":"Bonjour"}],
)
print(r.choices[0].message.content)
```

Claude natif : `export ANTHROPIC_BASE_URL="https://api.airai.cc"`. Gemini natif :
`export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"`.

- Python : [`../examples/python.md`](../examples/python.md)
- Node : [`../examples/node.md`](../examples/node.md)
- curl : [`../examples/curl.md`](../examples/curl.md)
- Claude Code : [`../examples/claude-code.md`](../examples/claude-code.md)
- Gemini CLI : [`../examples/gemini-cli.md`](../examples/gemini-cli.md)
- Image / audio / embeddings / realtime / tâches asynchrones : [`../examples/`](../examples/)

## Obtenir une clé de test

1. **Inscrivez-vous sur la passerelle** → des crédits de test sont attribués à
   l'inscription, sans carte. Utilisez-les pour valider la latence, la couverture
   des modèles et la qualité.
2. **Contactez-nous sur TG :** `@mmrcle` — pour l'approvisionnement *white-label*
   / en gros, les clés de test ou les questions d'intégration.

## Tarifs

Trois niveaux, exprimés comme **multiplicateur du tarif public officiel** :

| Niveau | Multiplicateur | vs officiel | Pour |
|---|---|---|---|
| **Standard** | 0.3× | ~70% moins cher | développeurs, paiement à l'usage |
| **Pro** | 0.15× | ~85% moins cher | équipes à volume stable |
| **Wholesale** | 0.09× | ~91% moins cher | gros volume / revendeurs |

Modèle de **groupe de tarifs** : chaque famille (chat, raisonnement, vision,
image, audio, embedding, vidéo, musique, realtime) porte un léger ajustement sur
le multiplicateur de votre niveau. Détail : [`../PRICING.md`](../PRICING.md).

## Région et disponibilité

La disponibilité est **selon les conditions de service de la passerelle**.
Aucune affirmation géographique n'est faite ; consultez les conditions pour
votre région avant d'acheminer du trafic de production.

## Règlement

- **USDT** (TRC-20) par défaut — sans carte, sans KYC.
- Autres cryptos (BTC, etc.) pour les comptes **en gros / importants**.

## FAQ

**Est-ce seulement un proxy OpenAI ?**
Non. Il expose des endpoints natifs Anthropic et Gemini, donc vous pouvez
continuer à utiliser le SDK officiel de chaque fournisseur. Il fait aussi shim
pour Replicate / Fal / Suno.

**Dois-je réécrire mon code ?**
Non. Si votre client parle l'API OpenAI / Anthropic / Gemini, vous ne changez que
la base URL (ou la variable d'environnement fournisseur). Rien de plus.

**Comment vérifier avant de payer ?**
Inscription → crédits de test → exécutez vos charges sur l'endpoint.

🔗 Documentation complète en anglais : [README.md](../README.md) · Exemples : [examples/](../examples/) · Modèles : [models.md](../models.md)
