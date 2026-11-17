# Proyecto Semana 10 — Modelo completo y defensa

⏱ Duración estimada: 3 h, más la defensa

## Objetivo

Cerrar el modelo de tu dominio: dejar coherentes todas sus vistas, trazar cada caso de uso hasta sus clases y diagramas, pasarlo por una revisión por pares y preparar su defensa.

## Antes de empezar

- Partes de tu entrega de la semana 09. El paso 0 la copia aquí.
- Trabajas sobre `3-proyecto/starter/`: es lo que corrige el autograding.
- Esta semana no hay diagrama nuevo. Hay tres archivos nuevos en la raíz del modelo: `trazabilidad.md`, `revision.md` y `defensa.md`.
- Necesitas un compañero **de otro dominio** para el paso 7. Acuerda con él la revisión antes de empezar: cada uno revisa el modelo del otro.
- La defensa es en directo con el instructor: 10 minutos de exposición y preguntas. El autograding solo comprueba que `defensa.md` está completa.

## Qué comprueba el autograding

| Comprobación | Paso |
|---|---|
| El modelo tiene los diagramas de las semanas 01 a 09 y todos renderizan | 0 |
| Cada diagrama del modelo tiene title | 1 |
| Cada clase de 01-modelo-conceptual.puml está en 02-clases.puml | 1 |
| Cada objeto de 03-objetos.puml es instancia de una clase de 02-clases.puml | 1 |
| Cada mensaje síncrono a una lifeline de clase en la secuencia llama a una operación de 02-clases.puml | 2 |
| Cada evento con paréntesis de la máquina de estados es una operación de la clase que modela (sin contar when y after) | 2 |
| Cada clasificador de 02-clases.puml está en algún paquete de 08-paquetes.puml | 3 |
| codigo/ declara exactamente los clasificadores de 02-clases.puml y del patrón, ni uno más ni uno menos | 3 |
| trazabilidad.md tiene una fila por cada caso de uso de 04-casos-de-uso.puml, y ninguna más | 4 |
| Cada fila de trazabilidad.md nombra al menos una clase y todas existen en 02-clases.puml o en el patrón | 5 |
| Cada clasificador de 02-clases.puml aparece en al menos una fila de trazabilidad.md | 5 |
| Cada fila de trazabilidad.md enlaza al menos un diagrama | 6 |
| revision.md nombra al revisor y tiene al menos 5 hallazgos, cada uno con enlace y resolución | 7 |
| defensa.md tiene al menos 5 decisiones, cada una con Diagrama (enlace), Alternativa y Por qué | 9 |
| Cada enlace relativo de README.md, trazabilidad.md, revision.md y defensa.md apunta a un archivo que existe | 10 |
| README.md enlaza cada diagrama de diagramas/ y los archivos trazabilidad.md, revision.md y defensa.md | 10 |
| No queda ningún TODO en el modelo | 10 |

## Paso a paso

0. Desde la raíz del repositorio, copia tu modelo de la semana 09 al starter de esta semana (`-n` no sobrescribe nada):

   ```bash
   cp -rn bootcamp/week-09-de_uml_a_codigo_y_patrones/3-proyecto/starter/. bootcamp/week-10-proyecto_integrador/3-proyecto/starter/
   ls -1 bootcamp/week-10-proyecto_integrador/3-proyecto/starter bootcamp/week-10-proyecto_integrador/3-proyecto/starter/diagramas
   ```

   Output (con los nombres de tu proceso, tu caso de uso, tu entidad y tu patrón):

   ```
   bootcamp/week-10-proyecto_integrador/3-proyecto/starter:
   README.md
   casos-de-uso
   codigo
   defensa.md
   diagramas
   revision.md
   trazabilidad.md

   bootcamp/week-10-proyecto_integrador/3-proyecto/starter/diagramas:
   01-modelo-conceptual.puml
   02-clases.puml
   03-objetos.puml
   04-casos-de-uso.puml
   05-actividad-prestar-libro.puml
   06-comunicacion-prestar-libro.puml
   06-secuencia-prestar-libro.puml
   07-estados-prestamo.puml
   08-componentes.puml
   08-despliegue.puml
   08-paquetes.puml
   09-patron-observer.puml
   ```

   Comprueba el punto de partida:

   ```bash
   ./scripts/verificar-semana.sh 10
   ```

   Output (resumen), con una semana 09 que pasó sus 16 comprobaciones: `9/17 comprobaciones superadas.` Si te salen menos, las que fallan entre la 2 y la 8 son incoherencias que arrastras de semanas anteriores: los pasos 1 a 3 las encuentran.

   Abre el contenedor, entra en el starter y define dos funciones que usan los pasos 1 a 3 (las mismas de los labs 01 y 02):

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-10-proyecto_integrador/3-proyecto/starter
   clases() { grep -oE '^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+' "$@" | awk '{print $NF}' | sort -u; }
   ops() { grep -oE '[+#~-][[:space:]]*[a-z][A-Za-z0-9_]*[(]' "$@" | grep -oE '[a-z][A-Za-z0-9_]*' | sort -u; }
   ```

   Si sales del contenedor, vuelve a definirlas.

1. **Coherencia de la estructura.** Cada diagrama tiene `title`; cada concepto del modelo conceptual y cada clase de un objeto existen en `02-clases.puml`:

   ```bash
   grep -LE '^[[:space:]]*title[[:space:]]' diagramas/*.puml
   comm -23 <(clases diagramas/01-modelo-conceptual.puml) <(clases diagramas/02-clases.puml)
   grep -hE '^[[:space:]]*object[[:space:]]' diagramas/03-objetos.puml | grep -oE ':[[:space:]]*[A-Z][A-Za-z0-9_]*' | grep -oE '[A-Z][A-Za-z0-9_]*' | sort -u | comm -23 - <(clases diagramas/02-clases.puml)
   ```

   Output: `(sin salida)`. Cada nombre que salga es una contradicción: decide qué diagrama tiene razón (teoría, "Qué corregir primero") y apunta lo que cambias, lo usarás en la defensa.

2. **Coherencia del comportamiento.** Los mensajes síncronos a lifelines de clase (`participant ":Clase" as alias`) y los eventos con paréntesis de la máquina de estados. La primera línea junta los alias de las lifelines de clase:

   ```bash
   a=$(grep -hE '^[[:space:]]*participant[[:space:]]+"?:[A-Z]' diagramas/06-secuencia-*.puml | grep -oE 'as[[:space:]]+[A-Za-z0-9_]+[[:space:]]*$' | awk '{print $2}' | paste -sd'|')
   grep -hE "^[[:space:]]*[^[:space:]]+[[:space:]]*->[[:space:]]*($a)[[:space:]]*[+-]*[[:space:]]*:" diagramas/06-secuencia-*.puml | sed -E 's/^[^:]*:[[:space:]]*//' | grep -oE '^[a-z][A-Za-z0-9_]*[(]' | tr -d '(' | sort -u | comm -23 - <(ops diagramas/02-clases.puml)
   grep -oE -- '-+([a-z]+-+)?>[^:]*:[[:space:]]*[a-z][A-Za-z0-9]*[(]' diagramas/07-estados-*.puml | grep -oE '[a-z][A-Za-z0-9]*[(]$' | tr -d '(' | grep -vxE 'when|after' | sort -u | comm -23 - <(ops diagramas/02-clases.puml)
   ```

   Output: `(sin salida)`. Los mensajes a un actor o a lifelines que no son clases del dominio (una pantalla, un servicio) no se comprueban. El autograding es más estricto con los eventos: tienen que ser operaciones **de la clase del title** de la máquina de estados, no de cualquier clase. Si un evento es de una superclase, repite la operación en la clase de la entidad.

3. **Coherencia de la organización.** Cada clasificador de `02-clases.puml` está en un paquete, y `codigo/` tiene exactamente las clases de `02-clases.puml` y del patrón:

   ```bash
   comm -23 <(clases diagramas/02-clases.puml) <(clases diagramas/08-paquetes.puml)
   comm -3 <(clases diagramas/02-clases.puml diagramas/09-patron-*.puml) <(grep -rhoIE --exclude='*.md' '(class|interface|enum|record)[[:space:]]+[A-Z][A-Za-z0-9_]*' codigo | awk '{print $2}' | sort -u)
   ```

   Output: `(sin salida)`. En el segundo, lo que sale sin tabulador falta en el código; con tabulador, sobra en el código. Si cambiaste `02-clases.puml` en los pasos 1 y 2, aquí lo notas: actualiza el paquete y el código.

   Comprueba que todo sigue renderizando:

   ```bash
   plantuml -checkonly diagramas/*.puml; echo $?
   ```

   Output: `0`.

4. **TODO 4: filas de la matriz.** En `trazabilidad.md`, sustituye la fila de ejemplo por una fila por caso de uso de `04-casos-de-uso.puml`. El alias `CU02` se escribe `CU-02`. Compara:

   ```bash
   comm -3 <(grep -oE 'as[[:space:]]+CU[0-9]{2}' diagramas/04-casos-de-uso.puml | grep -oE '[0-9]{2}' | sort -u) <(grep -oE '^[|][[:space:]]*CU-[0-9]{2}' trazabilidad.md | grep -oE '[0-9]{2}' | sort -u)
   ```

   Output: `(sin salida)`. Sin tabulador, filas que faltan; con tabulador, filas de más.

5. **TODO 5: clases de cada fila.** En la columna Clases, entre comillas invertidas, las clases que el caso de uso crea, modifica o consulta. Recorre su `CU-NN.md` o su secuencia. Las clases del patrón también valen. Comprueba las dos direcciones (ver [Trazabilidad](../1-teoria/02-trazabilidad.md)):

   ```bash
   awk -F'|' '$2 ~ /CU-[0-9]/ {print $4}' trazabilidad.md | grep -oE '`[A-Z][A-Za-z0-9_]*`' | tr -d '`' | sort -u > /tmp/usadas
   comm -3 <(clases diagramas/02-clases.puml diagramas/09-patron-*.puml) /tmp/usadas
   ```

   Output: lo que sale sin tabulador son clases sin fila. Las de `02-clases.puml` tienen que tener fila (lab 03: o falta un caso de uso, o la clase sobra); las del patrón pueden quedarse sin ella. Con tabulador, nombres de la matriz que no existen: erratas.

6. **TODO 6: diagramas de cada fila y huecos.** En la columna Diagramas, un enlace a cada diagrama donde se ve el caso de uso, con la ruta `diagramas/<archivo>.puml`, como en el paso 3 del [lab 03](../2-practicas/lab-03-matriz-de-trazabilidad/README.md). Comprueba que ninguna fila se queda sin enlace:

   ```bash
   awk -F'|' '$2 ~ /CU-[0-9]/ && $5 !~ /[(]diagramas[/][^)]+[.]puml[)]/ {print $2}' trazabilidad.md
   ```

   Output: `(sin salida)`. Después, en `## Huecos que deja la matriz`, los casos de uso que solo aparecen en el diagrama de casos de uso y en el de clases, y qué diagrama los cubriría. Borra los comentarios de los TODO 4 a 6.

7. **TODO 7: revisión por pares.** Pasa tu modelo a tu compañero (un `git push` o una copia de la carpeta). Él lo revisa con la lista de la [teoría](../1-teoria/03-revision-y-defensa.md) y te da al menos 5 hallazgos. Escríbelos en `revision.md`: su dominio en `Revisor:`, la fecha y una fila por hallazgo con un enlace en Dónde al diagrama del hallazgo (`diagramas/<archivo>.puml`). Tú haces lo mismo con su modelo.

8. **TODO 8: resolver y aplicar.** Cada resolución empieza por **Corregido**, **Se mantiene** o **Pendiente justificado**. Haz los cambios que marcas como corregidos y repite los pasos 1 a 3: tienen que seguir sin salida. Comprueba la tabla:

   ```bash
   awk -F'|' '$2 ~ /^[[:space:]]*[0-9]+[[:space:]]*$/ {n++; x=$5; gsub(/[[:space:]]/, "", x); if ($3 !~ /[]][(]/ || x == "") print "hallazgo" $2 "sin enlace o sin resolución"} END {print n+0, "hallazgos"}' revision.md
   ```

   Output: el número de hallazgos (5 o más), sin ninguna línea "sin resolución". Borra los comentarios de los TODO 7 y 8.

9. **TODO 9: defensa.** En `defensa.md`:
   - **Guion**: cinco paradas con enlace y minutos entre paréntesis, que sumen 10.
   - **Decisiones**: al menos 5, con las cuatro líneas del lab 05. Busca candidatas en tus comentarios `'`, en los hallazgos que resolviste con "Se mantiene" y en lo que cambiaste en los pasos 1 a 3.

   ```bash
   awk '/^### / {n++} /^- [*][*]Diagrama:[*][*].*[]][(]/ {g++} /^- [*][*]Alternativa:[*][*][[:space:]]*[^[:space:]]/ {a++} /^- [*][*]Por qué:[*][*][[:space:]]*[^[:space:]]/ {p++} END {print n+0, "decisiones,", g+0, "diagramas,", a+0, "alternativas,", p+0, "porqués"}' defensa.md
   grep -oE '[(][0-9]+ min[)]' defensa.md | grep -oE '[0-9]+' | awk '{s+=$1} END {print s+0, "min"}'
   ```

   Output: los cuatro números iguales y 5 o más (`5 decisiones, 5 diagramas, 5 alternativas, 5 porqués`), y `10 min`.

10. **TODO 10: preguntas, índice y cierre.** En `## Preguntas que espero`, dos preguntas con tu respuesta. En la sección `## Diagramas` del `README.md` del modelo, añade:

    ```markdown
    - Trazabilidad: [casos de uso, clases y diagramas](trazabilidad.md)
    - Revisión por pares: [hallazgos y resoluciones](revision.md)
    - Defensa: [guion y decisiones](defensa.md)
    ```

    Comprueba que el README enlaza todos los diagramas, que ningún enlace está roto y que no queda ningún TODO:

    ```bash
    for p in diagramas/*.puml trazabilidad.md revision.md defensa.md; do grep -qF "]($p)" README.md || echo "falta $p"; done
    for f in README.md trazabilidad.md revision.md defensa.md; do for p in $(grep -oE '[]][(][^)#]+' $f | cut -c3- | grep -vE '^[a-z]+:'); do [ -e "$p" ] || echo "$f -> $p"; done; done
    grep -rlI --exclude='*.svg' TODO .
    ```

    Output: `(sin salida)`.

11. Sal del contenedor (`exit`) y, desde la raíz del repositorio:

    ```bash
    ./scripts/verificar-semana.sh 10
    ```

    Output (resumen): `17/17 comprobaciones superadas.`

12. Ensaya la defensa con cronómetro, en voz alta y con los diagramas abiertos en el orden del guion.

## Entrega

- [ ] `./scripts/verificar-semana.sh 10` pasa las 17 comprobaciones
- [ ] Cada fila de la matriz tiene las clases que el caso de uso toca de verdad, no todas
- [ ] Los hallazgos de `revision.md` son de otra persona y los "Corregido" se ven en los diagramas
- [ ] Cada decisión de `defensa.md` tiene un motivo del dominio, no técnico
- [ ] Ensayaste el guion y cabe en 10 minutos

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 06 — Depurar un modelo roto](../2-practicas/lab-06-depurar-modelo-roto/README.md) | [Rúbrica de evaluación](../rubrica-evaluacion.md) → |

[↑ Semana 10](../README.md)
