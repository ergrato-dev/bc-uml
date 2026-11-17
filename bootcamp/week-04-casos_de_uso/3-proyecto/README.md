# Proyecto Semana 04 — Casos de uso de tu dominio

⏱ Duración estimada: 3 h

## Objetivo

Dibujar el diagrama de casos de uso de tu dominio y especificar por escrito sus tres casos más importantes, trazados hacia el diagrama de clases.

## Antes de empezar

- Partes de tu entrega de la semana 03. El paso 0 la copia aquí.
- Trabajas sobre `3-proyecto/starter/`: es lo que corrige el autograding.
- Los actores salen de la sección `## Actores` de tu `README.md`. Si descubres uno nuevo, añádelo allí también.

## Qué comprueba el autograding

| Comprobación | Paso |
|---|---|
| 02-clases.puml y 03-objetos.puml de la semana 03 siguen en el modelo y renderizan | 0 |
| 04-casos-de-uso.puml renderiza sin errores | 1 |
| 04-casos-de-uso.puml es un diagrama de casos de uso con title | 1 |
| El límite del sistema es un rectangle con nombre | 2 |
| Al menos 3 actores | 3 |
| Al menos 6 casos de uso declarados con usecase y alias CUNN | 4 |
| Hay al menos un <<include>> | 5 |
| Hay al menos un <<extend>> | 6 |
| Todo <<include>> y <<extend>> usa flecha discontinua (..>) | 5 y 6 |
| Al menos 3 especificaciones casos-de-uso/CU-NN.md | 8 |
| Cada CU-NN.md tiene Actor principal, Precondiciones, Flujo principal, Flujos alternativos y Postcondiciones | 8 |
| Cada CU-NN.md corresponde a un caso de uso con alias CUNN en el diagrama | 8 |
| Cada CU-NN.md tiene al menos 4 pasos numerados en el flujo principal | 9 |
| Cada CU-NN.md tiene al menos un flujo alternativo que parte de un paso (3a.) | 10 |
| README.md enlaza diagramas/04-casos-de-uso.puml y casos-de-uso/ | 11 |
| 04-casos-de-uso.puml y las especificaciones no tienen TODO pendientes | 12 |

## Paso a paso

0. Desde la raíz del repositorio, copia tu modelo de la semana 03 al starter de esta semana (`-n` no sobrescribe nada):

   ```bash
   cp -rn bootcamp/week-03-relaciones_y_diagrama_de_objetos/3-proyecto/starter/. bootcamp/week-04-casos_de_uso/3-proyecto/starter/
   ls bootcamp/week-04-casos_de_uso/3-proyecto/starter/diagramas
   ```

   Output:

   ```
   01-modelo-conceptual.puml  02-clases.puml  03-objetos.puml  04-casos-de-uso.puml
   ```

   Comprueba el punto de partida:

   ```bash
   ./scripts/verificar-semana.sh 04
   ```

   Output (resumen): `3/16 comprobaciones superadas.` (con tu semana 03 copiada).

1. Abre el contenedor y entra en el proyecto:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-04-casos_de_uso/3-proyecto/starter
   ```

   En `diagramas/04-casos-de-uso.puml`, cambia el `title` por `<Tu sistema> — casos de uso` y renderiza:

   ```bash
   plantuml -tsvg diagramas/04-casos-de-uso.puml; plantuml -syntax < diagramas/04-casos-de-uso.puml
   ```

   Output: `CLASS` y `(0 entities)`. Sin actores ni casos, PlantUML todavía no sabe qué tipo de diagrama es; en cuanto declares el primer actor imprimirá `DESCRIPTION`.

2. **Límite (TODO 2, primera parte).** Escribe el `rectangle "<Nombre> System" { }` vacío. Todo caso de uso irá dentro; ningún actor.

3. **TODO 1: actores.** Al menos 3, con el nombre de rol en inglés de tu `README.md`. Los sistemas externos, con `<<system>>`. Si un caso se dispara por tiempo, `actor Clock`.

4. **TODO 2: casos de uso.** Para cada actor pregunta "¿qué quiere conseguir?". Al menos 6, verbo + objeto, pasados por la prueba del nivel, con alias consecutivos:

   ```plantuml
   usecase "Borrow book" as CU01
   ```

   La restricción propia de tu dominio tiene que aparecer en algún caso. **TODO 3:** asocia cada caso con su actor principal (a la izquierda: `Actor -- CU01`) y sus secundarios (a la derecha: `CU01 -- Actor`). Cuenta:

   ```bash
   grep -cE '^[[:space:]]*usecase[[:space:]]+"[^"]+"[[:space:]]+as[[:space:]]+CU[0-9][0-9]' diagramas/04-casos-de-uso.puml
   ```

   Output: `6` o más.

5. **TODO 4: include.** Busca un paso obligatorio que repiten dos casos o más (identificar a alguien, elegir algo) y sácalo a un caso incluido: `CU01 ..> CU07 : <<include>>`. Explícalo con un comentario `'`.

6. **TODO 5: extend.** Busca un comportamiento que solo ocurre a veces y que el caso base no necesita. Declara el punto de extensión en el óvalo del caso base, dibuja `CUxx ..> CUyy : <<extend>>` desde la extensión y añade la nota con `condition:` y `extension point:`. Comprueba que las dos relaciones son discontinuas (no debe listar nada):

   ```bash
   grep -E '<<(include|extend)>>' diagramas/04-casos-de-uso.puml | grep -vE '[.]+>'; echo $?
   ```

   Output: `1`.

7. Renderiza y revisa el SVG:

   ```bash
   plantuml -tsvg diagramas/04-casos-de-uso.puml; echo $?
   ```

   Output: `0`. Comprueba en `diagramas/04-casos-de-uso.svg` que los actores están fuera, que no hay flechas entre casos salvo include y extend, y que ningún caso queda sin actor (salvo los incluidos).

8. **Especificaciones.** Elige los 3 casos más importantes (el que contiene la restricción de tu dominio tiene que estar). Para cada uno, copia la plantilla con el número de su alias:

   ```bash
   cp casos-de-uso/plantilla.md casos-de-uso/CU-02.md
   ```

   `CU-02.md` corresponde a `as CU02` en el diagrama. Rellena actor principal, secundarios, precondiciones, disparador y postcondiciones.

9. **Flujo principal.** Entre 4 y 9 pasos numerados, un sujeto por paso, alternando actor y sistema, sin interfaz. Nombra clases, atributos y estados de tu `02-clases.puml` entre comillas invertidas. Un include aparece como paso: `(include CU-07)`.

10. **Flujos alternativos.** Al menos uno por especificación, con número de paso y letra (`3a.`), y cómo termina. Las reglas de tu dominio que pueden fallar van aquí; un extend aparece como flujo alternativo en el paso de su punto de extensión.

    Comprueba que no quedan marcadores de la plantilla:

    ```bash
    grep -c '<' casos-de-uso/CU-*.md
    ```

    Output: `0` en cada archivo (salvo si usaste `<` en el texto a propósito).

11. **Índice.** En el `README.md` del modelo, añade a `## Diagramas`:

    ```markdown
    - [04 — Casos de uso](diagramas/04-casos-de-uso.puml)
    - Especificaciones: [CU-02](casos-de-uso/CU-02.md), [CU-04](casos-de-uso/CU-04.md), [CU-05](casos-de-uso/CU-05.md)
    ```

    con tus números. Si apareció algún actor nuevo, añádelo a `## Actores`.

12. Borra los comentarios de los TODO y sal del contenedor:

    ```bash
    grep -c TODO diagramas/04-casos-de-uso.puml
    exit
    ```

    Output: `0`.

13. Desde la raíz del repositorio:

    ```bash
    ./scripts/verificar-semana.sh 04
    ```

    Output (última línea):

    ```
    16/16 comprobaciones superadas.
    ```

## Calidad (40 pts, la revisa el instructor)

- Actores como roles y casos de uso en nivel de objetivo, con verbo + objeto del dominio.
- Include y extend justificados y en la dirección correcta; ninguno puesto solo para pasar el autograding.
- Especificaciones con un sujeto por paso, sin interfaz, con flujos alternativos que terminan.
- Trazabilidad: los nombres del modelo que usan las especificaciones existen en `02-clases.puml`, y la restricción del dominio aparece como paso o flujo alternativo.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 06 — Depurar casos de uso rotos](../2-practicas/lab-06-depurar-casos-de-uso-rotos/README.md) | [Rúbrica de evaluación](../rubrica-evaluacion.md) → |

[↑ Semana 04](../README.md)
