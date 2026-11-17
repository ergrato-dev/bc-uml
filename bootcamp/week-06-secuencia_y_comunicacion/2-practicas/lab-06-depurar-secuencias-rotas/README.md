# Lab 06 — Depurar secuencias rotas

⏱ Duración estimada: ~60 min

## Objetivo

Reparar un diagrama de secuencia con 3 errores de sintaxis y 4 errores de modelado, usando los mensajes de PlantUML para los primeros y el SVG y `grep` para los segundos.

## Contexto

- Repasa los "Errores frecuentes" de [Lifelines y mensajes](../../1-teoria/01-lifelines-y-mensajes.md) y de [Fragmentos combinados](../../1-teoria/02-fragmentos.md).
- `starter/devolucion.puml` **no renderiza**: está roto a propósito.
- Escenario: un cliente pide devolver un producto. Si la compra tiene menos de 30 días, el pedido marca el producto como devuelto, se crea el reembolso, la pasarela de pago lo ejecuta y el cliente ve el resultado. Si no, se rechaza.
- PlantUML se detiene en el **primer** error de sintaxis. Arregla uno, vuelve a comprobar y pasa al siguiente.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-06-secuencia_y_comunicacion/2-practicas/lab-06-depurar-secuencias-rotas
   ```

### Errores de sintaxis

1. Comprueba el diagrama:

   ```bash
   plantuml -checkonly starter/devolucion.puml; echo $?
   plantuml -syntax < starter/devolucion.puml
   ```

   Output:

   ```
   Some diagram description contains errors
   200
   ERROR
   9
   Syntax Error? (Assumed diagram type: sequence)
   ```

   `-syntax` cuenta las líneas desde 0: el error está en la línea **10** del archivo. Ábrela: a `":PaymentGateway` le falta la comilla de cierre. Arréglala:

   ```plantuml
   boundary ":PaymentGateway" as pay
   ```

2. Vuelve a comprobar con los mismos dos comandos. Output:

   ```
   Some diagram description contains errors
   200
   ERROR
   15
   Syntax Error? (Assumed diagram type: sequence)
   ```

   Línea 16: `svc => order : purchasedAt()`. `=>` no es una flecha de PlantUML. Es una llamada que espera la fecha: síncrona, `->`.

3. Vuelve a comprobar. Output:

   ```
   Some diagram description contains errors
   200
   ERROR
   26
   Cannot create group (Assumed diagram type: sequence)
   ```

   Línea 27: un `end` que no cierra nada. El `alt` ya se cerró en la línea 26. `Cannot create group` aparece cuando un `end` o un `else` no tienen fragmento abierto. Borra la línea 27.

4. Vuelve a comprobar y renderiza:

   ```bash
   plantuml -checkonly starter/devolucion.puml; echo $?
   plantuml -syntax < starter/devolucion.puml
   plantuml -tsvg starter/devolucion.puml
   ```

   Output:

   ```
   0
   SEQUENCE
   (7 participants)
   ```

   Renderiza. Pero hay 6 lifelines declaradas y PlantUML cuenta 7. Los errores que quedan no los detecta PlantUML.

### Errores de modelado

5. **Guarda entre corchetes.** Busca:

   ```bash
   grep -nE '^[[:space:]]*((alt|opt|loop|break)[[:space:]]*$|(alt|else|opt|loop|break)[[:space:]]*[[])' starter/devolucion.puml
   ```

   Output:

   ```
   18:alt [within 30 days]
   ```

   En el SVG, `within 30 days` sale subrayado en azul: PlantUML lo tomó por un enlace. Escribe `alt within 30 days`.

6. **La lifeline de más.** Abre `starter/devolucion.svg` y busca la séptima caja: `oder`, sin dos puntos ni estereotipo. La línea 19 manda `markReturned(itemId)` a `oder`, no a `order`. Corrígelo y comprueba:

   ```bash
   plantuml -syntax < starter/devolucion.puml
   ```

   Output:

   ```
   SEQUENCE
   (6 participants)
   ```

7. **Una creación que no lo es.** Busca mensajes síncronos que no llaman a una operación (nombre en mayúscula o sin paréntesis):

   ```bash
   grep -nE '^[[:space:]]*[A-Za-z0-9_]+[[:space:]]*->[[:space:]]*[A-Za-z0-9_]+[[:space:]]*:[[:space:]]*([A-Z]|[a-z]+[[:space:]]*$)' starter/devolucion.puml
   ```

   Output:

   ```
   20:  svc -> refund : Refund(order, itemId)
   22:  pay -> svc : approved
   ```

   La línea 20 llama al constructor de `Refund`, pero el reembolso está dibujado desde arriba, como si existiera antes de la devolución. Sustitúyela por una creación:

   ```plantuml
   create refund
   svc -->> refund : <<create>> Refund(order, itemId)
   ```

8. **Una respuesta con flecha de llamada.** La línea 22 del paso anterior (ahora la 23) es `pay -> svc : approved`: `approved` es el valor que devuelve `refund(amount)`, no una operación de `ReturnService`. Escríbela como respuesta:

   ```plantuml
   pay --> svc : approved
   ```

9. Comprueba:

   ```bash
   plantuml -checkonly starter/devolucion.puml; echo $?
   plantuml -syntax < starter/devolucion.puml
   grep -nE '^[[:space:]]*((alt|opt|loop|break)[[:space:]]*$|(alt|else|opt|loop|break)[[:space:]]*[[])' starter/devolucion.puml; echo $?
   grep -nE '^[[:space:]]*[A-Za-z0-9_]+[[:space:]]*->[[:space:]]*[A-Za-z0-9_]+[[:space:]]*:[[:space:]]*([A-Z]|[a-z]+[[:space:]]*$)' starter/devolucion.puml; echo $?
   ```

   Output:

   ```
   0
   SEQUENCE
   (6 participants)
   1
   1
   ```

   Renderiza, 6 lifelines, y los dos `grep` no encuentran nada (salen con `1`). Abre el SVG: `:Refund` aparece a la altura de su `«create»`.

10. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
    - ¿Por qué PlantUML no avisa del error de `oder`? ¿Cómo lo detectas en tu proyecto?
    - De los 7 errores, ¿cuáles habría pasado por alto `-checkonly`?
    - El diagrama dice `markReturned(itemId)` a `:Order`. ¿Qué operación tiene que existir en el diagrama de clases?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0`
- [ ] `-syntax` cuenta `(6 participants)`
- [ ] Ninguna guarda entre corchetes y ningún mensaje síncrono sin operación
- [ ] `:Refund` se crea con `create` y `-->>`; `approved` es una respuesta `-->`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Añade a `devolucion.puml` un error de cada tipo para un compañero: uno que dé `Cannot create group` y uno de modelado que PlantUML no detecte. Intercambia el archivo con tu compañero y arregla el suyo.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 05 — Diagrama de comunicación](../lab-05-diagrama-de-comunicacion/README.md) | [Proyecto — Secuencia y comunicación de un caso de uso](../../3-proyecto/README.md) → |

[↑ Semana 06](../../README.md)
