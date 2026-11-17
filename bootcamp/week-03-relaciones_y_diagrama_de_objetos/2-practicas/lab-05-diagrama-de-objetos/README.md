# Lab 05 — Diagrama de objetos

⏱ Duración estimada: ~60 min

## Objetivo

Dibujar una situación concreta de la biblioteca con objetos, slots y links, y usarla para comprobar las multiplicidades del diagrama de clases.

## Contexto

- `starter/clases.puml` es el modelo de referencia (el del lab 01 con un enum de estado). No lo modifiques.
- Objeto: `object "ana : Member" as ana { name = "Ana Ruiz" }`. Link: `ana -- l1`, sin multiplicidad. Ver [Diagrama de objetos](../../1-teoria/03-diagrama-de-objetos.md).
- Cada link tiene que corresponder a una asociación de `clases.puml`.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-03-relaciones_y_diagrama_de_objetos/2-practicas/lab-05-diagrama-de-objetos
   ```

1. Renderiza los dos diagramas:

   ```bash
   plantuml -tsvg starter/clases.puml starter/objetos.puml; echo $?
   plantuml -syntax < starter/objetos.puml
   ```

   Output:

   ```
   0
   CLASS
   (1 entities)
   ```

   PlantUML trata el diagrama de objetos como una variante del de clases: por eso imprime `CLASS`. Abre los dos SVG lado a lado.

2. **TODO 1**: el libro y su autor:

   ```plantuml
   object "dune : Book" as dune {
     title = "Dune"
   }

   object "herbert : Author" as herbert {
     fullName = "Frank Herbert"
   }
   ```

   No hace falta escribir todos los slots: solo los que importan para esta situación.

3. **TODO 2**: dos ejemplares, `c7` y `c8`, de clase `Copy`, con `barcode = "BC-0007"` y `barcode = "BC-0008"`.

4. **TODO 3**: dos préstamos de Ana, de clase `Loan`:
   - `l1`: `startDate = 2026-11-02`, `dueDate = 2026-11-30`, `status = ACTIVE`
   - `l2`: `startDate = 2026-10-20`, `dueDate = 2026-11-10`, `status = OVERDUE`

   `status` lleva un valor del enum `LoanStatus`, sin comillas: no es un texto cualquiera.

5. **TODO 4**: los links. Para cada uno, busca en `clases.puml` la asociación que lo permite:

   ```plantuml
   ana -- l1
   ana -- l2
   l1 -- c7
   l2 -- c8
   dune -- c7
   dune -- c8
   dune -- herbert
   ```

   ```bash
   grep -cE '^[a-z0-9]+ -- [a-z0-9]+$' starter/objetos.puml
   ```

   Output: `7`.

6. **TODO 5**: añade `luis : Member` con `name = "Luis Mora"` y sin links. En `clases.puml`, el extremo `Loan` de `Member "1" -- "0..*" Loan` es `0..*`: un socio sin préstamos es válido.

7. Rompe el modelo a propósito: añade el link `luis -- l1` y renderiza. PlantUML lo dibuja sin quejarse, pero ahora `l1` tiene dos socios y la multiplicidad dice `"1"`. **PlantUML no comprueba la coherencia entre diagramas: la compruebas tú.** Anota el hallazgo en `coherencia.md` y borra el link.

8. Comprueba:

   ```bash
   plantuml -syntax < starter/objetos.puml
   grep -cE '^[a-z0-9]+ -- [a-z0-9]+$' starter/objetos.puml
   ```

   Output:

   ```
   CLASS
   (8 entities)
   7
   ```

9. Completa `coherencia.md` con una línea por link: `ana -- l1: Member "1" -- "0..*" Loan`. Añade la respuesta a: ¿cuántos préstamos tiene `c7`? ¿Contradice `Loan "0..*" -- "1" Copy`?

10. Borra los TODO y valida:

    ```bash
    grep -c TODO starter/objetos.puml; plantuml -checkonly starter/objetos.puml; echo $?
    ```

    Output: `0` y `0`.

## Criterios de éxito

- [ ] `plantuml -syntax` imprime `(8 entities)` y hay `7` links
- [ ] Cada objeto lleva nombre y clase; `status` usa valores del enum
- [ ] `coherencia.md` asocia cada link con su asociación y describe la violación del paso 7
- [ ] `clases.puml` no se modificó

## Reto extra

Dibuja el estado de la biblioteca un mes después: `l2` ya devuelto (`RETURNED`) y un préstamo nuevo `l3` de Luis sobre `c8`. ¿Desaparece algún objeto? ¿Cambia algún link? Explícalo en `coherencia.md`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 04 — Clase asociación, navegabilidad y dependencia](../lab-04-clase-asociacion-y-dependencia/README.md) | [Lab 06 — Depurar relaciones rotas](../lab-06-depurar-relaciones-rotas/README.md) → |

[↑ Semana 03](../../README.md)
