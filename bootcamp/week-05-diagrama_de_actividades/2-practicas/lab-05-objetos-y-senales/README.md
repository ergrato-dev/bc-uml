# Lab 05 — Objetos y señales

⏱ Duración estimada: ~60 min

## Objetivo

Completar el flujo de una reserva con nodos de objeto que muestran sus estados, una señal, dos esperas y la trazabilidad hacia el diagrama de clases.

## Contexto

- Nodos de objeto, señales y eventos: [Objetos y señales](../../1-teoria/03-objetos-y-senales.md).
- `starter/clases.puml` es de referencia: no lo modifiques. `Reservation` tiene `status: ReservationStatus` con `WAITING`, `READY`, `PICKED_UP` y `EXPIRED`.
- Un socio reserva un libro que está prestado. Cuando alguien devuelve un ejemplar, el bibliotecario lo aparta y el sistema avisa al socio, que tiene 3 días para recogerlo.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-05-diagrama_de_actividades/2-practicas/lab-05-objetos-y-senales
   ```

1. Renderiza los dos diagramas:

   ```bash
   plantuml -tsvg starter/clases.puml starter/reservas.puml; echo $?
   ```

   Output: `0`. Abre los dos SVG. En `reservas.svg` hay tres calles y cuatro acciones.

2. **TODO 1 — Nodo de objeto.** Debajo de `:Create reservation;`:

   ```plantuml
   :Reservation [WAITING]; <<object>>
   ```

   Renderiza: un rectángulo de esquinas rectas. Se lee "`Create reservation` produce una `Reservation` en estado `WAITING`".

3. **TODO 2 — Aceptar evento.** El sistema no hace nada hasta que vuelve un ejemplar. Debajo del nodo de objeto:

   ```plantuml
   :Copy returned; <<acceptEvent>>
   ```

   Renderiza: un rectángulo con una muesca a la izquierda. El flujo se para ahí hasta que el evento llega.

4. **TODO 3 — Cambio de estado y señal.** Después del `|Library System|` que sigue a `Hold copy`, añade tres líneas: la acción `:Mark reservation ready;`, el nodo de objeto con la reserva en `READY` y el aviso al socio:

   ```plantuml
   :Pickup notice; <<sendSignal>>
   ```

   El aviso sale y el flujo sigue: el sistema no espera respuesta.

5. **TODO 4 — Evento de tiempo.** Debajo de la señal: `:3 days; <<timeEvent>>`. Después, la decisión `if (Picked up?) then ([yes])`.

6. **TODO 5 — Estados finales.** En `[yes]`, el nodo de objeto con la reserva en `PICKED_UP`. En `else ([no])`, la acción `:Cancel reservation;` y la reserva en `EXPIRED`. Cierra con `endif`. Borra los comentarios de los TODO y renderiza.

7. Comprueba:

   ```bash
   plantuml -checkonly starter/reservas.puml; echo $?
   grep -c '<<object>>' starter/reservas.puml
   grep -cE '<<(sendSignal|acceptEvent|timeEvent)>>' starter/reservas.puml
   ```

   Output:

   ```
   0
   4
   3
   ```

8. **Trazabilidad.** Cada nombre y cada estado de un nodo de objeto existe en `clases.puml` (no debe listar nada más que `fin`):

   ```bash
   for x in $(grep '<<object>>' starter/reservas.puml | grep -oE '^[[:space:]]*:[A-Z][A-Za-z]*|[[][A-Z_]+[]]' | tr -d ' :[]' | sort -u); do grep -qw "$x" starter/clases.puml || echo "falta $x"; done; echo fin
   ```

   Output:

   ```
   fin
   ```

   Si escribes `[CANCELLED]` en lugar de `[EXPIRED]`, sale `falta CANCELLED`: el estado no existe en `ReservationStatus`. Corrige el diagrama de actividad, no `clases.puml`.

9. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué `Pickup notice` es una señal y no una acción `Notify member`? ¿Qué cambiaría si el sistema tuviera que esperar la confirmación del socio?
   - ¿Qué diferencia hay entre esperar `Copy returned` y esperar `3 days`?
   - ¿Qué operación de `Reservation` corresponde a cada cambio de estado del diagrama? ¿Falta alguna?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0`
- [ ] 4 nodos de objeto `Reservation` con los 4 estados de `ReservationStatus`
- [ ] 1 `sendSignal`, 1 `acceptEvent` y 1 `timeEvent`
- [ ] La comprobación del paso 8 imprime solo `fin`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Si el socio no recoge el libro, el ejemplar pasa al siguiente socio de la cola. Modela esa vuelta: ¿qué estado le falta a `ReservationStatus` o qué clase le falta al modelo? Anótalo en `preguntas.md` sin tocar `clases.puml`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 04 — Particiones](../lab-04-particiones/README.md) | [Lab 06 — Depurar actividades rotas](../lab-06-depurar-actividades-rotas/README.md) → |

[↑ Semana 05](../../README.md)
