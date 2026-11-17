# Lab 04 — Leer diagramas

⏱ Duración estimada: ~60 min

## Objetivo

Leer tres diagramas UML de distinto tipo y extraer de ellos hechos concretos del sistema.

## Contexto

- Antes de escribir UML hay que saber leerlo: la mayor parte del tiempo lees diagramas de otros.
- En `starter/` hay tres diagramas completos de una tienda: clases, secuencia y estados. No los modificas.
- Todavía no conoces toda la notación: este lab te enseña a deducirla del contexto. Las semanas siguientes la formalizan.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-01-fundamentos_uml_y_plantuml/2-practicas/lab-04-leer-diagramas
   ```

1. Renderiza los tres a la vez:

   ```bash
   plantuml -tsvg starter/*.puml; echo $?
   ls starter
   ```

   Output:

   ```
   0
   clases-tienda.puml  clases-tienda.svg  estados-pedido.puml  estados-pedido.svg  secuencia-login.puml  secuencia-login.svg
   ```

2. Pregunta a PlantUML qué es cada uno:

   ```bash
   for f in starter/*.puml; do echo "$f"; plantuml -syntax < "$f"; done
   ```

   Output:

   ```
   starter/clases-tienda.puml
   CLASS
   (4 entities)
   starter/estados-pedido.puml
   STATE
   (8 entities)
   starter/secuencia-login.puml
   SEQUENCE
   (4 participants)
   ```

3. Crea en la carpeta del lab un archivo `respuestas.md` y responde, mirando **solo los SVG** en el navegador (no el `.puml`):

   **Clases** (`clases-tienda.svg`):
   1. ¿Cuántos pedidos puede tener un cliente? ¿Y un pedido sin cliente es posible?
   2. ¿Puede existir un pedido sin líneas?
   3. El rombo negro entre `Order` y `OrderLine`: si se borra un pedido, ¿qué crees que pasa con sus líneas?
   4. ¿Desde `OrderLine` se puede llegar a `Product`? ¿Y desde `Product` a sus líneas? Fíjate en la punta de flecha.
   5. ¿Qué significa el `-` delante de `email` y el `+` delante de `placeOrder()`?

   **Secuencia** (`secuencia-login.svg`):
   6. ¿Quién habla con la base de datos `Users`? ¿El cliente lo hace alguna vez?
   7. ¿Qué diferencia hay entre una flecha continua y una discontinua?
   8. ¿Qué pasa si la contraseña no coincide? ¿Qué bloque del diagrama lo dice?

   **Estados** (`estados-pedido.svg`):
   9. ¿Se puede cancelar un pedido ya enviado (`Shipped`)?
   10. ¿Qué ocurre además del cambio de estado cuando se cancela un pedido pagado? Mira el texto después de `/`.

4. Comprueba tus respuestas 3, 4 y 10 en el `.puml`: localiza la línea que produce cada elemento (`*--`, `-->`, `/ refund()`). Anota en `respuestas.md` qué símbolo de PlantUML produce cada uno.

## Criterios de éxito

- [ ] `plantuml -tsvg starter/*.puml` sale con `0` y genera tres SVG
- [ ] `respuestas.md` responde las 10 preguntas con hechos del diagrama, no con suposiciones
- [ ] Identificaste en el `.puml` los símbolos `*--`, `-->` y `/ acción`

## Reto extra

Añade a `respuestas.md` dos preguntas que **no** se pueden responder con estos diagramas (por ejemplo, cuánto tarda un envío) y di qué diagrama haría falta para responderlas.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 03 — Elegir el diagrama](../lab-03-elegir-el-diagrama/README.md) | [Lab 05 — Modelo conceptual](../lab-05-modelo-conceptual/README.md) → |

[↑ Semana 01](../../README.md)
