# Lab 06 — Depurar un modelo roto

⏱ Duración estimada: ~60 min

## Objetivo

Dejar coherente el modelo completo de un cine que tiene 9 errores repartidos entre sintaxis, contradicciones entre vistas, trazabilidad e índice, decidiendo en cada uno qué archivo dice la verdad.

## Contexto

- `starter/modelo/` es un modelo pequeño con la estructura del proyecto: `README.md`, `trazabilidad.md` y cinco diagramas en `diagramas/`. Dos diagramas no renderizan a propósito.
- `starter/revisar.sh` junta las comprobaciones de los labs 01 a 03 y las del índice. Léelo antes de usarlo: son los mismos `grep` y `comm`.
- Especificación, del `README.md` del modelo: el cliente compra y devuelve entradas, y el acomodador las valida en la puerta. No hay valoraciones ni vales.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-10-proyecto_integrador/2-practicas/lab-06-depurar-modelo-roto
   ```

1. Pasa la revisión completa:

   ```bash
   bash starter/revisar.sh
   ```

   Output:

   ```
   == 1. Renderizan
   no renderiza: diagramas/clases.puml
   no renderiza: diagramas/secuencia-comprar-entrada.puml
   == 2. Coherencia con clases.puml
   objetos de clases que no existen: Tiket
   mensajes que no son operaciones: seatsLeft
   eventos que no son operaciones de Ticket: use
   estados sin literal en TicketStatus: REFUNDED
   == 3. Trazabilidad
   filas sin caso de uso: 04
   clases de la matriz que no existen: Movie Voucher
   == 4. Índice del README
   el README no enlaza diagramas/objetos.puml
   ```

   Las comprobaciones de coherencia funcionan aunque `clases.puml` no renderice: leen el texto. Aun así, arregla primero la sintaxis: si un diagrama no renderiza, no puedes mirar el SVG para decidir el resto.

### Parte A: sintaxis

2. **Error 1.** Renderiza el diagrama de clases para ver la línea:

   ```bash
   plantuml -tsvg starter/modelo/diagramas/clases.puml; echo $?
   ```

   Output:

   ```
   Error line 26 in file: starter/modelo/diagramas/clases.puml
   Some diagram description contains errors
   200
   ```

   Abre la línea 26 y arréglala. Repite el comando hasta que salga `0`.

3. **Error 2.** Lo mismo con la secuencia:

   ```bash
   plantuml -tsvg starter/modelo/diagramas/secuencia-comprar-entrada.puml; echo $?
   ```

   Output:

   ```
   Error line 10 in file: starter/modelo/diagramas/secuencia-comprar-entrada.puml
   Some diagram description contains errors
   200
   ```

   En una secuencia, los mensajes síncronos son `->`. Repite hasta que salga `0`.

### Parte B: coherencia entre vistas

En cada error, decide qué archivo tiene razón antes de tocar nada. Lee la especificación y abre los SVG.

4. **Error 3 — `Tiket`.** El diagrama de objetos usa una clase que no existe. Es una errata: corrige `objetos.puml`.

5. **Error 4 — `seatsLeft`.** La secuencia pide los asientos libres con una operación que `Screening` no tiene, pero tiene otra que hace exactamente eso. Corrige el mensaje.

6. **Error 5 — `use`.** El acomodador valida la entrada en la puerta. `Ticket` ya tiene la operación con la que se valida. Corrige el evento en `estados-ticket.puml`.

7. **Error 6 — `REFUNDED`.** Aquí la máquina de estados tiene razón: la especificación dice que las entradas se devuelven, y `refund()` existe. Añade el literal que falta a `TicketStatus`.

   Repite la revisión. La sección 2 sale vacía:

   ```
   == 2. Coherencia con clases.puml
   == 3. Trazabilidad
   ```

### Parte C: trazabilidad e índice

8. **Error 7 — fila CU-04.** `Rate movie` no está en el diagrama de casos de uso y la especificación dice que no hay valoraciones. Borra la fila de `trazabilidad.md`. `Movie` desaparece con ella.

9. **Error 8 — `Voucher`.** `refund()` devuelve `void`: el cine devuelve el dinero, no da vales. Quita `Voucher` de la fila CU-02.

10. **Error 9 — el índice.** Añade a `## Diagramas` del `README.md` del modelo el enlace que falta, antes de `Estados de Ticket`:

    ```markdown
    - [Objetos: la entrada de Ana](diagramas/objetos.puml)
    ```

11. Comprueba el modelo entero:

    ```bash
    bash starter/revisar.sh
    plantuml -checkonly starter/modelo/diagramas/*.puml; echo $?
    for f in starter/modelo/diagramas/*.puml; do plantuml -syntax < $f | tr '\n' ' '; echo; done
    ```

    Output:

    ```
    == 1. Renderizan
    == 2. Coherencia con clases.puml
    == 3. Trazabilidad
    == 4. Índice del README
    0
    DESCRIPTION (5 entities)
    CLASS (4 entities)
    STATE (5 entities)
    CLASS (3 entities)
    SEQUENCE (3 participants)
    ```

    Cuatro secciones vacías. Abre `estados-ticket.svg` y `clases.svg`: el evento y el literal nuevos están en los dos.

12. Crea `preguntas.md`. Para cada uno de los 9 errores, una línea: qué archivo corregiste y por qué ese y no el otro. Termina con una línea sobre el error que `revisar.sh` no puede encontrar: mira las filas de `trazabilidad.md` y cuenta cuántos diagramas enlaza cada una.

## Criterios de éxito

- [ ] `bash starter/revisar.sh` imprime las cuatro cabeceras y nada más
- [ ] `plantuml -checkonly starter/modelo/diagramas/*.puml` sale con `0`
- [ ] Los conteos de `-syntax` coinciden con los del paso 11
- [ ] `preguntas.md` justifica los 9 errores, uno por línea

## Reto extra

Añade a `revisar.sh` una sección 5 que avise de las filas de `trazabilidad.md` con un solo diagrama. Pruébala: en este modelo salen las tres filas. ¿Qué diagrama añadirías primero?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 05 — Defensa de decisiones](../lab-05-defensa-de-decisiones/README.md) | [Proyecto — Modelo completo y defensa](../../3-proyecto/README.md) → |

[↑ Semana 10](../../README.md)
