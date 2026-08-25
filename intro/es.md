# Pasarela API compatible con OpenAI — Guía de integración

Un endpoint *drop-in*, compatible con la API de OpenAI. Cambia tu `base_url` y
conserva tu código actual. Unas pocas centenas de modelos detrás de una sola
interfaz — OpenAI, Claude, DeepSeek, imagen y *embeddings* — para que no tengas
que gestionar múltiples proveedores por ruta.

Esta guía está escrita para **operadores que ya ejecutan una app, pasarela o
front-end que habla la API de OpenAI** (SDK de Python/Node, Cline, Continue,
Cursor BYOK, LibreChat, OpenWebUI, SillyTavern, etc.).

## Por qué existe (enfoque neutro)

La mayoría de las apps de IA se construyen sobre una infraestructura de
facturación con tarjeta / fiat. Esa infraestructura no sirve a todos los
segmentos: algunos usuarios no tienen tarjeta, otros liquidan en cripto por
defecto, y algunas regiones no están cubiertas por los términos de servicio de
los proveedores principales.

Este endpoint es un **riel de liquidación agnóstico**: USDT (cripto) por
defecto, sin tarjeta, sin KYC. La misma interfaz compatible con OpenAI que ya
usas. Está pensado para convivir *junto a* tus métodos de pago actuales como una
ruta adicional — no para reemplazarlos.

## Inicio rápido

```python
OPENAI_BASE_URL = "https://api.airai.cc/v1"
OPENAI_API_KEY  = "<tu-clave>"   # obténla al registrarte o por TG @mmrcle
```

- Python: ver [`examples/python.md`](../examples/python.md)
- Node: ver [`examples/node.md`](../examples/node.md)
- curl: ver [`examples/curl.md`](../examples/curl.md)
- Nota Claude Code / protocolo Anthropic: ver [`examples/claude-code.md`](../examples/claude-code.md)
- LibreChat / OpenWebUI / SillyTavern: ver [`examples/frontends.md`](../examples/frontends.md)

## Obtén una clave de prueba

1. **Regístrate en la pasarela** → se emiten créditos de prueba al registrarse,
   sin tarjeta. Úsalos para validar latencia, cobertura de modelos y calidad.
2. **Escríbenos por TG:** `@mmrcle` — para proveedor *white-label* / suministro
   mayorista, claves de prueba o dudas de integración.

## Modelos

Unas pocas centenas de modelos en varias familias, incluyendo:

- **OpenAI:** GPT-4o / 4o-mini, razonamiento o-series, embeddings
- **Claude:** Opus / Sonnet / Haiku (vía ruta compatible con OpenAI)
- **DeepSeek:** V3 / R1 y variantes destiladas
- **Imagen:** SD, Flux y APIs de imagen occidentales comunes
- **Embedding / rerank** donde esté disponible

La lista en vivo se obtiene con `/v1/models` contra el endpoint.

## Precios

Tramos transparentes respecto al precio de lista oficial, en el rango
**~0.03–0.3 del precio de lista oficial** según tramo y familia. Sin cuota
mensual. Pago por uso. Liquidación en USDT.

- **Standard** (~0.3): uso general, imagen, embeddings
- **Pro** (~0.15): cargas pesadas de Claude / codificación
- **Wholesale** (~0.09): operadores de alto volumen, *upstream* white-label

## Región y disponibilidad

La disponibilidad es **según los términos de servicio de la pasarela**. No se
hace ninguna afirmación geográfica; consulta los términos para tu región antes
de enrutar tráfico de producción.

## Liquidación

- **USDT** (TRC-20) por defecto — sin tarjeta, sin KYC.
- Otras criptos se consideran para cuentas mayoristas / grandes.

## Preguntas frecuentes

**¿Es esto un reemplazo de mi proveedor actual?**
No. Es una ruta OpenAI-compatible adicional que puedes llamar para los segmentos
que tu stack actual no sirve (usuarios sin tarjeta, liquidación cripto-nativa,
regiones fuera de los términos de tu proveedor).

**¿Necesito reescribir mi código?**
Si tu cliente habla la API de OpenAI, solo cambias `base_url` y `api_key`.

**¿Cómo lo verifico antes de pagar?**
Regístrate → créditos de prueba → ejecuta tus cargas contra el endpoint.

*Guía de integración técnica. Operado de forma independiente; este documento
describe el endpoint y cómo conectarse, no es una propuesta de venta.*

🔗 Documentación completa en inglés: [README.md](../README.md) · Ejemplos: [examples/](../examples/)
