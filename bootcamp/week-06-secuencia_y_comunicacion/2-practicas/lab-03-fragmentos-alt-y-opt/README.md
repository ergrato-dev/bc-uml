# Lab 03 — Fragmentos alt y opt

⏱ Duración estimada: ~60 min

## Objetivo

Convertir una secuencia lineal de compra de entradas en una que muestre sus alternativas con fragmentos `alt` y `opt`, anidados y con guardas UML.

## Contexto

- Sintaxis y reglas: [Fragmentos combinados](../../1-teoria/02-fragmentos.md).
- `starter/entrada.puml` renderiza, pero dibuja todos los mensajes como si siempre pasaran: el descuento, el cobro, la entrada. Y una guarda está mal escrita.
- Especificación del caso de uso, en resumen: si el asiento está ocupado, la venta termina con "seat taken". Si el cliente trae tarjeta de socio, se aplica un descuento. Si el pago se rechaza, termina con "payment rejected". Al final, el cliente puede pedir el recibo impreso.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-06-secuencia_y_comunicacion/2-practicas/lab-03-fragmentos-alt-y-opt
   ```

1. Renderiza el starter y busca guardas mal escritas:

   ```bash
   plantuml -tsvg starter/entrada.puml; echo $?
   grep -nE '^[[:space:]]*((alt|opt|loop|break)[[:space:]]*$|(alt|else|opt|loop|break)[[:space:]]*[[])' starter/entrada.puml
   ```

   Output:

   ```
   0
   32:opt [customer wants receipt]
   ```

   El `grep` busca fragmentos sin guarda o con la guarda entre corchetes. Abre `starter/entrada.svg`: el fragmento `opt` del final muestra `customer wants receipt` subrayado en azul, como un enlace.

2. **TODO 4 primero — La guarda con corchetes.** PlantUML pone los corchetes solo. Cambia la línea 32 por:

   ```plantuml
   opt customer wants receipt
   ```

   Renderiza: ahora se lee `[customer wants receipt]` en negro, junto a la pestaña `opt`.

3. **TODO 1 — El asiento ocupado.** Todo lo que va desde `applyMemberDiscount` hasta `svc --> kiosk : ticket` solo pasa si el asiento está libre. Escribe `alt seat is free` justo antes de esa parte y, después de `svc --> kiosk : ticket`:

   ```plantuml
   else else
     svc --> kiosk : seat taken
   end
   ```

   El primer `else` es la palabra de PlantUML; el segundo, la guarda UML `[else]`. Indenta con dos espacios lo que queda dentro del fragmento: PlantUML no lo exige, pero sin indentar no se ve dónde cierra cada `end`. Renderiza: un marco `alt` con dos operandos separados por una línea discontinua.

4. **TODO 2 — El descuento opcional.** Envuelve solo `svc -> svc : applyMemberDiscount(memberCard)`:

   ```plantuml
   opt customer has member card
     svc -> svc : applyMemberDiscount(memberCard)
   end
   ```

   Es `opt` y no `alt`: no hay nada que hacer en el otro caso.

5. **TODO 3 — El pago, anidado.** Después de `pay --> svc : approved`, el resto depende del pago. Dentro del primer operando del `alt` del paso 3:

   ```plantuml
   alt payment approved
     svc -> seat : hold()
     create ticket
     svc -->> ticket : <<create>> Ticket(seat, price)
     svc --> kiosk : ticket
   else else
     svc --> kiosk : payment rejected
   end
   ```

   Borra los comentarios de los TODO. Renderiza y abre el SVG: el `alt` del pago queda dentro del operando `[seat is free]`, y el `opt` del descuento también.

6. **Un `end` que falta.** Borra temporalmente el `end` del `opt` del descuento y renderiza:

   ```bash
   plantuml -checkonly starter/entrada.puml; echo $?
   ```

   Output:

   ```
   0
   ```

   No hay error, pero mira el SVG: cada `end` cierra el fragmento abierto más reciente, así que todo se desplaza. El `opt` del descuento se traga el cobro, el `alt` del pago y el operando `[else]` del asiento; el `alt` del asiento queda abierto y abarca hasta el final del diagrama. Un `end` que falta no se detecta con `-checkonly`; se detecta mirando el SVG. Vuelve a escribirlo.

7. Comprueba:

   ```bash
   plantuml -checkonly starter/entrada.puml; echo $?
   grep -cE '^[[:space:]]*(alt|opt|loop|break|par)[[:space:]]' starter/entrada.puml
   grep -cE '^[[:space:]]*else[[:space:]]' starter/entrada.puml
   grep -cE '^[[:space:]]*end[[:space:]]*$' starter/entrada.puml
   grep -nE '^[[:space:]]*((alt|opt|loop|break)[[:space:]]*$|(alt|else|opt|loop|break)[[:space:]]*[[])' starter/entrada.puml; echo $?
   ```

   Output:

   ```
   0
   4
   2
   4
   1
   ```

   4 fragmentos (2 `alt` y 2 `opt`), 2 `else`, 4 `end` (uno por fragmento) y el último `grep` no encuentra guardas mal escritas: sale con `1`.

8. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué el descuento es `opt` y el asiento es `alt`?
   - ¿Qué pasaría si el `alt` del pago estuviera fuera del `alt` del asiento?
   - Las guardas de los dos operandos de un `alt` deben ser excluyentes. ¿Lo son `seat is free` y `else`? ¿Por qué `else` siempre lo es?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0`
- [ ] 2 `alt` (uno dentro del otro) con su `else else` y 2 `opt`
- [ ] Todas las guardas escritas sin corchetes y visibles en negro en el SVG
- [ ] Un `end` por fragmento
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

La especificación añade: "si el pago se rechaza tres veces, el quiosco se bloquea". ¿Lo modelas con un `loop` alrededor del cobro o con otro diagrama? Escríbelo y justifica en una línea de comentario `'`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 02 — Asíncronos, creación y destrucción](../lab-02-asincronos-creacion-y-destruccion/README.md) | [Lab 04 — loop, break, par y ref](../lab-04-loop-break-par-y-ref/README.md) → |

[↑ Semana 06](../../README.md)
