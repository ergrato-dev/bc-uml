# Lab 04 — Revisión por pares

⏱ Duración estimada: ~60 min

## Objetivo

Revisar el modelo de una biblioteca hecho por otra persona con la lista de la teoría, registrar cada hallazgo en `revision.md` y, después, resolverlos como autor.

## Contexto

- Lista de revisión y formato de las resoluciones: [Revisión por pares y defensa](../../1-teoria/03-revision-y-defensa.md).
- `starter/` es el modelo de un compañero: `README.md`, `casos-de-uso.puml`, `clases.puml` y `estados-loan.puml`. Todo renderiza; los problemas son de modelado, no de sintaxis.
- `starter/revision.md` tiene la cabecera de la tabla. Haces dos papeles: primero revisor (TODO 1 a 5), luego autor (TODO 6 y 7).

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-10-proyecto_integrador/2-practicas/lab-04-revision-por-pares
   ```

1. Lee `starter/README.md` entero: dominio, actores y la regla de los 5 préstamos. Renderiza y abre los tres diagramas:

   ```bash
   plantuml -tsvg starter/*.puml; echo $?
   for f in starter/*.puml; do plantuml -syntax < $f | tr '\n' ' '; echo; done
   ```

   Output:

   ```
   0
   DESCRIPTION (9 entities)
   CLASS (4 entities)
   STATE (6 entities)
   ```

   Escribe tu dominio en la línea `Revisor:` de `starter/revision.md` (por ejemplo, `Revisor: compañero con dominio cine`) y la fecha.

2. **TODO 1 — Una clase que lo hace todo.** Cuenta las operaciones de cada clase:

   ```bash
   awk '/^(abstract )?class / {c=$2} /^}/ {c=""} c && /[(]/ {n[c]++} END {for (k in n) print n[k], k}' starter/clases.puml | sort -rn
   ```

   Output:

   ```
   11 LibrarySystem
   1 Loan
   ```

   Once operaciones en una clase y ninguna en `Member` ni en `Book`. Escribe el hallazgo como primera fila. El hallazgo dice qué ves, no cómo arreglarlo:

   ```markdown
   | 1 | [clases](clases.puml) | `LibrarySystem` tiene 11 operaciones y `Member` y `Book` ninguna: el resto de clases solo guarda datos. | |
   ```

   La resolución se queda vacía: la escribe el autor.

3. **TODO 2 — Composiciones y multiplicidades.** Busca las composiciones y las asociaciones de muchos a muchos:

   ```bash
   grep -E '[*]--' starter/clases.puml
   grep -E '"0[.][.][*]"[[:space:]]*-->[[:space:]]*"0[.][.][*]"' starter/clases.puml
   ```

   Output:

   ```
   Member "1" *-- "0..*" Book
   Loan "0..*" --> "0..*" Book
   ```

   Contrasta cada línea con el README del modelo. ¿Un libro desaparece cuando se da de baja un socio? ¿Un préstamo puede ser de varios libros? Escribe un hallazgo por línea (filas 2 y 3).

4. **TODO 3 — Actores y casos de uso.** Busca actores sin ninguna asociación:

   ```bash
   grep -oE '^actor[[:space:]]+[A-Za-z]+' starter/casos-de-uso.puml | awk '{print $2}' | while read a; do grep -qE "^$a[[:space:]]+--" starter/casos-de-uso.puml || echo $a; done
   ```

   Output:

   ```
   Accountant
   ```

   Lee también los nombres de los casos de uso del SVG: uno es un paso de la interfaz, no algo que el socio quiera conseguir. Escribe los dos hallazgos (filas 4 y 5).

5. **TODO 4 — Coherencia.** Los eventos de la máquina de estados contra las operaciones de `Loan`:

   ```bash
   awk '/^class Loan /,/^}/' starter/clases.puml | grep -oE '[+#~-][[:space:]]*[a-z][A-Za-z0-9_]*[(]' | grep -oE '[a-z][A-Za-z0-9_]*' | sort -u > /tmp/ops
   grep -oE -- '-->[^:]*:[[:space:]]*[a-z][A-Za-z0-9_]*[(]' starter/estados-loan.puml | grep -oE '[a-z][A-Za-z0-9_]*[(]$' | tr -d '(' | grep -vxE 'when|after' | sort -u | comm -23 - /tmp/ops
   ```

   Output:

   ```
   renew
   ```

   Fila 6, con el enlace a `estados-loan.puml`.

6. **TODO 5 — Comprobar la tabla.** Cada fila tiene que tener un enlace en Dónde y, al final, una resolución:

   ```bash
   awk -F'|' '$2 ~ /^[[:space:]]*[0-9]+[[:space:]]*$/ {n++; x=$5; gsub(/[[:space:]]/, "", x); if ($3 !~ /[]][(]/ || x == "") print "hallazgo" $2 "sin enlace o sin resolución"} END {print n+0, "hallazgos"}' starter/revision.md
   ```

   Output (como revisor, todavía sin resoluciones):

   ```
   hallazgo 1 sin enlace o sin resolución
   hallazgo 2 sin enlace o sin resolución
   hallazgo 3 sin enlace o sin resolución
   hallazgo 4 sin enlace o sin resolución
   hallazgo 5 sin enlace o sin resolución
   hallazgo 6 sin enlace o sin resolución
   6 hallazgos
   ```

7. **TODO 6 — Cambio de papel: resolver.** Ahora eres el autor. Cada resolución empieza por **Corregido**, **Se mantiene** o **Pendiente justificado** y dice qué o por qué:
   - Filas 2 a 6: Corregido, con el cambio exacto.
   - Fila 1: repartir las operaciones entre `Member`, `Book` y `Loan` es rehacer medio modelo. Pendiente justificado, diciendo qué operación va a qué clase.

   Repite el `awk` del paso 6. Output: `6 hallazgos`, sin ninguna línea de "sin resolución".

8. **TODO 7 — Aplicar lo corregido.** Haz los cambios que prometiste en las filas 2 a 6:
   - Borra `Member "1" *-- "0..*" Book`: el socio llega a sus libros a través de `Loan`.
   - `Loan "0..*" --> "1" Book`.
   - Cambia `Click search button` por `Review fines` (mismo alias `CU06`), borra el `<<include>>` y asocia `Accountant --> CU06`.
   - Añade `+ renew(): void` a `Loan`.

   Repite los comandos de los pasos 3, 4 y 5: los tres salen `(sin salida)`. Y:

   ```bash
   plantuml -checkonly starter/*.puml; echo $?
   for f in starter/*.puml; do plantuml -syntax < $f | tr '\n' ' '; echo; done
   ```

   Output:

   ```
   0
   DESCRIPTION (9 entities)
   CLASS (4 entities)
   STATE (6 entities)
   ```

   Los conteos no cambian: ninguna corrección añadió ni quitó elementos, solo los hizo verdad.

9. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - El hallazgo 1 no lo detecta ningún check de `plantuml`. ¿Qué tienen en común los hallazgos que solo encuentra una persona?
   - ¿Por qué el revisor escribe qué ve y no cómo arreglarlo?
   - Elige un hallazgo que, siendo el autor, podrías haber resuelto con "Se mantiene". ¿Qué motivo del dominio darías?

## Criterios de éxito

- [ ] `revision.md` tiene `Revisor:` relleno y 6 hallazgos, cada uno con enlace y resolución
- [ ] Las resoluciones empiezan por Corregido, Se mantiene o Pendiente justificado
- [ ] Los comandos de los pasos 3, 4 y 5 no imprimen nada tras el TODO 7
- [ ] `plantuml -checkonly starter/*.puml` sale con `0`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Intercambia tu `revision.md` con un compañero que haya hecho este lab. Compara los textos de los hallazgos: ¿alguno de los dos escribió la solución en lugar del problema?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 03 — Matriz de trazabilidad](../lab-03-matriz-de-trazabilidad/README.md) | [Lab 05 — Defensa de decisiones](../lab-05-defensa-de-decisiones/README.md) → |

[↑ Semana 10](../../README.md)
