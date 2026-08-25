# Gateway de API Compatível com OpenAI — Guia de Integração

> ## 🔥 Corte sua conta de API em até **80%** · 🧩 **468+ modelos atrás de UM endpoint** · 💸 USDT, sem cartão, sem KYC
>
> Um endpoint *drop-in*, compatível com a API da OpenAI. Troque seu `base_url` e
> mantenha o código. **GPT · Claude · DeepSeek · imagem · embedding** atrás de
> uma só interface.

**Resumo — por que equipes apontam para cá**

- 💰 **Até 80% mais barato** que o preço de lista oficial (até 90% em tier de alto volume)
- 🧩 **468+ modelos, um endpoint** — pare de conectar um provedor diferente por rota
- ⚡ **Compatibilidade OpenAI drop-in** — só troca `base_url`, zero reescrita
- 🌍 **USDT (TRC-20)** por padrão, **sem KYC, sem mensalidade**, pagamento por uso

Um endpoint *drop-in*, compatível com a API da OpenAI. Troque seu `base_url` e
mantenha seu código atual. Algumas centenas de modelos atrás de uma única
interface — OpenAI, Claude, DeepSeek, imagem e *embeddings* — para você não
gerenciar múltiplos provedores por rota.

Este guia é para **operadores que já rodam um app, gateway ou front-end que fala
a API da OpenAI** (SDK Python/Node, Cline, Continue, Cursor BYOK, LibreChat,
OpenWebUI, SillyTavern, etc.).

## Por que existe (enquadramento neutro)

A maioria dos apps de IA é construída sobre uma infraestrutura de cobrança com
cartão / fiat. Essa infraestrutura não atende todos os segmentos: alguns
usuários não têm cartão, outros liquidam em cripto por padrão, e algumas regiões
não são cobertas pelos termos de serviço dos provedores principais.

Este endpoint é um **trilho de liquidação agnóstico**: USDT (cripto) por padrão,
sem cartão, sem KYC. A mesma interface compatível com OpenAI que você já usa.
Foi feito para coexistir *junto* aos seus métodos de pagamento atuais como uma
rota adicional — não para substituí-los.

## Início rápido

```python
OPENAI_BASE_URL = "https://api.airai.cc/v1"
OPENAI_API_KEY  = "<sua-chave>"   # obtenha ao se registrar ou via TG @mmrcle
```

- Python: ver [`examples/python.md`](../examples/python.md)
- Node: ver [`examples/node.md`](../examples/node.md)
- curl: ver [`examples/curl.md`](../examples/curl.md)
- Nota Claude Code / protocolo Anthropic: ver [`examples/claude-code.md`](../examples/claude-code.md)
- LibreChat / OpenWebUI / SillyTavern: ver [`examples/frontends.md`](../examples/frontends.md)

## Obtenha uma chave de teste

1. **Registre-se no gateway** → créditos de teste são emitidos no cadastro, sem
   cartão. Use-os para validar latência, cobertura de modelos e qualidade.
2. **Fale conosco no TG:** `@mmrcle` — para fornecimento *white-label* / atacado,
   chaves de teste ou dúvidas de integração.

## Modelos

Algumas centenas de modelos em várias famílias, incluindo:

- **OpenAI:** GPT-4o / 4o-mini, raciocínio o-series, embeddings
- **Claude:** Opus / Sonnet / Haiku (via rota compatível com OpenAI)
- **DeepSeek:** V3 / R1 e variantes destiladas
- **Imagem:** SD, Flux e APIs de imagem ocidentais comuns
- **Embedding / rerank** onde disponível

A lista ao vivo vem de `/v1/models`.

## Preços

Faixas transparentes em relação ao preço de lista oficial, na faixa **~0,03–0,3
do preço de lista oficial** conforme faixa e família. Sem mensalidade. Pagamento
por uso. Liquidação em USDT.

- **Standard** (~0,3): uso geral, imagem, embeddings
- **Pro** (~0,15): cargas pesadas de Claude / codificação
- **Wholesale** (~0,09): operadores de alto volume, *upstream* white-label

## Região e disponibilidade

A disponibilidade é **conforme os termos de serviço do gateway**. Nenhuma
afirmação geográfica é feita; consulte os termos para sua região antes de
rotear tráfego de produção.

## Liquidação

- **USDT** (TRC-20) por padrão — sem cartão, sem KYC.
- Outras criptos são consideradas para contas atacado / grandes.

## Perguntas frequentes

**É um substituto do meu provedor atual?**
Não. É uma rota adicional compatível com OpenAI que você pode chamar para os
segmentos que seu stack atual não atende (usuários sem cartão, liquidação
cripto-nativa, regiões fora dos termos do seu provedor).

**Preciso reescrever meu código?**
Se seu cliente fala a API da OpenAI, você só muda `base_url` e `api_key`.

**Como verifico antes de pagar?**
Registre-se → créditos de teste → rode suas cargas contra o endpoint.

*Guia de integração técnica. Operado de forma independente; este documento
descreve o endpoint e como conectar, não é uma proposta de venda.*

🔗 Documentação completa em inglês: [README.md](../README.md) · Exemplos: [examples/](../examples/)
