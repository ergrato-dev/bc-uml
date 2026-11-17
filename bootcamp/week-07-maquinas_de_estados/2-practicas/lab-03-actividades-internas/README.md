# Lab 03 — Actividades internas

⏱ Duración estimada: ~60 min

## Objetivo

Reescribir el ciclo de vida de una función de cine con `entry`, `exit` y `do`, una transición interna en lugar de una autotransición y eventos de cambio y de tiempo.

## Contexto

- Sintaxis y reglas: [Actividades internas](../../1-teoria/02-actividades-internas.md).
- `starter/funcion.puml` renderiza, pero repite la misma acción en cada salida de `OnSale`, no abre nunca la taquilla, cierra y reabre la taquilla con cada entrada vendida y depende de eventos que nadie envía.
- Especificación: mientras la función está a la venta, la taquilla está abierta; se abre al entrar en venta y se cierra al salir, por la razón que sea. Cada venta actualiza las butacas libres sin cerrar la taquilla. La función se agota cuando no quedan butacas libres y vuelve a la venta si se devuelve una entrada. Mientras se proyecta, la sala reproduce la película, y la función termina cuando ha pasado su duración.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-07-maquinas_de_estados/2-practicas/lab-03-actividades-internas
   ```

1. Renderiza el starter y cuenta cuántas veces aparece la acción repetida:

   ```bash
   plantuml -tsvg starter/funcion.puml; echo $?
   plantuml -syntax < starter/funcion.puml
   grep -c closeBoxOffice starter/funcion.puml
   ```

   Output:

   ```
   0
   STATE
   (7 entities)
   3
   ```

   3: una en el comentario del TODO 1 y dos en transiciones. Abre `starter/funcion.svg`: una flecha que sale de `OnSale` y vuelve a `OnSale`.

2. **TODO 1 — exit.** `closeBoxOffice()` tiene que ejecutarse en cualquier salida de `OnSale`, también en las que se añadan mañana. Quita `/ closeBoxOffice()` de las dos transiciones y escríbelo una vez como actividad de salida:

   ```plantuml
   OnSale --> SoldOut : lastSeatSold
   OnSale --> Running : start()
   OnSale : exit / closeBoxOffice()
   ```

   Renderiza: la caja de `OnSale` crece con un compartimento y `exit / closeBoxOffice()` dentro.

3. **TODO 2 — entry.** Nadie abría la taquilla. Escribe encima de la línea del `exit` (PlantUML dibuja las líneas en el orden en que las escribes):

   ```plantuml
   OnSale : entry / openBoxOffice()
   ```

   Ahora la taquilla se abre tanto al llegar desde `Scheduled` como al volver desde `SoldOut` con `seatRefunded`, sin escribirlo en ninguna de las dos flechas.

4. **TODO 3 — Transición interna.** `OnSale --> OnSale` sale del estado y vuelve a entrar: con el `entry` y el `exit` que acabas de escribir, cada venta cerraría y reabriría la taquilla. Sustitúyela por una transición interna, que no sale:

   ```plantuml
   OnSale : seatSold / updateFreeSeats()
   ```

   Renderiza: la flecha que volvía sobre `OnSale` desaparece y la venta queda dentro de la caja, debajo del `exit`.

5. **TODO 4 — do.** Lo que la sala hace mientras dura la función es una actividad que se prolonga, no una acción puntual. Va sin paréntesis:

   ```plantuml
   Running : do / projectFilm
   ```

6. **TODO 5 — Eventos de cambio y de tiempo.** Nadie envía `lastSeatSold` y nadie llama a `end()`: son condiciones que se cumplen solas. Cámbialos:

   ```plantuml
   OnSale --> SoldOut : when(freeSeats = 0)
   Running --> Finished : after(duration)
   ```

   `when` se dispara en el instante en que la condición pasa a ser verdadera. `after` cuenta desde que la función entró en `Running`. Borra los comentarios de los TODO y renderiza.

7. Comprueba:

   ```bash
   plantuml -checkonly starter/funcion.puml; echo $?
   grep -cE '^[A-Za-z]+ : (entry|exit|do) /' starter/funcion.puml
   grep -c 'OnSale --> OnSale' starter/funcion.puml
   grep -c closeBoxOffice starter/funcion.puml
   grep -cE '(when|after)[(]' starter/funcion.puml
   ```

   Output:

   ```
   0
   3
   0
   1
   2
   ```

   3 actividades internas, ninguna autotransición, `closeBoxOffice()` escrita una sola vez y 2 eventos que llegan sin que nadie los envíe.

8. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - Si llega `start()` mientras la función está en `OnSale`, ¿en qué orden se ejecutan `closeBoxOffice()`, la acción de la transición (si la hubiera) y lo que haya al entrar en `Running`?
   - ¿Por qué `projectFilm` es `do` y `openBoxOffice()` es `entry`?
   - Si en lugar de `after(duration)` escribieras `when(now > endsAt)`, ¿cambiaría algo para el lector? ¿Cuál dirías que es más fiel a la especificación?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0`
- [ ] `OnSale` con `entry` y `exit`, y `closeBoxOffice()` escrita una sola vez
- [ ] La venta de una entrada es una transición interna, sin autotransición
- [ ] `Running` con una actividad `do` sin paréntesis
- [ ] Un evento `when(...)` y un evento `after(...)`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

El cine quiere que, si la función lleva 20 minutos a la venta sin vender nada, se lance una promoción. Añádelo como transición interna con un evento de tiempo. ¿Se reinicia la cuenta de los 20 minutos con cada venta? ¿Y con cada `seatRefunded`?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 02 — Guardas, acciones y choice](../lab-02-guardas-acciones-y-choice/README.md) | [Lab 04 — Estados compuestos e historia](../lab-04-estados-compuestos-e-historia/README.md) → |

[↑ Semana 07](../../README.md)
