# Lab 02 — Guardas, acciones y choice

⏱ Duración estimada: ~60 min

## Objetivo

Completar las etiquetas de las transiciones de un pedido con guardas y acciones en el orden UML, añadir un evento de tiempo y separar el envío con un pseudoestado choice.

## Contexto

- Sintaxis y reglas: [Estados y transiciones](../../1-teoria/01-estados-y-transiciones.md), etiqueta `evento [guarda] / acción` y choice.
- `starter/pedido.puml` renderiza, con los estados del pedido, pero sus etiquetas no dicen cuándo se puede cruzar ni qué se hace al cruzar, y una está en el orden equivocado.
- Especificación: un carrito solo se confirma si tiene artículos, y al confirmarlo se reserva el stock. Se paga el importe exacto del total y se emite la factura. Un pedido sin pagar se cancela a mano o a las 48 horas, y en los dos casos se libera el stock. Al enviar, si la dirección es válida se imprime la etiqueta; si no, el pedido queda retenido, se avisa al cliente y vuelve a estar pagado cuando corrige la dirección.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-07-maquinas_de_estados/2-practicas/lab-02-guardas-acciones-y-choice
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/pedido.puml; echo $?
   plantuml -syntax < starter/pedido.puml
   ```

   Output:

   ```
   0
   STATE
   (7 entities)
   ```

   Abre `starter/pedido.svg`. Cinco estados más el inicial y el final.

2. **TODO 1 — Guarda.** Confirmar un carrito vacío no tiene sentido. La guarda va entre el evento y la acción:

   ```plantuml
   Draft --> Placed : checkout() [cart is not empty] / reserveStock()
   ```

   Si la guarda es falsa cuando llega `checkout()`, el evento se descarta: el pedido sigue en `Draft` y no se reserva nada. Renderiza y comprueba que la etiqueta sale en una sola línea.

3. **TODO 2 — Orden de la etiqueta.** Busca las etiquetas con la guarda antes del evento:

   ```bash
   grep -nE -- '-->[^:]*:[[:space:]]*[[][^]]*[]][[:space:]]*[a-zA-Z]' starter/pedido.puml
   ```

   Output:

   ```
   11:Placed --> Paid : [amount = total] pay(amount)
   ```

   PlantUML lo dibuja sin protestar: para él es texto. Para UML no: el lector espera primero lo que dispara la transición. Reescríbela en orden y con la acción de la especificación:

   ```plantuml
   Placed --> Paid : pay(amount) [amount = total] / issueInvoice()
   ```

   Repite el `grep`: no imprime nada.

4. **TODO 3 — Cancelación y evento de tiempo.** Añade la acción a `cancel()` y una segunda transición con un evento de tiempo:

   ```plantuml
   Placed --> Cancelled : cancel() / releaseStock()
   Placed --> Cancelled : after(48 h) / releaseStock()
   ```

   `after(48 h)` cuenta desde que el pedido entró en `Placed`: nadie llama a una operación, el evento llega solo. Renderiza: dos flechas de `Placed` a `Cancelled`.

5. **TODO 4 — Choice.** El envío lleva a dos estados según la dirección. Declara el pseudoestado y sustituye `Paid --> Shipped : ship()` por:

   ```plantuml
   state shipping <<choice>>
   Paid --> shipping : ship()
   shipping --> Shipped : [address is valid] / printLabel()
   shipping --> OnHold : [else] / contactCustomer()
   OnHold --> Paid : addressFixed
   ```

   Las salidas de un choice no llevan evento, solo guarda: el evento ya llegó (`ship()`). `[else]` garantiza que siempre hay un camino. `addressFixed` es un evento de señal: sin paréntesis, porque no es una operación de `Order` sino un aviso que llega desde fuera. Borra los comentarios de los TODO y renderiza: un rombo después de `Paid`.

6. Comprueba:

   ```bash
   plantuml -checkonly starter/pedido.puml; echo $?
   plantuml -syntax < starter/pedido.puml
   grep -cE -- '-->[^:]*:[^[/]*[[][^]]+[]]' starter/pedido.puml
   grep -cE -- '-->[^:]*:[^/]*/[[:space:]]*[a-zA-Z]' starter/pedido.puml
   grep -nE -- '-->[^:]*:[[:space:]]*[[][^]]*[]][[:space:]]*[a-zA-Z]' starter/pedido.puml; echo $?
   ```

   Output:

   ```
   0
   STATE
   (9 entities)
   4
   6
   1
   ```

   4 guardas, 6 acciones y ninguna etiqueta con la guarda delante del evento (`grep` no encuentra nada y sale con `1`). Las 9 entidades incluyen `OnHold` y el choice.

7. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Qué diferencia hay entre `Draft --> Placed : checkout() [cart is not empty]` y un choice después de `checkout()` con salidas `[cart is not empty]` y `[else]`?
   - Si quitas `[else]` y la dirección no es válida, ¿en qué estado queda el pedido?
   - `releaseStock()` aparece en dos transiciones que salen de `Placed`. ¿Bastaría con un `exit / releaseStock()` en `Placed`? ¿Qué saldría mal con `pay(amount)`?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` da `(9 entities)`
- [ ] Todas las etiquetas siguen el orden `evento [guarda] / acción`
- [ ] Un evento de tiempo `after(48 h)` hacia `Cancelled`
- [ ] Un choice con una salida `[else]`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Un pedido pagado también se puede cancelar mientras no se envíe, pero entonces hay que devolver el dinero. Añade la transición con su acción. ¿Necesitas una guarda, o el estado de origen ya lo garantiza?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 01 — Estados y transiciones](../lab-01-estados-y-transiciones/README.md) | [Lab 03 — Actividades internas](../lab-03-actividades-internas/README.md) → |

[↑ Semana 07](../../README.md)
