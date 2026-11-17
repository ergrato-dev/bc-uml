# Lab 03 — Operaciones y firmas completas

⏱ Duración estimada: ~60 min

## Objetivo

Completar la firma de atributos y operaciones: tipos, multiplicidad, atributos derivados, valores iniciales y miembros estáticos.

## Contexto

- Una firma incompleta (`+ confirm()`) obliga a quien lee a adivinar qué recibe y qué devuelve.
- Atributo con multiplicidad: `- seats: String [1..10]`. Derivado: `- /total: Decimal`. Estático: `{static} - holdMinutes: Integer = 10`.
- Ver [Anatomía de una clase](../../1-teoria/01-anatomia-de-una-clase.md).

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-02-diagrama_de_clases/2-practicas/lab-03-operaciones-y-firmas
   ```

1. Mide lo incompleto que está. Atributos sin tipo y operaciones sin retorno:

   ```bash
   grep -cE '^[[:space:]]*[-+#~][[:space:]]*[[:alpha:]]+[[:space:]]*$' starter/reserva.puml
   grep -cE '[(][)][[:space:]]*$' starter/reserva.puml
   ```

   Output: `4` y `4`.

2. **TODO 1**: tipos de los atributos:

   ```plantuml
     - code: String
     - createdAt: DateTime
     - seats: String [1..10]
     - total: Decimal
   ```

   `[1..10]`: una reserva tiene entre 1 y 10 butacas. Sin multiplicidad, se entiende exactamente 1.

3. **TODO 2**: `total` se calcula sumando el precio de cada butaca: márcalo derivado cambiando la línea por `- /total: Decimal`. En el SVG aparece `-/total: Decimal`.

4. **TODO 3**: completa las firmas:

   ```plantuml
     + addSeat(seat: String): void
     + removeSeat(seat: String): void
     + confirm(paidWith: PaymentMethod): Ticket
     + expire(now: DateTime): Boolean
   ```

   `expire` recibe `now` en lugar de leer el reloj: la operación se puede probar con cualquier fecha.

5. **TODO 4**: el tiempo de retención es igual para todas las reservas:

   ```plantuml
     {static} - holdMinutes: Integer = 10
   ```

   Renderiza: aparece subrayado.

6. **TODO 5**: declara el enum fuera de la clase:

   ```plantuml
   enum PaymentMethod <<enumeration>> {
     CASH
     CARD
     MEMBER_POINTS
   }
   ```

7. Repite las mediciones del paso 1 y comprueba el tipo de diagrama:

   ```bash
   grep -cE '^[[:space:]]*[-+#~][[:space:]]*[[:alpha:]]+[[:space:]]*$' starter/reserva.puml
   grep -cE '[(][)][[:space:]]*$' starter/reserva.puml
   plantuml -syntax < starter/reserva.puml
   ```

   Output:

   ```
   0
   0
   CLASS
   (2 entities)
   ```

8. Borra los TODO, renderiza y revisa el SVG:

   ```bash
   grep -c TODO starter/reserva.puml; plantuml -tsvg starter/reserva.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] Ningún atributo sin tipo ni operación sin retorno (paso 7: `0` y `0`)
- [ ] `seats` con multiplicidad `[1..10]`, `total` derivado, `holdMinutes` estático con valor inicial
- [ ] `PaymentMethod` aparece con la palabra clave `«enumeration»`
- [ ] `plantuml -syntax` imprime `CLASS` y `(2 entities)`

## Reto extra

`Ticket` y `PaymentMethod` aparecen como tipos en las firmas. ¿Qué te dice eso sobre las relaciones que tendrá `Reservation` en la semana 03?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 02 — Visibilidad y encapsulamiento](../lab-02-visibilidad-y-encapsulamiento/README.md) | [Lab 04 — Enumeraciones, clases abstractas e interfaces](../lab-04-enums-abstractas-e-interfaces/README.md) → |

[↑ Semana 02](../../README.md)
