# Lab 02 — Depurar diagramas rotos

⏱ Duración estimada: ~60 min

## Objetivo

Diagnosticar y arreglar cuatro `.puml` rotos leyendo los mensajes de PlantUML.

## Contexto

- `plantuml` sale con `0` si todo renderiza, `100` si no encontró ningún diagrama y `200` si al menos uno tiene error.
- `plantuml -syntax` numera las líneas **desde 0**; `plantuml -tsvg` las numera **desde 1**. El editor también empieza en 1.
- Los cuatro archivos de `starter/` están rotos a propósito.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-01-fundamentos_uml_y_plantuml/2-practicas/lab-02-depurar-diagramas-rotos
   ```

1. Renderiza `roto-1.puml`:

   ```bash
   plantuml -tsvg starter/roto-1.puml; echo $?
   ```

   Output:

   ```
   Warning: no image in starter/roto-1.puml
   No diagram found
   100
   ```

   `No diagram found`: PlantUML no encontró un bloque `@startuml` ... `@enduml` completo. Abre el archivo: falta `@enduml` al final. Añádelo y repite:

   ```bash
   plantuml -tsvg starter/roto-1.puml; echo $?
   ```

   Output: `0`.

2. Renderiza `roto-2.puml`:

   ```bash
   plantuml -tsvg starter/roto-2.puml; echo $?
   ```

   Output:

   ```
   Error line 5 in file: starter/roto-2.puml
   Some diagram description contains errors
   200
   ```

   La línea 5 es `class Product {`. El error no está en esa línea sino en que el bloque que abre nunca se cierra: falta `}` después de `- price: Decimal`. Mira qué cree PlantUML que es el archivo:

   ```bash
   plantuml -syntax < starter/roto-2.puml
   ```

   Output:

   ```
   ERROR
   4
   Syntax Error? (Assumed diagram type: sequence)
   ```

   El `4` es la misma línea 5, contada desde 0. Añade la `}` en su propia línea tras `- price: Decimal` y repite el `plantuml -tsvg`: sale `0`.

3. Renderiza `roto-3.puml`:

   ```bash
   plantuml -tsvg starter/roto-3.puml; echo $?
   ```

   Output:

   ```
   Error line 10 in file: starter/roto-3.puml
   Some diagram description contains errors
   200
   ```

   Línea 10: `Screening -- Room is held in`. El nombre de una asociación va después de ` : `. Corrígela:

   ```plantuml
   Screening -- Room : is held in
   ```

   Repite: sale `0`.

4. Renderiza `roto-4.puml`:

   ```bash
   plantuml -tsvg starter/roto-4.puml; echo $?
   plantuml -syntax < starter/roto-4.puml
   ```

   Output:

   ```
   Error line 9 in file: starter/roto-4.puml
   Some diagram description contains errors
   200
   ERROR
   8
   Use 'allowmixing' if you want to mix classes and other UML elements. (Assumed diagram type: class)
   ```

   El archivo empieza como diagrama de clases y en la línea 9 declara un `actor` y un mensaje `->` de secuencia. PlantUML sugiere `allowmixing`, pero eso solo tapa el problema: **un diagrama responde una pregunta**. Sepáralo en dos archivos:

   - Deja en `roto-4.puml` solo la parte de clases (`Ticket`, `Seat` y su asociación).
   - Crea `starter/compra-secuencia.puml` con la parte de secuencia:

   ```plantuml
   @startuml
   title Cine — compra de entrada
   actor Customer
   participant Ticket
   Customer -> Ticket : buy()
   @enduml
   ```

   Comprueba los dos:

   ```bash
   plantuml -syntax < starter/roto-4.puml
   plantuml -syntax < starter/compra-secuencia.puml
   ```

   Output:

   ```
   CLASS
   (2 entities)
   SEQUENCE
   (2 participants)
   ```

5. Comprueba los cinco archivos a la vez:

   ```bash
   plantuml -checkonly starter/*.puml; echo $?
   ```

   Output: `0`.

## Criterios de éxito

- [ ] `plantuml -checkonly starter/*.puml; echo $?` imprime `0`
- [ ] `roto-4.puml` es `CLASS` y `compra-secuencia.puml` es `SEQUENCE` según `plantuml -syntax`
- [ ] Sabes explicar por qué el error de `roto-2.puml` se reporta en la línea 5 y no donde falta la llave

## Reto extra

Rompe tú `hola.puml` del lab 01 de tres maneras distintas (borra `@startuml`, escribe `clas` en vez de `class`, quita el `:` de una asociación) y anota qué mensaje y qué código de salida da cada una.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 01 — Laboratorio PlantUML](../lab-01-laboratorio-plantuml/README.md) | [Lab 03 — Elegir el diagrama](../lab-03-elegir-el-diagrama/README.md) → |

[↑ Semana 01](../../README.md)
