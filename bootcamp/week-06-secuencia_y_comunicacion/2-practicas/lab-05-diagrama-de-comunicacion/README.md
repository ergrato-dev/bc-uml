# Lab 05 — Diagrama de comunicación

⏱ Duración estimada: ~60 min

## Objetivo

Redibujar como diagrama de comunicación una secuencia de compra de entradas, con un enlace por pareja de objetos y numeración decimal que conserve quién espera a quién.

## Contexto

- Sintaxis y reglas: [Diagrama de comunicación](../../1-teoria/03-comunicacion.md).
- `starter/secuencia.puml` está completo: es la interacción de partida. No lo cambies.
- `starter/comunicacion.puml` renderiza con los objetos declarados, pero sin el actor, sin la mitad de los enlaces, con un enlace repetido y con un mensaje al revés.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-06-secuencia_y_comunicacion/2-practicas/lab-05-diagrama-de-comunicacion
   ```

1. Renderiza los dos diagramas:

   ```bash
   plantuml -tsvg starter/secuencia.puml starter/comunicacion.puml; echo $?
   plantuml -syntax < starter/comunicacion.puml
   ```

   Output:

   ```
   0
   CLASS
   (5 entities)
   ```

   `CLASS`: PlantUML dibuja la comunicación como un diagrama de objetos. Abre los dos SVG uno al lado del otro. En `starter/secuencia.svg`, numera a lápiz cada mensaje síncrono según quién lo envía mientras atiende a quién: `buyTicket` es `1`, `sell` es `1.1`, `isFree` es `1.1.1`.

2. **TODO 1 — El actor.** Escribe `actor Customer` en la línea del TODO 1 y comprueba:

   ```bash
   plantuml -checkonly starter/comunicacion.puml; echo $?
   plantuml -syntax < starter/comunicacion.puml
   ```

   Output:

   ```
   Some diagram description contains errors
   200
   ERROR
   11
   Use 'allowmixing' if you want to mix classes and other UML elements. (Assumed diagram type: class)
   ```

   `-syntax` cuenta las líneas desde 0: el `11` es la línea 12 del archivo, la del actor. Un diagrama de objetos no admite actores salvo que lo permitas. Añade `allowmixing` debajo del `title` y vuelve a comprobar: sale con `0`.

3. **TODO 2 — Los primeros enlaces.** Un enlace (`--`) dice que dos objetos se conocen; el mensaje va en la etiqueta, con su número delante y la dirección al final:

   ```plantuml
   Customer -- kiosk : "1: buyTicket(screeningId, seatNumber) >"
   kiosk -- svc : "1.1: sell(screeningId, seatNumber) >"
   ```

   Escribe cada enlace empezando por quien envía: así `>` siempre apunta al que recibe. Renderiza: una flecha pequeña junto a cada etiqueta.

4. **TODO 3 — Un enlace por pareja.** `svc -- seat` aparece dos veces y el SVG dibuja dos líneas entre los mismos objetos. Júntalas en una etiqueta de dos líneas con `\n`:

   ```plantuml
   svc -- seat : "1.1.1: isFree()\n1.1.3: hold() >"
   ```

5. **TODO 4 — La dirección.** `pay -- svc : "... >"` dibuja la flecha de la pasarela al servicio, pero `charge(price)` lo envía el servicio. Escribe el enlace al revés:

   ```plantuml
   svc -- pay : "1.1.2: charge(price) >"
   ```

   Comprueba en el SVG que la flecha de `charge` apunta a `:PaymentGateway`.

6. **TODO 5 — Creación y mensaje a sí mismo.** La entrada se crea después de `hold()`, y el quiosco imprime cuando el servicio ya respondió a `sell`:

   ```plantuml
   svc -- ticket : "1.1.4: <<create>> >"
   kiosk -- kiosk : "1.2: printTicket(ticket) >"
   ```

   `printTicket` es `1.2` y no `1.1.5`: lo envía el quiosco mientras atiende `buyTicket` (1), no mientras el servicio atiende `sell` (1.1). Borra los comentarios de los TODO.

7. Comprueba:

   ```bash
   plantuml -checkonly starter/comunicacion.puml; echo $?
   plantuml -syntax < starter/comunicacion.puml
   grep -cE ':[[:space:]]*"[0-9]+([.][0-9]+)*:' starter/comunicacion.puml
   grep -oE '[0-9]+([.][0-9]+)*: [a-zA-Z<]' starter/comunicacion.puml | wc -l
   ```

   Output:

   ```
   0
   CLASS
   (6 entities)
   6
   7
   ```

   6 objetos (el actor cuenta), 6 enlaces numerados y 7 mensajes: los 7 mensajes síncronos y de creación de la secuencia, sin las respuestas.

8. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - Mira los enlaces: ¿qué objeto habla con casi todos? ¿Es un problema en este escenario o es su trabajo?
   - ¿Qué asociaciones tiene que haber en el diagrama de clases para que existan los enlaces `svc -- seat` y `svc -- ticket`? ¿O basta con un parámetro?
   - ¿Por qué el diagrama de comunicación no dibuja las respuestas `true` y `approved`?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` cuenta `(6 entities)`
- [ ] Un solo enlace entre cada par de objetos
- [ ] Los 7 mensajes de la secuencia numerados con 1, 1.1, 1.1.1… y en el mismo orden
- [ ] Cada flecha apunta al objeto que recibe el mensaje
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Haz el camino inverso con tu diagrama del lab 02 (`pedido.puml`): dibújalo como comunicación y compara cuántos enlaces salen de `:OrderService`. ¿Qué mensaje no sabes cómo representar sin las barras de activación?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 04 — loop, break, par y ref](../lab-04-loop-break-par-y-ref/README.md) | [Lab 06 — Depurar secuencias rotas](../lab-06-depurar-secuencias-rotas/README.md) → |

[↑ Semana 06](../../README.md)
