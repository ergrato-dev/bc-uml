# Lab 05 — Especificación textual

⏱ Duración estimada: ~60 min

## Objetivo

Escribir la especificación completa de `Borrow book`, con flujo principal, flujos alternativos y trazabilidad hacia el diagrama de clases.

## Contexto

- Plantilla y reglas de escritura: [Especificación textual](../../1-teoria/03-especificacion-textual.md).
- `starter/casos-de-uso.puml` y `starter/clases.puml` son de referencia: no los modifiques. `clases.puml` es el modelo de préstamos del lab 05 de la semana 03.
- Las reglas de la biblioteca están en el comentario de `starter/CU-01.md`.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-04-casos_de_uso/2-practicas/lab-05-especificacion-textual
   ```

1. Renderiza los dos diagramas de referencia y ábrelos:

   ```bash
   plantuml -tsvg starter/casos-de-uso.puml starter/clases.puml; echo $?
   ```

   Output: `0`. `Borrow book` (`CU01`) incluye `Identify member`; `Loan` tiene `status: LoanStatus` con `ACTIVE`, `RETURNED` y `OVERDUE`.

2. **Actores y disparador.** En `starter/CU-01.md`: actor principal `Librarian`; actores secundarios, ninguno; disparador, el momento en que empieza (un socio llega al mostrador con un libro).

3. **Precondiciones.** Solo lo que tiene que ser verdad **antes** y el caso no comprueba: el socio está registrado, el ejemplar está en el mostrador. Que no tenga préstamos vencidos **no** es precondición: lo comprueba el caso.

4. **Flujo principal.** Entre 5 y 7 pasos numerados, alternando bibliotecario y sistema. El primero remite al include:

   ```markdown
   1. El bibliotecario identifica al socio (include CU-03).
   2. El bibliotecario escanea el `barcode` del `Copy`.
   ```

   Sigue con las dos comprobaciones de reglas, la creación del `Loan` (con `startDate`, `dueDate` y `status`) y lo que ve el bibliotecario al final. Escribe entre comillas invertidas cada clase, atributo o valor del modelo.

5. **Flujos alternativos.** Uno por regla que puede fallar, colgado del paso que la comprueba:

   ```markdown
   3a. El socio tiene un préstamo `OVERDUE`: el sistema rechaza el préstamo y el caso termina.
   ```

6. **Postcondiciones.** El estado que queda: qué `Loan` existe, en qué estado y con qué `dueDate`.

7. Comprueba la forma:

   ```bash
   grep -cE '^[0-9]+[.] ' starter/CU-01.md
   grep -cE '^[0-9]+[a-z][.] ' starter/CU-01.md
   grep -c TODO starter/CU-01.md
   ```

   Output: `6` (o entre 5 y 7), `2` (o más) y `0`.

8. Comprueba la trazabilidad: todo nombre del modelo que escribiste existe en `clases.puml` (no debe listar nada más que `fin`):

   ```bash
   grep -oE '`[A-Z][A-Za-z]+`' starter/CU-01.md | tr -d '`' | sort -u | while read c; do grep -qw "$c" starter/clases.puml || echo "falta $c"; done; echo fin
   ```

   Output:

   ```
   fin
   ```

   Si sale `falta X`, o el modelo no tiene `X` o lo escribiste distinto. Corrige el texto, no `clases.puml`.

9. Borra el comentario de reglas del principio si quieres: las reglas ya están en los pasos y flujos alternativos.

## Criterios de éxito

- [ ] `CU-01.md` tiene todas las secciones de la plantilla, sin `TODO`
- [ ] Flujo principal de 5 a 7 pasos, con el include en el paso 1 y un sujeto por paso
- [ ] Un flujo alternativo por regla de la biblioteca, cada uno con su final
- [ ] La comprobación del paso 8 imprime solo `fin`

## Reto extra

Escribe `CU-02.md` para `Renew loan`: un préstamo `OVERDUE` no se renueva y un ejemplar reservado por otro socio tampoco. ¿Qué clase o atributo te falta en `clases.puml` para la segunda regla? Anótalo al final del archivo.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 04 — Generalización de actores y casos de uso](../lab-04-generalizacion-de-actores-y-casos/README.md) | [Lab 06 — Depurar casos de uso rotos](../lab-06-depurar-casos-de-uso-rotos/README.md) → |

[↑ Semana 04](../../README.md)
