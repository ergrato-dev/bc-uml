# Lab 01 — Lifelines y mensajes

⏱ Duración estimada: ~60 min

## Objetivo

Modelar como diagrama de secuencia la reserva de un libro sin ejemplares libres, con lifelines del tipo correcto, mensajes síncronos, respuestas y activaciones.

## Contexto

- Sintaxis y reglas: [Lifelines y mensajes](../../1-teoria/01-lifelines-y-mensajes.md).
- `starter/reserva.puml` renderiza, pero solo tiene el actor, un mensaje mal escrito y los TODO.
- Escenario: un socio pide reservar un libro; no quedan ejemplares libres, así que el libro lo apunta en su lista de espera y el socio ve en qué posición quedó.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-06-secuencia_y_comunicacion/2-practicas/lab-01-lifelines-y-mensajes
   ```

1. Renderiza el starter y comprueba el tipo de diagrama:

   ```bash
   plantuml -tsvg starter/reserva.puml; echo $?
   plantuml -syntax < starter/reserva.puml
   ```

   Output:

   ```
   0
   SEQUENCE
   (1 participants)
   ```

   `SEQUENCE` es el tipo y `(1 participants)` cuenta las lifelines. Abre `starter/reserva.svg`: el actor `Member` con una flecha que vuelve sobre sí mismo.

2. **TODO 1 — Lifelines.** Debajo de `actor Member`, declara las otras tres en el orden en que quieres verlas de izquierda a derecha:

   ```plantuml
   boundary ":ReservationScreen" as ui
   control ":ReservationService" as svc
   participant ":Book" as book
   ```

   Comprueba:

   ```bash
   plantuml -syntax < starter/reserva.puml
   ```

   Output:

   ```
   SEQUENCE
   (4 participants)
   ```

   En el SVG, `:ReservationScreen` lleva el icono de boundary (círculo con barra) y `:ReservationService` el de control (círculo con flecha). `:Book` es una caja: un objeto anónimo de la clase `Book`.

3. **TODO 2 — El primer mensaje.** `Member -> Member : Reservation screen` no es una llamada: es el nombre de una pantalla y va del actor a sí mismo. Sustitúyelo por:

   ```plantuml
   Member -> ui : reserve(isbn)
   ui -> svc : reserve(isbn, memberId)
   ```

   La pantalla recibe el ISBN del socio; el servicio necesita además saber quién reserva. Renderiza: dos flechas continuas con punta rellena, de izquierda a derecha.

4. **TODO 3 — Mensajes al libro.** El servicio pregunta cuántos ejemplares libres hay y, como no hay ninguno, pide al libro que apunte al socio en la lista de espera:

   ```plantuml
   svc -> book : availableCopies()
   svc -> book : addToWaitingList(memberId)
   ```

   Cada mensaje síncrono es una operación de `Book`: en el diagrama de clases, `Book` tendría `+ availableCopies(): Integer` y `+ addToWaitingList(memberId: UUID): Integer`.

5. **TODO 4 — Respuestas.** Las respuestas van con flecha discontinua y llevan un valor, no una operación. Inserta cada una justo debajo de la llamada a la que responde:

   ```plantuml
   book --> svc : 0
   ```

   debajo de `availableCopies()`, y

   ```plantuml
   book --> svc : position
   ```

   debajo de `addToWaitingList(memberId)`. Al final, las dos respuestas que suben hasta el socio:

   ```plantuml
   svc --> ui : position
   ui --> Member : show waiting list position
   ```

6. **TODO 5 — Activación.** Escribe `activate ui` justo después de `Member -> ui : reserve(isbn)` y `activate svc` justo después de `ui -> svc : ...`. Cierra con `deactivate svc` antes de `svc --> ui : position` y con `deactivate ui` al final, antes de `@enduml`. Borra los comentarios de los TODO.

   Renderiza y abre el SVG: dos barras finas, la de `:ReservationService` dentro del tiempo de la de `:ReservationScreen`. La pantalla espera mientras el servicio trabaja.

7. **Un error de tipeo que no da error.** Cambia temporalmente `svc -> book : availableCopies()` por `svc -> bok : availableCopies()` y comprueba:

   ```bash
   plantuml -syntax < starter/reserva.puml
   ```

   Output:

   ```
   SEQUENCE
   (5 participants)
   ```

   PlantUML no falla: crea una quinta lifeline `bok`. Mira el SVG y vuelve a escribir `book`.

8. Comprueba:

   ```bash
   plantuml -checkonly starter/reserva.puml; echo $?
   grep -cE '^[[:space:]]*(actor|boundary|control|participant)[[:space:]]' starter/reserva.puml
   grep -cE '^[[:space:]]*[A-Za-z0-9_]+[[:space:]]*->[[:space:]]*[A-Za-z0-9_]+[[:space:]]*:[[:space:]]*[a-z][A-Za-z0-9]*[(]' starter/reserva.puml
   grep -cE '^[[:space:]]*[A-Za-z0-9_]+[[:space:]]*-->[[:space:]]*[A-Za-z0-9_]+[[:space:]]*:' starter/reserva.puml
   grep -cE '^[[:space:]]*activate' starter/reserva.puml
   ```

   Output:

   ```
   0
   4
   4
   4
   2
   ```

   4 lifelines, 4 mensajes síncronos con operación, 4 respuestas y 2 activaciones.

9. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué `:Book` lleva dos puntos delante y `Member` no?
   - ¿Qué operaciones tendrías que añadir a la clase `Book` para que este diagrama sea coherente con el de clases?
   - ¿Qué pasaría con la barra de activación de la pantalla si `reserve(...)` fuera asíncrono?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` cuenta `(4 participants)`
- [ ] Una lifeline actor, una boundary, una control y una participant `:Book`
- [ ] 4 mensajes síncronos con nombre de operación y paréntesis
- [ ] 4 respuestas con valor, cada una debajo de su llamada
- [ ] 2 activaciones cerradas con su `deactivate`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Añade el caso en que sí hay ejemplares libres: el libro devuelve `1` y el servicio llama a `holdCopy(memberId)`. Todavía sin fragmentos: dibújalo en otro archivo `reserva-con-ejemplar.puml`. ¿Qué mensajes comparten los dos diagramas? En el lab 03 los juntarás en uno solo.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Índice de labs](../README.md) | [Lab 02 — Asíncronos, creación y destrucción](../lab-02-asincronos-creacion-y-destruccion/README.md) → |

[↑ Semana 06](../../README.md)
