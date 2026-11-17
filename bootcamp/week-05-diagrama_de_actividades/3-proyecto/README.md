# Proyecto Semana 05 — Actividad del proceso núcleo

⏱ Duración estimada: 3 h

## Objetivo

Modelar con un diagrama de actividad el proceso núcleo de tu dominio, con particiones por responsable, decisiones, paralelo, objetos y señales, trazado hacia tus casos de uso y tu diagrama de clases.

## Antes de empezar

- Partes de tu entrega de la semana 04. El paso 0 la copia aquí.
- Trabajas sobre `3-proyecto/starter/`: es lo que corrige el autograding.
- El **proceso núcleo** es el que justifica que el sistema exista: el que recorre el caso de uso con la restricción de tu dominio. Suele cruzar dos o tres casos de uso y tres o más responsables.

## Qué comprueba el autograding

| Comprobación | Paso |
|---|---|
| 02-clases.puml, 03-objetos.puml y 04-casos-de-uso.puml siguen en el modelo y renderizan | 0 |
| Hay exactamente un diagrama 05-actividad-<proceso>.puml con el proceso en kebab-case | 1 |
| El diagrama de actividad renderiza sin errores | 1 |
| Es un diagrama de actividad con title | 1 |
| Un solo nodo inicial (start) y al menos un final de actividad (stop) | 2 |
| Al menos 3 particiones distintas | 3 |
| Al menos 8 acciones | 4 |
| Al menos 2 decisiones | 5 |
| Toda salida de una decisión lleva guarda entre corchetes | 5 |
| Hay al menos un fork con su join (fork, fork again, end fork) | 6 |
| Al menos un nodo de objeto | 7 |
| Cada nodo de objeto es una clase de 02-clases.puml | 7 |
| Al menos una señal o evento (sendSignal, acceptEvent o timeEvent) | 8 |
| El diagrama cita al menos un caso de uso y todo CU citado existe en 04-casos-de-uso.puml | 9 |
| El README.md del modelo enlaza el diagrama de actividad | 10 |
| No quedan TODO en el diagrama de actividad | 10 |

## Paso a paso

0. Desde la raíz del repositorio, copia tu modelo de la semana 04 al starter de esta semana (`-n` no sobrescribe nada):

   ```bash
   cp -rn bootcamp/week-04-casos_de_uso/3-proyecto/starter/. bootcamp/week-05-diagrama_de_actividades/3-proyecto/starter/
   ls bootcamp/week-05-diagrama_de_actividades/3-proyecto/starter/diagramas
   ```

   Output:

   ```
   01-modelo-conceptual.puml  02-clases.puml  03-objetos.puml  04-casos-de-uso.puml  05-actividad-PROCESO.puml
   ```

   Comprueba el punto de partida:

   ```bash
   ./scripts/verificar-semana.sh 05
   ```

   Output (resumen): `5/16 comprobaciones superadas.` (con tu semana 04 copiada).

1. **TODO 1: nombre y título.** Elige el proceso y ponle un nombre corto en kebab-case, en español como el resto de archivos (`atender-pedido`, `prestar-libro`). Renombra el archivo:

   ```bash
   mv bootcamp/week-05-diagrama_de_actividades/3-proyecto/starter/diagramas/05-actividad-PROCESO.puml bootcamp/week-05-diagrama_de_actividades/3-proyecto/starter/diagramas/05-actividad-prestar-libro.puml
   ```

   (con el nombre de tu proceso). Abre el contenedor y entra en el proyecto:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-05-diagrama_de_actividades/3-proyecto/starter
   ```

   Cambia el `title` por `<Tu sistema> — <proceso> (CUxx)`, con el alias del caso de uso principal que recorre (`CU04`). Renderiza:

   ```bash
   plantuml -tsvg diagramas/05-actividad-*.puml; plantuml -syntax < diagramas/05-actividad-*.puml
   ```

   Output:

   ```
   ACTIVITY
   activity3
   ```

2. **Inicio y fin.** Abre `casos-de-uso/CU-NN.md` del caso principal. El disparador es lo que pasa justo después de `start`; las postcondiciones, lo que es verdad al llegar a `stop`. Deja un solo `start`. Cada flujo alternativo que termina el caso acabará en su propio `stop`.

3. **TODO 2: particiones.** Una por responsable: los actores de `04-casos-de-uso.puml` que intervienen, tu sistema (`<Nombre> System`) para lo que hace solo y, si hace falta, un área interna. Ninguna pieza técnica. Al menos 3, declaradas en orden antes de `start` y volviendo a la primera:

   ```plantuml
   |Librarian|
   |Library System|
   |Member|
   |Librarian|
   start
   ```

   Cuenta:

   ```bash
   grep -E '^[[:space:]]*[|][^|]+[|][[:space:]]*$' diagramas/05-actividad-*.puml | sed -E 's/[[:space:]]//g' | sort -u | wc -l
   ```

   Output: `3` o más.

4. **TODO 3: acciones.** Sustituye `:First action;` por los pasos del flujo principal de tus especificaciones, cada uno en la partición de quien lo hace. Un paso de la especificación puede ser una acción o varias; nunca una pantalla. Si el proceso usa un caso incluido, cita su alias en la acción: `:Identify member (CU03);`. Cuenta:

   ```bash
   grep -cE '^[[:space:]]*:[^;]+;[[:space:]]*$' diagramas/05-actividad-*.puml
   ```

   Output: `8` o más.

5. **TODO 4: decisiones.** Cada flujo alternativo de tus `CU-NN.md` (`3a.`, `4a.`) es una decisión en el paso que lo origina. Al menos 2, con guardas entre corchetes, excluyentes y exhaustivas. La restricción de tu dominio tiene que verse como decisión. Comprueba que ninguna guarda va sin corchetes (no debe listar nada):

   ```bash
   grep -nE '(then|else)[[:space:]]*[(][^[]' diagramas/05-actividad-*.puml; echo $?
   ```

   Output: `1`.

6. **TODO 5: fork.** Busca dos tareas que no dependen una de otra (avisar y registrar, cobrar y preparar) y ponlas en ramas paralelas con `fork`, `fork again` y `end fork`. Si una rama no tiene que terminar antes de seguir, ciérrala con `end`. Renderiza y comprueba en el SVG las dos barras.

7. **TODO 6: nodos de objeto.** Donde una clase de tu `02-clases.puml` cambia de estado o pasa de un responsable a otro, añade su nodo de objeto con el estado de su enumeración:

   ```plantuml
   :Loan [ACTIVE]; <<object>>
   ```

   Comprueba que cada uno es una clase del modelo (no debe listar nada más que `fin`):

   ```bash
   for n in $(grep '<<object>>' diagramas/05-actividad-*.puml | grep -oE '^[[:space:]]*:[A-Z][A-Za-z0-9]*' | tr -d ' :' | sort -u); do grep -qE "(class|enum)[[:space:]]+$n([^A-Za-z0-9]|$)" diagramas/02-clases.puml || echo "falta $n"; done; echo fin
   ```

   Output: `fin`. Si sale `falta X`, o `X` no es una clase o falta en el modelo: corrige el que esté mal y anótalo.

8. **TODO 7: señal o evento.** ¿El proceso avisa a alguien sin esperar respuesta (`<<sendSignal>>`), espera algo de fuera (`<<acceptEvent>>`) o espera un plazo (`<<timeEvent>>`)? Al menos uno.

9. **Trazabilidad con los casos de uso.** Todo alias `CUnn` que aparece en el diagrama (título, acciones) tiene que existir en `04-casos-de-uso.puml`:

   ```bash
   grep -ohE 'CU-?[0-9]{2}' diagramas/05-actividad-*.puml | sort -u
   ```

   Output: los alias que citas, por ejemplo `CU03` y `CU04`. Búscalos en el diagrama de casos de uso.

10. **README e índice.** En la sección `## Diagramas` de `README.md`, añade el enlace:

    ```markdown
    - [05 — Actividad: prestar un libro](diagramas/05-actividad-prestar-libro.puml)
    ```

    Borra los comentarios de los TODO del diagrama. Comprueba que no queda ninguno (no debe listar nada):

    ```bash
    grep -n TODO diagramas/05-actividad-*.puml; echo $?
    ```

    Output: `1`.

11. Sal del contenedor (`exit`) y, desde la raíz del repositorio:

    ```bash
    ./scripts/verificar-semana.sh 05
    ```

    Output (resumen): `16/16 comprobaciones superadas.`

## Entrega

- [ ] `./scripts/verificar-semana.sh 05` pasa las 16 comprobaciones
- [ ] El proceso es el núcleo de tu dominio y su restricción aparece como decisión
- [ ] Cada acción está en la partición de quien la hace
- [ ] Los comentarios `'` explican por qué algo va en paralelo y de dónde sale cada decisión

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 06 — Depurar actividades rotas](../2-practicas/lab-06-depurar-actividades-rotas/README.md) | [Rúbrica de evaluación](../rubrica-evaluacion.md) → |

[↑ Semana 05](../README.md)
