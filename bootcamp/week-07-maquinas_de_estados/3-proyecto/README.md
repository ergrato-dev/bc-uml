# Proyecto Semana 07 — Máquina de estados de una entidad

⏱ Duración estimada: 3 h

## Objetivo

Modelar con una máquina de estados el ciclo de vida de la entidad principal de tu dominio, con estados que coinciden con su enumeración de estado, eventos que son operaciones de su clase, actividades internas, un estado compuesto y un pseudoestado.

## Antes de empezar

- Partes de tu entrega de la semana 06. El paso 0 la copia aquí.
- Trabajas sobre `3-proyecto/starter/`: es lo que corrige el autograding.
- Elige **una clase con ciclo de vida**: la que pasa por etapas y se comporta distinto en cada una. Suele ser el objeto que nace en tu secuencia de la semana 06 (una reserva, un pedido, una cita). Si en tu `02-clases.puml` no tiene un atributo de estado con su enumeración, lo añadirás en el paso 2.

## Qué comprueba el autograding

| Comprobación | Paso |
|---|---|
| Los diagramas de clases, casos de uso, actividad, secuencia y comunicación siguen en el modelo y renderizan | 0 |
| Hay exactamente un diagrama 07-estados-<entidad>.puml con la entidad en kebab-case | 1 |
| La máquina de estados renderiza sin errores | 1 |
| Es un diagrama de estados con title | 1 |
| El title nombra la clase cuyo ciclo de vida modela y esa clase está en 02-clases.puml | 1 |
| Hay un estado inicial ([*] -->) y al menos un estado final (--> [*]) | 2 |
| Al menos 5 estados con nombre en las transiciones (sin contar pseudoestados) | 2 |
| Al menos 3 estados se llaman como un literal de una enumeración de 02-clases.puml (Scheduled = SCHEDULED) | 2 |
| Al menos 6 transiciones con evento en la etiqueta | 3 |
| Al menos 3 eventos distintos son operaciones de la clase en 02-clases.puml | 3 |
| Al menos una transición con guarda entre corchetes | 4 |
| Ninguna etiqueta pone la guarda antes del evento: el orden es evento [guarda] / acción | 4 |
| Al menos una transición con acción (/ acción) | 4 |
| Al menos 2 actividades internas entry, exit o do | 5 |
| Hay un estado compuesto (state X { ... }) con su propio estado inicial | 6 |
| Hay al menos un pseudoestado de choice, historia, fork o join | 7 |
| El README.md del modelo enlaza la máquina de estados | 8 |
| No quedan TODO en la máquina de estados | 8 |

## Paso a paso

0. Desde la raíz del repositorio, copia tu modelo de la semana 06 al starter de esta semana (`-n` no sobrescribe nada):

   ```bash
   cp -rn bootcamp/week-06-secuencia_y_comunicacion/3-proyecto/starter/. bootcamp/week-07-maquinas_de_estados/3-proyecto/starter/
   ls bootcamp/week-07-maquinas_de_estados/3-proyecto/starter/diagramas
   ```

   Output (con los nombres de tu proceso y tu caso de uso):

   ```
   01-modelo-conceptual.puml  04-casos-de-uso.puml             06-comunicacion-prestar-libro.puml  07-estados-ENTIDAD.puml
   02-clases.puml             05-actividad-prestar-libro.puml  06-secuencia-prestar-libro.puml
   03-objetos.puml
   ```

   Comprueba el punto de partida:

   ```bash
   ./scripts/verificar-semana.sh 07
   ```

   Output (resumen): `4/18 comprobaciones superadas.` (con tu semana 06 copiada).

1. **TODO 1: nombre y título.** Ponle a la entidad un nombre corto en kebab-case, en español como el resto de archivos (`prestamo`, `cita`, `pedido`). Renombra el archivo:

   ```bash
   mv bootcamp/week-07-maquinas_de_estados/3-proyecto/starter/diagramas/07-estados-ENTIDAD.puml bootcamp/week-07-maquinas_de_estados/3-proyecto/starter/diagramas/07-estados-prestamo.puml
   ```

   (con el nombre de tu entidad). Abre el contenedor y entra en el proyecto:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-07-maquinas_de_estados/3-proyecto/starter
   ```

   Cambia el `title` por `<Tu sistema> — ciclo de vida de <Clase>`, con el nombre exacto de la clase en `02-clases.puml` (`Loan`, no `préstamo`). Comprueba:

   ```bash
   plantuml -syntax < diagramas/07-estados-*.puml
   for w in $(grep -hE '^title' diagramas/07-estados-*.puml | grep -oE '[A-Z][A-Za-z0-9]*'); do grep -qE "class[[:space:]]+$w([^A-Za-z0-9]|$)" diagramas/02-clases.puml && echo "clase $w"; done
   ```

   Output:

   ```
   STATE
   (2 entities)
   clase Loan
   ```

   (con tu clase). Si no sale ninguna línea `clase X`, el nombre del `title` no coincide con el de `02-clases.puml`.

2. **TODO 2: estados, inicial y final.** Busca en `02-clases.puml` el atributo de estado de tu clase (`- status: LoanStatus`) y su enumeración. Cada literal es un estado de primer nivel, en PascalCase: `ACTIVE` es `Active`, `CHECKED_IN` es `CheckedIn`. Si tu clase no tiene ese atributo, **añádelo a `02-clases.puml`** con su `enum ... <<enumeration>>` y un comentario `'` que diga que salió de la máquina de estados.

   Sustituye `FirstState` por el estado en que nace el objeto, dibuja al menos 5 estados y lleva los que terminan su vida a `[*]`. Compara estados y literales como en el lab 05 (cambia `LoanStatus` por tu enumeración):

   ```bash
   awk '/^enum LoanStatus/,/^}/' diagramas/02-clases.puml | grep -oE '^[[:space:]]+[A-Z_]+$' | tr -d ' _' | sort > literales.txt
   grep -oE -- '--> [A-Za-z]+' diagramas/07-estados-*.puml | cut -c5- | tr a-z A-Z | sort -u > estados.txt
   comm -3 literales.txt estados.txt; rm -f *.txt
   ```

   Output: idealmente nada. Una línea sin sangría es un literal sin estado; con sangría, un estado sin literal. Cuando hagas los pasos 6 y 7, los subestados y los choice saldrán con sangría: no llevan literal, porque son detalle dentro de un estado que sí lo tiene.

3. **TODO 3: transiciones con evento.** Recorre los casos de uso y la secuencia de la semana 06: cada operación que cambia el estado de tu clase es un evento. Escríbelo con paréntesis (`return()`). Usa `after(...)` o `when(...)` para lo que pasa solo, y un nombre sin paréntesis para una señal que llega de fuera. Comprueba los eventos que no son operaciones de tu clase (cambia `Loan`):

   ```bash
   grep -oE ': [a-z][A-Za-z]*[(]' diagramas/07-estados-*.puml | tr -d ':( ' | grep -vxE 'after|when' | sort -u > eventos.txt
   awk '/^class Loan/,/^}/' diagramas/02-clases.puml | grep -oE '[+] [a-z][A-Za-z]*[(]' | tr -d '+( ' | sort -u > operaciones.txt
   comm -23 eventos.txt operaciones.txt; comm -12 eventos.txt operaciones.txt | wc -l; rm -f *.txt
   ```

   Output: ningún evento antes del número, y un número de `3` o más. Si sale un evento, **añade la operación a la clase** en `02-clases.puml`, con parámetros tipados, tipo de retorno y un comentario `'` que diga que salió de esta máquina.

4. **TODO 4: guardas y acciones.** Donde un evento solo deba cruzar si se cumple algo, añade `[guarda]`. Donde haya que hacer algo al cruzar, `/ acción()`. Siempre en orden `evento [guarda] / acción`. Comprueba (no debe listar nada):

   ```bash
   grep -nE -- '-->[^:]*:[[:space:]]*[[][^]]*[]][[:space:]]*[a-zA-Z]' diagramas/07-estados-*.puml; echo $?
   ```

   Output: `1`.

5. **TODO 5: actividades internas.** ¿Qué hace tu objeto siempre que entra en un estado o sale de él, venga de donde venga? ¿Qué hace mientras está en él? Escríbelo con `Estado : entry / ...`, `Estado : exit / ...` o `Estado : do / ...`. Si una misma acción se repite en todas las transiciones que llegan a un estado o salen de él, es un `entry` o un `exit`.

6. **TODO 6: estado compuesto.** Busca estados de tu máquina que comparten salidas (un `cancel()` desde varios) o un estado que tiene etapas internas. Agrúpalos con `state X { [*] --> ... }` y dibuja las salidas comunes una sola vez desde el borde. Renderiza y revisa en el SVG que cada estado quedó dentro o fuera de las llaves como esperabas.

7. **TODO 7: pseudoestado.** Usa el que pida tu dominio: un `choice` si un evento lleva a estados distintos según una condición, `[H]` si tu compuesto tiene un camino de vuelta que deba recordar el subestado, o `fork`/`join` si tienes regiones concurrentes. Borra los comentarios de los TODO 1 a 7 y renderiza:

   ```bash
   plantuml -checkonly diagramas/07-estados-*.puml; echo $?
   ```

   Output: `0`.

8. **README e índice.** En la sección `## Diagramas` de `README.md`, añade el enlace:

   ```markdown
   - [07 — Estados: ciclo de vida de un préstamo (Loan)](diagramas/07-estados-prestamo.puml)
   ```

   Comprueba que no queda ningún TODO (no debe listar nada):

   ```bash
   grep -n TODO diagramas/07-*.puml; echo $?
   ```

   Output: `1`.

9. Sal del contenedor (`exit`) y, desde la raíz del repositorio:

   ```bash
   ./scripts/verificar-semana.sh 07
   ```

   Output (resumen): `18/18 comprobaciones superadas.`

## Entrega

- [ ] `./scripts/verificar-semana.sh 07` pasa las 18 comprobaciones
- [ ] Los estados de primer nivel son los literales de la enumeración de estado de la clase
- [ ] Cada evento de llamada es una operación de la clase en `02-clases.puml`, con los nombres del dominio
- [ ] Ningún estado que no sea el final queda sin salida, y a todos se llega desde el inicial
- [ ] Los comentarios `'` explican por qué un estado es compuesto, por qué una acción va en `entry` o `exit` y qué se añadió al diagrama de clases

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 06 — Depurar máquinas de estados rotas](../2-practicas/lab-06-depurar-maquinas-rotas/README.md) | [Rúbrica de evaluación](../rubrica-evaluacion.md) → |

[↑ Semana 07](../README.md)
