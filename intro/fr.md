# Passerelle API compatible OpenAI — Guide d'intégration

Un endpoint *drop-in*, compatible avec l'API OpenAI. Changez votre `base_url` et
conservez votre code actuel. Quelques centaines de modèles derrière une seule
interface — OpenAI, Claude, DeepSeek, image et *embeddings* — pour ne pas gérer
plusieurs fournisseurs par route.

Ce guide s'adresse aux **opérateurs qui exécutent déjà une app, une passerelle
ou un front-end parlant l'API OpenAI** (SDK Python/Node, Cline, Continue,
Cursor BYOK, LibreChat, OpenWebUI, SillyTavern, etc.).

## Pourquoi cela existe (cadre neutre)

La plupart des applications IA sont construites sur une infrastructure de
facturation par carte / fiat. Cette infrastructure ne sert pas tous les
segments : certains utilisateurs n'ont pas de carte, d'autres règlent en
crypto par défaut, et certaines régions ne sont pas couvertes par les conditions
de service des fournisseurs principaux.

Cet endpoint est un **rail de règlement agnostique** : USDT (crypto) par défaut,
sans carte, sans KYC. La même interface compatible OpenAI que vous utilisez déjà.
Il est conçu pour coexister *aux côtés* de vos méthodes de paiement actuelles
comme une route supplémentaire — pas pour les remplacer.

## Démarrage rapide

```python
OPENAI_BASE_URL = "https://api.airai.cc/v1"
OPENAI_API_KEY  = "<votre-clé>"   # obtenue à l'inscription ou via TG @mmrcle
```

- Python : voir [`examples/python.md`](../examples/python.md)
- Node : voir [`examples/node.md`](../examples/node.md)
- curl : voir [`examples/curl.md`](../examples/curl.md)
- Note Claude Code / protocole Anthropic : voir [`examples/claude-code.md`](../examples/claude-code.md)
- LibreChat / OpenWebUI / SillyTavern : voir [`examples/frontends.md`](../examples/frontends.md)

## Obtenir une clé de test

1. **Inscrivez-vous sur la passerelle** → des crédits de test sont attribués à
   l'inscription, sans carte. Utilisez-les pour valider la latence, la couverture
   des modèles et la qualité.
2. **Contactez-nous sur TG :** `@mmrcle` — pour l'approvisionnement *white-label*
   / en gros, les clés de test ou les questions d'intégration.

## Modèles

Quelques centaines de modèles dans plusieurs familles, notamment :

- **OpenAI :** GPT-4o / 4o-mini, raisonnement o-series, embeddings
- **Claude :** Opus / Sonnet / Haiku (via la route compatible OpenAI)
- **DeepSeek :** V3 / R1 et variantes distillées
- **Image :** SD, Flux et API d'image occidentales courantes
- **Embedding / rerank** lorsque disponible

La liste live provient de `/v1/models`.

## Tarifs

Des paliers transparents par rapport au tarif public officiel, dans la fourchette
**~0,03–0,3 du tarif public officiel** selon le palier et la famille. Sans
abonnement mensuel. Paiement à l'usage. Règlement en USDT.

- **Standard** (~0,3) : usage général, image, embeddings
- **Pro** (~0,15) : charges lourdes Claude / codage
- **Wholesale** (~0,09) : opérateurs à fort volume, upstream white-label

## Région et disponibilité

La disponibilité est **selon les conditions de service de la passerelle**.
Aucune affirmation géographique n'est faite ; consultez les conditions pour
votre région avant d'acheminer du trafic de production.

## Règlement

- **USDT** (TRC-20) par défaut — sans carte, sans KYC.
- D'autres cryptos envisagées pour les comptes en gros / importants.

## FAQ

**Est-ce un remplacement de mon fournisseur actuel ?**
Non. C'est une route supplémentaire compatible OpenAI que vous pouvez appeler
pour les segments que votre stack actuel ne sert pas (utilisateurs sans carte,
règlement crypto-native, régions hors conditions de votre fournisseur).

**Dois-je réécrire mon code ?**
Si votre client parle l'API OpenAI, seuls `base_url` et `api_key` changent.

**Comment vérifier avant de payer ?**
Inscription → crédits de test → exécutez vos charges sur l'endpoint.

*Guide d'intégration technique. Exploité indépendamment ; ce document décrit
l'endpoint et comment s'y connecter, ce n'est pas un pitch commercial.*

🔗 Documentation complète en anglais : [README.md](../README.md) ·
Exemples : [examples/](../examples/)
