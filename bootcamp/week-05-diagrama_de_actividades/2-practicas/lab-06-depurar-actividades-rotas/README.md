# Lab 06 — Depurar actividades rotas

⏱ Duración estimada: ~60 min

## Objetivo

Reparar un diagrama de actividad que no renderiza y, cuando renderice, corregir sus errores de modelado.

## Contexto

- `starter/venta.puml` tiene **2 errores de sintaxis** y al menos **9 errores de modelado**.
- `plantuml -syntax` cuenta las líneas desde 0; `plantuml -tsvg`, desde 1. La línea que da el error no siempre es la que lo causa.
- Repasa las secciones "Errores frecuentes" de los tres archivos de [teoría](../../1-teoria/01-acciones-y-decisiones.md).

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-05-diagrama_de_actividades/2-practicas/lab-06-depurar-actividades-rotas
   ```

1. Renderiza:

   ```bash
   plantuml -tsvg starter/venta.puml; echo $?
   plantuml -syntax < starter/venta.puml | head -3
   ```

   Output:

   ```
   Error line 21 in file: starter/venta.puml
   Some diagram description contains errors
   200
   ERROR
   20
   Cannot find fork (Assumed diagram type: activity)
   ```

   La línea 21 es `fork again` y está bien escrita: PlantUML no encuentra el `fork` que la abre. Busca hacia arriba. La línea 17, `:Data]`, no termina en `;`: PlantUML sigue leyendo la acción hasta el siguiente `;` y se come el `fork` de la línea 19. Corrígela como nodo de objeto: `:Data; <<object>>`.

2. Vuelve a renderizar:

   ```
   Error line 33 in file: starter/venta.puml
   Some diagram description contains errors
   200
   ```

   La línea 33 cierra un fork con `endif`. Cámbialo por `end fork` y renderiza otra vez:

   ```bash
   plantuml -tsvg starter/venta.puml; echo $?
   ```

   Output: `0`. Abre `starter/venta.svg`.

3. Crea `revision.md` con una tabla `| Línea | Error | Regla que rompe | Corrección |` y añade una fila por error. Revisa con estas preguntas:
   - **Nodos:** ¿cuántos nodos iniciales hay? ¿Alguna acción no tiene verbo? ¿Algún nodo de objeto no es una clase del negocio?
   - **Particiones:** ¿alguna es una pieza técnica? ¿Alguna acción está en la calle de quien la pide en lugar de quien la hace?
   - **Decisiones:** ¿todas las guardas van entre corchetes? ¿Son excluyentes y exhaustivas? ¿Qué pasa en el diagrama si el pago falla?
   - **Paralelo:** ¿algún fork modela alternativas? ¿Alguna rama paralela termina toda la actividad?

4. Corrige `starter/venta.puml`. Al terminar:
   - Particiones `Customer`, `Cinema System` y `Payment Gateway`, sin `Database`.
   - Un solo `start` y acciones con verbo (`Choose seats`).
   - Después de `Hold seats`, la reserva como `:Booking [HELD]; <<object>>`.
   - El medio de pago es una decisión `[card]` / `[voucher]`; `Charge card` está en `Payment Gateway`.
   - Si el pago falla (`[no]`), `Release seats` y `stop`.
   - Un fork con el envío de entradas y la actualización del mapa de butacas, cerrado con `end fork` y sin `stop` dentro.
   - Los puntos de fidelidad, con una decisión `Total over 20?` y guardas `[yes]` / `[no]`.

5. Comprueba:

   ```bash
   plantuml -checkonly starter/venta.puml; echo $?
   grep -cE '^[[:space:]]*start[[:space:]]*$' starter/venta.puml
   grep -cE '(then|else)[[:space:]]*[(][^[]' starter/venta.puml
   grep -c Database starter/venta.puml
   grep -cE '^[[:space:]]*fork[[:space:]]*$' starter/venta.puml
   ```

   Output:

   ```
   0
   1
   0
   0
   1
   ```

   Un inicio, ninguna guarda sin corchetes, ninguna `Database` y un solo fork.

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y los conteos del paso 5 coinciden
- [ ] El pago con tarjeta o vale es una decisión, no un fork, y el pago fallido termina en `stop`
- [ ] Ninguna rama paralela termina con `stop`
- [ ] `revision.md` tiene al menos 9 errores de modelado, cada uno con la regla que rompe

## Reto extra

Las butacas retenidas se liberan si el cliente no paga en 10 minutos. Añade la espera con un evento de tiempo. ¿Cómo se combina con el pago, que también es una espera? Escribe en `revision.md` por qué esto se modela mejor en la máquina de estados de `Booking` (semana 07).

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 05 — Objetos y señales](../lab-05-objetos-y-senales/README.md) | [Proyecto — Actividad del proceso núcleo](../../3-proyecto/README.md) → |

[↑ Semana 05](../../README.md)
