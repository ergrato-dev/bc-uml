# Proyecto Semana 02 — Diagrama de clases de tu dominio

⏱ Duración estimada: 3 h

## Objetivo

Pasar el modelo conceptual de tu dominio a un diagrama de clases en perspectiva de especificación: atributos tipados, operaciones con firma completa, enumeraciones, una clase abstracta y una interfaz.

## Antes de empezar

- Partes de tu entrega de la semana 01 (`README.md` y `diagramas/01-modelo-conceptual.puml`). El paso 0 la copia aquí.
- Trabajas sobre `3-proyecto/starter/`: es lo que corrige el autograding.
- Las relaciones entre clases (asociaciones con multiplicidad, herencia, realización) **no** se dibujan esta semana: llegan en la semana 03. El autograding comprueba que no estén.

## Qué comprueba el autograding

| Comprobación | Paso |
|---|---|
| 01-modelo-conceptual.puml de la semana 01 sigue en el modelo y renderiza | 0 |
| 02-clases.puml renderiza sin errores | 1 |
| 02-clases.puml es un diagrama de clases con title | 1 |
| 02-clases.puml no tiene relaciones todavía (llegan en la semana 03) | 2 |
| 02-clases.puml tiene al menos 8 elementos (clases, enum, abstracta e interfaz) | 2, 6 y 7 |
| Al menos 12 atributos con visibilidad y tipo (- name: Type) | 3 |
| La mayoría de los atributos son privados: al menos 10 con - | 3 |
| Al menos 6 operaciones con visibilidad y tipo de retorno | 4 |
| Al menos 3 operaciones con parámetros tipados (name: Type) | 4 |
| Ninguna operación sin tipo de retorno | 4 |
| Hay al menos un enum <<enumeration>> con 2 o más valores | 6 |
| Hay al menos una clase abstracta | 7 |
| Hay al menos una interfaz <<interface>> con una operación | 7 |
| Al menos un miembro {static} | 8 |
| README.md enlaza diagramas/02-clases.puml | 9 |
| 02-clases.puml no tiene TODO pendientes | 10 |

## Paso a paso

0. Desde la raíz del repositorio, copia tu modelo de la semana 01 al starter de esta semana (`-n` no sobrescribe nada que ya exista):

   ```bash
   cp -rn bootcamp/week-01-fundamentos_uml_y_plantuml/3-proyecto/starter/. bootcamp/week-02-diagrama_de_clases/3-proyecto/starter/
   ls bootcamp/week-02-diagrama_de_clases/3-proyecto/starter/diagramas
   ```

   Output:

   ```
   01-modelo-conceptual.puml  02-clases.puml
   ```

   Comprueba el punto de partida:

   ```bash
   ./scripts/verificar-semana.sh 02
   ```

   Output (resumen): `5/16 comprobaciones superadas.` (con tu semana 01 copiada).

1. **Título.** Abre el contenedor y entra en el proyecto:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-02-diagrama_de_clases/3-proyecto/starter
   ```

   En `diagramas/02-clases.puml`, cambia el `title` por `<Tu sistema> — clases`.

2. **TODO 1: clases.** Copia las líneas `class X` de `01-modelo-conceptual.puml`. **No** copies las asociaciones. Si al pensar los atributos descubres que un concepto era en realidad un valor (una fecha, un estado), quítalo de las clases y anótalo: será un atributo o un enum.

3. **TODO 2: atributos.** Abre cada clase con llaves y dale al menos 2 atributos privados con tipo neutro. Usa enums de tu modelo como tipo donde la lista de valores es cerrada. Comprueba cuántos llevas:

   ```bash
   grep -cE '^[[:space:]]*([{][a-z]+[}][[:space:]]*)?[-+#~][[:space:]]*/?[[:alpha:]_][[:alnum:]_]*[[:space:]]*:[[:space:]]*[[:alpha:]]' diagramas/02-clases.puml
   ```

   Output: `12` o más.

4. **TODO 3: operaciones.** Al menos 6 operaciones públicas, con verbos del dominio, parámetros tipados y tipo de retorno (`void` si no devuelve nada). Sin getters ni setters. Comprueba que ninguna quedó sin retorno (no debe listar nada):

   ```bash
   grep -nE '[-+#~][[:space:]]*[[:alpha:]_][[:alnum:]_]*[(][^)]*[)][[:space:]]*$' diagramas/02-clases.puml; echo $?
   ```

   Output: `1`.

5. Renderiza y revisa el SVG a medio camino:

   ```bash
   plantuml -tsvg diagramas/02-clases.puml; echo $?
   ```

   Output: `0`.

6. **TODO 4: enum.** Al menos un `enum X <<enumeration>>` con 2 o más valores en `UPPER_SNAKE_CASE`. Úsalo como tipo de un atributo. Candidato natural: los estados de la entidad con ciclo de vida de tu dominio.

7. **TODO 5: abstracta e interfaz.** Una `abstract class` que tenga sentido en tu dominio (algo que siempre es de un tipo concreto) y una `interface X <<interface>>` con al menos una operación (algo que varias clases sin parentesco saben hacer). Explica cada decisión con un comentario `'` encima.

   Comprueba el total de elementos:

   ```bash
   plantuml -syntax < diagramas/02-clases.puml
   ```

   Output: `CLASS` y `(N entities)` con N ≥ 8.

8. **TODO 6: estático.** Marca con `{static}` al menos un miembro que sea igual para todos los objetos (un máximo, un valor por defecto, un contador global).

9. **Índice.** En el `README.md` del modelo, añade a `## Diagramas`:

   ```markdown
   - [02 — Clases](diagramas/02-clases.puml)
   ```

   Si el glosario no tiene alguno de los términos nuevos (enums, abstracta, interfaz), añádelo.

10. Borra los comentarios de los TODO y sal del contenedor:

    ```bash
    grep -c TODO diagramas/02-clases.puml
    exit
    ```

    Output: `0`.

11. Desde la raíz del repositorio:

    ```bash
    ./scripts/verificar-semana.sh 02
    ```

    Output (última línea):

    ```
    16/16 comprobaciones superadas.
    ```

## Calidad (40 pts, la revisa el instructor)

- Atributos y operaciones salen de tu dominio y reflejan su restricción (la regla propia aparece como operación o atributo).
- Responsabilidades bien ubicadas: cada operación está en la clase que tiene los datos para cumplirla.
- Enum, abstracta e interfaz justificadas con comentarios `'`; ninguna puesta solo para pasar el autograding.
- Coherencia con la semana 01: las clases nuevas o eliminadas respecto al modelo conceptual están explicadas.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 06 — Revisar un diagrama de clases](../2-practicas/lab-06-revisar-un-diagrama-de-clases/README.md) | [Rúbrica de evaluación](../rubrica-evaluacion.md) → |

[↑ Semana 02](../README.md)
