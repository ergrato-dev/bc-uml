# Lab 03 — Matriz de trazabilidad

⏱ Duración estimada: ~60 min

## Objetivo

Construir la matriz de trazabilidad de la venta de entradas de un cine y usarla en las dos direcciones para encontrar una clase huérfana y los casos de uso poco explicados.

## Contexto

- Qué es la matriz y cómo se lee: [Trazabilidad](../../1-teoria/02-trazabilidad.md).
- `starter/` tiene tres diagramas del cine (`casos-de-uso.puml`, `clases.puml` y `secuencia-comprar-entrada.puml`) y `trazabilidad.md` con la fila de CU-01 hecha como ejemplo.
- Especificación: este año el cine no tiene programa de puntos. Vende entradas, las devuelve y programa funciones.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-10-proyecto_integrador/2-practicas/lab-03-matriz-de-trazabilidad
   ```

1. Renderiza los tres diagramas, ábrelos (`starter/*.svg`) y abre también `starter/trazabilidad.md`:

   ```bash
   plantuml -tsvg starter/*.puml; echo $?
   for f in starter/*.puml; do plantuml -syntax < $f | tr '\n' ' '; echo; done
   ```

   Output:

   ```
   0
   DESCRIPTION (7 entities)
   CLASS (8 entities)
   SEQUENCE (4 participants)
   ```

   El diagrama de casos de uso cuenta los dos actores y los cinco casos de uso.

2. Compara los casos de uso del diagrama con las filas de la matriz. `comm -3` imprime en la primera columna lo que solo está en el diagrama y, tras un tabulador, lo que solo está en la matriz:

   ```bash
   grep -oE 'as[[:space:]]+CU[0-9]{2}' starter/casos-de-uso.puml | grep -oE '[0-9]{2}' | sort -u > /tmp/cu
   grep -oE '^[|][[:space:]]*CU-[0-9]{2}' starter/trazabilidad.md | grep -oE '[0-9]{2}' | sort -u > /tmp/filas
   comm -3 /tmp/cu /tmp/filas
   ```

   Output:

   ```
   02
   03
   04
   05
   ```

3. **TODO 1 — Una fila por caso de uso.** Debajo de la fila de CU-01, escribe las de CU-02 a CU-05 con su nombre del diagrama. En Diagramas, un enlace a cada diagrama donde se ve: todos están en `casos-de-uso.puml`; `Buy ticket` también tiene secuencia.

   ```markdown
   | CU-02 | Buy ticket | | [casos de uso](casos-de-uso.puml), [clases](clases.puml), [secuencia](secuencia-comprar-entrada.puml) |
   ```

   Repite el paso 2: `(sin salida)`.

4. **TODO 2 — Las clases de cada fila.** Para cada caso de uso, las clases que crea, modifica o consulta, entre comillas invertidas. En `Buy ticket`, sigue la secuencia: el cliente consulta la función, se crea la entrada y la entrada crea el pago; el asiento va en la entrada.

   ```markdown
   | CU-02 | Buy ticket | `Customer`, `Screening`, `Seat`, `Ticket`, `Payment` | ... |
   ```

   Para los demás, mira las asociaciones de `clases.puml`: elegir asiento necesita la sala; programar una función necesita la película y la sala; devolver una entrada genera un pago de vuelta (`refund(): Payment`). Borra los comentarios de los TODO 1 y 2.

5. Lee la matriz hacia atrás: las clases del diagrama que no aparecen en ninguna fila. El `awk` toma la cuarta columna (la primera es lo que hay antes de la primera barra):

   ```bash
   grep -oE '^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+' starter/clases.puml | awk '{print $NF}' | sort -u > /tmp/clases
   awk -F'|' '$2 ~ /CU-[0-9]/ {print $4}' starter/trazabilidad.md | grep -oE '`[A-Z][A-Za-z0-9_]*`' | tr -d '`' | sort -u > /tmp/usadas
   comm -3 /tmp/clases /tmp/usadas
   ```

   Output:

   ```
   LoyaltyCard
   ```

   Si sale algo con un tabulador delante, es un nombre de la matriz que no existe en `clases.puml`: una errata.

6. **TODO 3 — La clase huérfana.** `LoyaltyCard` no la justifica ningún caso de uso, y la especificación dice que no hay programa de puntos. Hay dos salidas: añadir un caso de uso o quitar la clase. Aquí la clase sobra: borra `class LoyaltyCard { ... }` y la línea `Customer "1" --> "0..1" LoyaltyCard`. Comprueba:

   ```bash
   plantuml -checkonly starter/clases.puml; echo $?
   plantuml -syntax < starter/clases.puml
   ```

   Output:

   ```
   0
   CLASS
   (7 entities)
   ```

   Repite las tres líneas del paso 5: `(sin salida)`.

7. Lee la matriz hacia delante: los casos de uso que no tienen ninguna vista de comportamiento (en este modelo, la secuencia):

   ```bash
   awk -F'|' '$2 ~ /CU-[0-9]/ && $5 !~ /secuencia/ {print $2}' starter/trazabilidad.md
   ```

   Output:

   ```
    CU-01
    CU-03
    CU-04
    CU-05
   ```

8. **TODO 4 — Los huecos.** Cuatro de cinco casos de uso solo se ven en el diagrama de casos de uso y en el de clases. En `## Huecos que deja la matriz`, escribe una línea por hueco con el diagrama que lo cubriría. Empieza por el más arriesgado: `Refund ticket` mueve dinero y no tiene ni secuencia ni estados de `Ticket`. Borra el comentario del TODO 4.

9. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - En el TODO 3 quitaste la clase. ¿Qué tendría que decir la especificación para que la respuesta fuera añadir un caso de uso?
   - `Seat` está en `Buy ticket` y en `Choose seat`. ¿Pasa algo porque una clase aparezca en varias filas? ¿Y si aparece en todas?
   - `Choose seat` es un `<<include>>` de `Buy ticket`. ¿Merece su propia fila o bastaría con la de `Buy ticket`?

## Criterios de éxito

- [ ] `plantuml -checkonly starter/*.puml` sale con `0` y `clases.puml` tiene `(7 entities)`
- [ ] El `comm` del paso 2 y el del paso 5 no imprimen nada
- [ ] Cada fila nombra al menos una clase y enlaza al menos un diagrama
- [ ] `## Huecos que deja la matriz` nombra los cuatro casos de uso sin secuencia
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Dibuja `secuencia-devolver-entrada.puml` para `Refund ticket`, añádela a su fila y repite el paso 7. ¿Qué operación nueva te pide la secuencia en `Ticket` o en `Payment`?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 02 — Coherencia entre estados, objetos, paquetes y clases](../lab-02-coherencia-estados-objetos-y-paquetes/README.md) | [Lab 04 — Revisión por pares](../lab-04-revision-por-pares/README.md) → |

[↑ Semana 10](../../README.md)
