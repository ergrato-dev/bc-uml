# Lab 01 — Coherencia entre clases y secuencia

⏱ Duración estimada: ~60 min

## Objetivo

Encontrar con `grep` y `comm` las lifelines y los mensajes de una secuencia que no existen en el diagrama de clases, y decidir en cada caso qué vista corregir.

## Contexto

- Reglas y comandos: [Coherencia entre vistas](../../1-teoria/01-coherencia-entre-vistas.md).
- `starter/clases.puml` y `starter/secuencia.puml` describen el préstamo de un libro en una biblioteca. Los dos renderizan, pero se escribieron en semanas distintas y no cuadran.
- Las dos reglas del lab: cada lifeline `":Clase"` es una clase del diagrama, y cada mensaje síncrono (`->`) a una lifeline de clase llama a una operación del diagrama.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-10-proyecto_integrador/2-practicas/lab-01-coherencia-clases-y-secuencia
   ```

1. Renderiza los dos diagramas y ábrelos (`starter/clases.svg` y `starter/secuencia.svg`):

   ```bash
   plantuml -tsvg starter/*.puml; echo $?
   plantuml -syntax < starter/clases.puml
   plantuml -syntax < starter/secuencia.puml
   ```

   Output:

   ```
   0
   CLASS
   (3 entities)
   SEQUENCE
   (5 participants)
   ```

   Tres clases y cinco lifelines (el actor cuenta). Ya se ve que algo sobra en la secuencia.

2. Saca las clases de un diagrama y las lifelines del otro, y compáralas. `comm -13` imprime lo que solo está en la segunda lista:

   ```bash
   grep -oE '^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+' starter/clases.puml | awk '{print $NF}' | sort -u > /tmp/clases
   grep -oE 'participant[[:space:]]+":[A-Z][A-Za-z0-9_]*' starter/secuencia.puml | grep -oE '[A-Z][A-Za-z0-9_]*' | sort -u > /tmp/lifelines
   comm -13 /tmp/clases /tmp/lifelines
   ```

   Output:

   ```
   Catalog
   ```

   La secuencia usa un catálogo que el diagrama de clases no tiene.

3. **TODO 1 — La clase que falta.** El catálogo existe en el dominio: es quien sabe qué ejemplar está libre. Añádelo a `starter/clases.puml`, antes de `class Loan`, con la operación que la secuencia le pide:

   ```plantuml
   class Catalog {
     + findAvailable(isbn: String): Book
   }
   ```

   Y su asociación, al final con las otras:

   ```plantuml
   Catalog "1" --> "0..*" Book : lists >
   ```

   Repite los tres comandos del paso 2: `(sin salida)`. Renderiza y comprueba:

   ```bash
   plantuml -checkonly starter/clases.puml; echo $?
   plantuml -syntax < starter/clases.puml
   ```

   Output:

   ```
   0
   CLASS
   (4 entities)
   ```

4. Ahora los mensajes. Saca las operaciones del diagrama de clases y los mensajes síncronos de la secuencia:

   ```bash
   grep -oE '[+#~-][[:space:]]*[a-z][A-Za-z0-9_]*[(]' starter/clases.puml | grep -oE '[a-z][A-Za-z0-9_]*' | sort -u > /tmp/ops
   grep -E -- '->[[:space:]]*[a-z]+[[:space:]]*:' starter/secuencia.puml | sed -E 's/^[^:]*:[[:space:]]*//' | grep -oE '^[a-z][A-Za-z0-9_]*[(]' | tr -d '(' | sort -u > /tmp/mensajes
   comm -13 /tmp/ops /tmp/mensajes
   ```

   Output:

   ```
   register
   reserve
   ```

   El segundo `grep` se queda con las flechas que llegan a un alias en minúscula (las lifelines de clase) y el `sed` borra todo hasta los dos puntos. El `<<create>>` y las respuestas sin paréntesis no pasan el filtro.

   Si haces el paso 4 antes del TODO 1, también sale `findAvailable`.

5. **TODO 2 — Un despiste en la secuencia.** `Book` ya tiene la operación que hace lo que `reserve()` pretende: `markLoaned()`. Aquí la verdad está en el diagrama de clases. Cambia el mensaje en `starter/secuencia.puml`:

   ```plantuml
   member -> book : markLoaned()
   ```

   Cuidado con el alias. Si escribes `member -> bok : markLoaned()`, PlantUML no da error: crea una lifeline nueva. Lo ves en el conteo:

   ```bash
   plantuml -syntax < starter/secuencia.puml
   ```

   Output con el alias mal escrito:

   ```
   SEQUENCE
   (6 participants)
   ```

6. **TODO 3 — Una operación que descubrió la secuencia.** `register(loan)` no es un despiste: el socio tiene que guardar el préstamo para que `canBorrow()` pueda contar los que tiene. Aquí la verdad está en la secuencia. Añade la operación a `Member`, con un comentario `'` que diga de dónde sale:

   ```plantuml
     ' La secuencia de CU-02 pidió guardar el préstamo en el socio.
     + register(loan: Loan): void
   ```

7. Comprueba las dos reglas y que todo renderiza:

   ```bash
   comm -13 /tmp/clases /tmp/lifelines
   grep -oE '[+#~-][[:space:]]*[a-z][A-Za-z0-9_]*[(]' starter/clases.puml | grep -oE '[a-z][A-Za-z0-9_]*' | sort -u > /tmp/ops
   grep -E -- '->[[:space:]]*[a-z]+[[:space:]]*:' starter/secuencia.puml | sed -E 's/^[^:]*:[[:space:]]*//' | grep -oE '^[a-z][A-Za-z0-9_]*[(]' | tr -d '(' | sort -u > /tmp/mensajes
   comm -13 /tmp/ops /tmp/mensajes
   plantuml -checkonly starter/*.puml; echo $?
   plantuml -syntax < starter/secuencia.puml
   ```

   Output:

   ```
   0
   SEQUENCE
   (5 participants)
   ```

   Los dos `comm` no imprimen nada: cada lifeline es una clase y cada mensaje, una operación. Abre los SVG: `Catalog` aparece en el diagrama de clases con su flecha hacia `Book`.

8. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - En el TODO 2 corregiste la secuencia y en el TODO 3 el diagrama de clases. ¿Qué te hizo decidir en cada caso?
   - `member -> member : canBorrow()` es un mensaje a sí mismo. ¿Lo comprueba el `comm` del paso 4? ¿Por qué?
   - El `comm` solo mira nombres. Escribe un mensaje que pasaría la comprobación y seguiría siendo incoherente con el diagrama de clases.

## Criterios de éxito

- [ ] `plantuml -checkonly starter/*.puml` sale con `0`
- [ ] `clases.puml` tiene `(4 entities)` y `secuencia.puml` sigue con `(5 participants)`
- [ ] El `comm` de lifelines y el de mensajes no imprimen nada
- [ ] `register` está en `Member` con un comentario que dice de dónde sale
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

El `comm` acepta `borrow(isbn)` aunque el mensaje vaya a la lifeline equivocada. Escribe un comando que compruebe que cada mensaje es una operación **de la clase de su lifeline**, no de cualquier clase. Pista: `awk` puede quedarse con las líneas entre `class Book {` y la siguiente `}`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Índice de labs](../README.md) | [Lab 02 — Coherencia entre estados, objetos, paquetes y clases](../lab-02-coherencia-estados-objetos-y-paquetes/README.md) → |

[↑ Semana 10](../../README.md)
