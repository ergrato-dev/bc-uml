# Lab 04 — loop, break, par y ref

⏱ Duración estimada: ~60 min

## Objetivo

Reescribir la devolución de libros con `ref` para el caso de uso incluido, `break` para la salida temprana, `loop` para la repetición y `par` para los pasos independientes.

## Contexto

- Sintaxis y reglas: [Fragmentos combinados](../../1-teoria/02-fragmentos.md), tabla de operadores.
- `starter/devolucion.puml` renderiza, pero copia a mano dos vueltas de la devolución, dibuja la identificación del socio paso a paso y no dice qué pasa con un socio bloqueado.
- Especificación, en resumen: se identifica al socio (CU-07, `<<include>>`). Si está bloqueado, se le pide revisar su cuenta y el caso termina. Por cada ejemplar: se cierra el préstamo, se cobra multa si volvió tarde, y a la vez se marca el ejemplar como disponible y se avisa al siguiente de la lista de reservas.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-06-secuencia_y_comunicacion/2-practicas/lab-04-loop-break-par-y-ref
   ```

1. Renderiza el starter y cuenta las vueltas copiadas a mano:

   ```bash
   plantuml -tsvg starter/devolucion.puml; echo $?
   plantuml -syntax < starter/devolucion.puml
   grep -c 'close(returnedAt)' starter/devolucion.puml
   ```

   Output:

   ```
   0
   SEQUENCE
   (7 participants)
   2
   ```

   Abre `starter/devolucion.svg`: dos `close(returnedAt)`, porque el diagrama dibuja un socio que devuelve dos libros. ¿Y si devuelve tres?

2. **TODO 1 — ref.** Identificar al socio tiene su propia especificación (CU-07). Sustituye los dos mensajes `findByCard` y su respuesta por:

   ```plantuml
   ref over svc, member : CU-07 Identify member
   ```

   `over svc, member` dice qué lifelines cubre el marco. `ref` es una sola línea: no lleva `end`. Si le pones uno, PlantUML falla con `Cannot create group`.

3. **TODO 2 — break.** El mensaje `review account first` solo se envía si el socio está bloqueado, y después no pasa nada más:

   ```plantuml
   break member is blocked
     svc --> desk : review account first
   end
   ```

   Es `break` y no `alt`: no hay un segundo operando; si la guarda se cumple, se hace el operando y se abandona el resto de la interacción.

4. **TODO 3 — loop.** Borra la segunda vuelta (`close(returnedAt)` y `markAvailable()` repetidos) y envuelve la primera:

   ```plantuml
   loop for each returned copy
     svc -> loan : close(returnedAt)
     svc -> member : addFine(daysLate)
     svc -> copy : markAvailable()
     svc ->> notif : notifyNextReservation(copyId)
   end
   ```

   Una vuelta dibujada vale para todas: es el sentido del `loop`.

5. **TODO 4 — opt dentro del loop.** La multa solo se cobra si el ejemplar volvió tarde. Dentro del `loop`, envuelve `addFine` en `opt returned late` ... `end`.

6. **TODO 5 — par.** Marcar el ejemplar y avisar al siguiente de la lista no tienen orden entre sí:

   ```plantuml
   par
     svc -> copy : markAvailable()
   else
     svc ->> notif : notifyNextReservation(copyId)
   end
   ```

   Los operandos de `par` no llevan guarda: `par` y `else` van solos. Borra los comentarios de los TODO y renderiza: el `opt` y el `par` quedan dentro del marco `loop`.

7. Comprueba:

   ```bash
   plantuml -checkonly starter/devolucion.puml; echo $?
   grep -cE '^[[:space:]]*(loop|break|par|opt)([[:space:]]|$)' starter/devolucion.puml
   grep -cE '^[[:space:]]*ref over' starter/devolucion.puml
   grep -cE '^[[:space:]]*end[[:space:]]*$' starter/devolucion.puml
   grep -c 'close(returnedAt)' starter/devolucion.puml
   ```

   Output:

   ```
   0
   4
   1
   4
   1
   ```

   4 fragmentos con `end` (`break`, `loop`, `opt`, `par`), 1 `ref` sin `end` y una sola vuelta dibujada.

8. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Qué ganas al usar `ref` para CU-07 en vez de dibujar sus mensajes? ¿Qué relación del diagrama de casos de uso representa?
   - ¿Por qué `break` y no `alt` con un `else` que contenga todo lo demás?
   - Si el aviso al siguiente socio tuviera que esperar a que el ejemplar esté disponible, ¿seguiría siendo `par`?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0`
- [ ] `ref over` sobre el servicio y el socio, sin `end`
- [ ] `break` con guarda, sin segundo operando
- [ ] Un `loop` con una sola vuelta dibujada, con `opt` y `par` dentro
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Dibuja CU-07 Identify member en su propio archivo `identificar-socio.puml`: el servicio busca al socio por la tarjeta y, si no existe, la mesa de devolución pide el documento de identidad. Comprueba que el `ref` de este lab y tu nuevo diagrama usan las mismas lifelines.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 03 — Fragmentos alt y opt](../lab-03-fragmentos-alt-y-opt/README.md) | [Lab 05 — Diagrama de comunicación](../lab-05-diagrama-de-comunicacion/README.md) → |

[↑ Semana 06](../../README.md)
