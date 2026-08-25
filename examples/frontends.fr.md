# Clients et outils — guides pas à pas

Cette page est un guide de configuration étape par étape pour **15 clients et
outils de développement** qui fonctionnent avec la passerelle. Chaque guide a
été écrit contre l'interface réelle de la passerelle. Choisissez votre outil,
suivez les étapes et vous êtes opérationnel en moins de deux minutes.

> **La règle qui couvre tout**
> Pointez l'**URL de base compatible OpenAI** de l'outil vers
> `https://api.airai.cc/v1`, OU définissez sa **variable d'environnement du
> fournisseur** sur la racine native pour Claude / Gemini :
> - Claude : `ANTHROPIC_BASE_URL=https://api.airai.cc`
> - Gemini : `GOOGLE_GEMINI_BASE_URL=https://api.airai.cc`
>
> Même interface compatible OpenAI, même clé, les 468+ modèles derrière.

---

## Index rapide

| # | Client / outil | Idéal pour | Protocole |
|---|---|---|---|
| 1 | [ChatBox](#1-chatbox) | Chat bureau / mobile | OpenAI |
| 2 | [CherryStudio](#2-cherrystudio) | Multi-fournisseur + MCP | OpenAI + Claude MCP |
| 3 | [Cursor](#3-cursor) | Éditeur de code IA (BYOK) | OpenAI |
| 4 | [Cline](#4-cline-vs-code) | Agent de code dans VS Code | OpenAI |
| 5 | [Codex](#5-codex) | Agent de code dans le terminal | OpenAI |
| 6 | [aider](#6-aider) | Programmation en binôme (CLI) | OpenAI |
| 7 | [Gemini CLI](#7-gemini-cli) | CLI native Google Gemini | Gemini natif |
| 8 | [Claude Code](#8-claude-code) | CLI native Anthropic | Anthropic natif |
| 9 | [LobeChat](#9-lobechat) | UI de chat auto-hébergée | OpenAI |
| 10 | [Dify](#10-dify) | LLMOps / constructeur d'agents | OpenAI |
| 11 | [N8N](#11-n8n) | Automatisation de flux | OpenAI |
| 12 | [NextChat](#12-nextchat) | Chat web léger | OpenAI |
| 13 | [Immersive Translate](#13-immersive-translate) | Traduction dans le navigateur | OpenAI |
| 14 | [LangChain](#14-langchain) | Framework d'agents | OpenAI / Anthropic / Gemini |
| 15 | [LlamaIndex](#15-llamaindex) | Framework RAG / données | OpenAI |

**Besoin d'une clé d'abord ?** Obtenez une clé de test gratuite — voir la
section *Get a test key* dans le [README principal](../README.md).

---

## 1. ChatBox

Client de chat multiplateforme (macOS / Windows / Linux) et mobile.

**Bureau**
1. Ouvrez ChatBox → **Settings** (engrenage).
2. **Model Provider** → **Add custom provider**.
3. Remplissez : API Host `https://api.airai.cc/v1`, API Key votre clé, Model `gpt-4o`.
4. Enregistrez, démarrez une nouvelle conversation.

**Mobile (iOS / Android)** : même chemin.

**Vérifier** : envoyez "bonjour" — une réponse confirme le fonctionnement.

---

## 2. CherryStudio

Client de bureau multi-fournisseur populaire, avec support MCP intégré.

**Fournisseur OpenAI**
1. Settings → **Model Provider** → **OpenAI**.
2. Activez et définissez API Address `https://api.airai.cc/v1` + API Key.
3. **Manage / Add model** et ajoutez ce dont vous avez besoin.
4. Les modèles de raisonnement `o4-mini` / `o3` sont sélectionnables.

**Serveur MCP Claude (optionnel)** : Settings → **MCP Servers** → **Add** →
serveur SSE/HTTP pointant vers le endpoint MCP de la passerelle.

---

## 3. Cursor

Éditeur de code IA. Utilise **BYOK**.

1. **Settings** (⌘/Ctrl + ,) → recherchez **Models**.
2. Activez **Bring Your Own Key** (BYOK).
3. Définissez l'URL de base `https://api.airai.cc/v1` et collez votre clé.
4. Dans le sélecteur de modèle, tapez `gpt-4o`, `claude-3.5-sonnet`, etc.

**Astuce du préfixe `new-`** : ajoutez `new-` à un modèle (ex. `new-gpt-4o`).

---

## 4. Cline (VS Code)

Agent de code autonome en extension VS Code.

1. Installez **Cline**, ouvrez son panneau.
2. **Settings** → **API Provider** → **OpenAI-compatible**.
3. Base URL `https://api.airai.cc/v1`, API Key, Model ID `claude-3.5-sonnet` / `gpt-4o` / `deepseek-chat`.

---

## 5. Codex

Agent de code terminal d'OpenAI (macOS / Linux / Windows-WSL).

Créez `~/.codex/config.toml` :
```toml
[model]
base_url = "https://api.airai.cc/v1"
api_key  = "YOUR_KEY"
model    = "gpt-4o"
```
**Alternative — variables d'environnement** : `export OPENAI_BASE_URL="https://api.airai.cc/v1"` + `export OPENAI_API_KEY="YOUR_KEY"`.

---

## 6. aider

Programmation en binôme dans le terminal.
```bash
aider --openai-api-base https://api.airai.cc/v1 --openai-api-key YOUR_KEY --model gpt-4o
```
**Persistant — `.aider.conf.yml`** : `openai-api-base: https://api.airai.cc/v1` / `openai-api-key: YOUR_KEY` / `model: gpt-4o`.

---

## 7. Gemini CLI

CLI officielle Gemini sur la **racine native Gemini**. Voir [`gemini-cli.md`](gemini-cli.md).
```bash
export GOOGLE_GEMINI_BASE_URL="https://api.airai.cc"
export GEMINI_API_KEY="YOUR_KEY"
gemini
```

---

## 8. Claude Code

Agent Claude officiel d'Anthropic sur la **racine native Anthropic**. Voir [`claude-code.md`](claude-code.md).
```bash
export ANTHROPIC_BASE_URL="https://api.airai.cc"
export ANTHROPIC_API_KEY="YOUR_KEY"
claude
```

---

## 9. LobeChat

UI de chat open-source, idéale pour l'auto-hébergement.

**Dans l'app** : Settings → **AI Provider** → **OpenAI** → Base URL `https://api.airai.cc/v1` + clé.

**Auto-hébergé (Docker / env)** :
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_PROXY_URL="https://api.airai.cc/v1"
```

---

## 10. Dify

Plateforme LLMOps open-source pour construire des agents et du RAG.

1. **Settings** → **Model Provider**.
2. Ajoutez **OpenAI** (ou "OpenAI-API-compatible").
3. API Key votre clé, API Base `https://api.airai.cc/v1`.
4. Utilisez dans Apps / Workflows / Agents.

---

## 11. N8N

Automatisation avec un nœud OpenAI.

**Option A — nœud OpenAI** : créez des identifiants **OpenAI API** avec Base URL `https://api.airai.cc/v1`.

**Option B — nœud HTTP Request** :
```json
{ "method": "POST", "url": "https://api.airai.cc/v1/chat/completions",
  "headers": {"Authorization": "Bearer YOUR_KEY", "Content-Type": "application/json"},
  "body": {"model": "gpt-4o", "messages": [{"role": "user", "content": "Hello"}]} }
```

---

## 12. NextChat

UI de chat web légère (anciennement ChatGPT-Next-Web).
```bash
OPENAI_API_KEY="YOUR_KEY"
OPENAI_BASE_URL="https://api.airai.cc/v1"
```
Docker :
```bash
docker run -d -e OPENAI_API_KEY="YOUR_KEY" -e OPENAI_BASE_URL="https://api.airai.cc/v1" -p 3000:3000 yidadaa/chatgpt-next-web
```

---

## 13. Immersive Translate

Extension de navigateur qui traduit les pages avec un LLM.

1. Paramètres → **Translation Service** → **OpenAI / Custom**.
2. API URL `https://api.airai.cc/v1`, API Key votre clé, Model `gpt-4o-mini`.

**Astuce** : utilisez `gpt-4o-mini` — la traduction est à fort volume et faible
complexité.

---

## 14. LangChain

Framework d'agents / RAG (Python ; JS similaire).

**Dialecte OpenAI**
```python
from langchain_openai import ChatOpenAI
llm = ChatOpenAI(base_url="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
```
**Dialecte Anthropic (natif)**
```python
from langchain_anthropic import ChatAnthropic
llm = ChatAnthropic(base_url="https://api.airai.cc", api_key="YOUR_KEY", model="claude-3.5-sonnet")
```
**Dialecte Gemini (natif)**
```python
from langchain_google_genai import ChatGoogleGenerativeAI
llm = ChatGoogleGenerativeAI(base_url="https://api.airai.cc", google_api_key="YOUR_KEY", model="gemini-2.5-pro")
```

---

## 15. LlamaIndex

Framework de données pour RAG / agents (Python).
```python
from llama_index.llms.openai import OpenAI
llm = OpenAI(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="gpt-4o")
print(llm.complete("hello"))
```
**Embeddings pour RAG**
```python
from llama_index.embeddings.openai import OpenAIEmbedding
embed = OpenAIEmbedding(api_base="https://api.airai.cc/v1", api_key="YOUR_KEY", model="text-embedding-3-small")
```

---

## Règle générale pour le reste

Si un outil parle **OpenAI / Anthropic / Gemini**, il fonctionne ici :

| Parle… | Définissez ceci | À |
|---|---|---|
| OpenAI API | `base_url` / `OPENAI_BASE_URL` | `https://api.airai.cc/v1` |
| Anthropic (Claude) | `ANTHROPIC_BASE_URL` | `https://api.airai.cc` |
| Gemini | `GOOGLE_GEMINI_BASE_URL` | `https://api.airai.cc` |

Conservez votre clé, changez l'URL et tous les modèles deviennent disponibles.
Pour des exemples au niveau API (curl / Python / Node, images, audio,
embeddings, realtime, tâches async), voir les autres fichiers de
[`examples/`](../examples/).
