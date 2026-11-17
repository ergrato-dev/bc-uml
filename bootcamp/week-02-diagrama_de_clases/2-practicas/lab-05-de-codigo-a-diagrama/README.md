# Lab 05 — De código a diagrama

⏱ Duración estimada: ~60 min

## Objetivo

Traducir clases de Java y Python a un diagrama de clases UML en perspectiva de especificación.

## Contexto

- Leer código y dibujar su diagrama es lo que haces al llegar a un proyecto existente.
- No es una transcripción: se omiten el constructor, los getters triviales y los tipos propios del lenguaje (`LocalDate` pasa a `Date`, `long` e `int` a `Integer`, `bool` a `Boolean`).
- `starter/codigo/Loan.java` y `starter/codigo/fine.py` son el código de partida. No lo ejecutas: lo lees.

## Paso a paso

0. Abre `starter/codigo/Loan.java` en tu editor y el contenedor en otra terminal:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-02-diagrama_de_clases/2-practicas/lab-05-de-codigo-a-diagrama
   ```

1. Haz una tabla en `traduccion.md` (carpeta del lab) con una fila por miembro de `Loan`: cómo está en Java y cómo queda en UML. Reglas:

   | Java | UML |
   |---|---|
   | `private` / `public` / `protected` | `-` / `+` / `#` |
   | `static final int MAX_RENEWALS = 2` | `{static} - maxRenewals: Integer = 2` |
   | `LocalDate`, `UUID`, `int`, `long`, `boolean` | `Date`, `UUID`, `Integer`, `Integer`, `Boolean` |
   | Constructor, `getDueDate()` | No se dibujan |

2. **TODO 1**: escribe `Loan` en `starter/prestamo.puml` con 5 atributos privados (incluido el estático) y 4 operaciones (`renew`, `daysOverdue`, `close`, `isRenewable`). Fíjate en la visibilidad de `isRenewable()` en el código.

3. **TODO 2**: `enum LoanStatus <<enumeration>>` con sus tres valores.

4. Abre `starter/codigo/fine.py`. Python no tiene `private`: la convención `_nombre` indica uso interno, y en UML se dibuja `-`. `ABC` y `@abstractmethod` marcan clase y operación abstractas. `DAILY_CAP`, definido en el cuerpo de la clase, es estático. Las conversiones: `str` a `String`, `int` a `Integer`, `bool` a `Boolean`, `Decimal` a `Decimal`, `None` a `void`.

5. **TODO 3**: escribe `abstract class Fine` (con su atributo estático, 3 atributos privados y 3 operaciones, una abstracta) y `class StandardFine` solo con la operación que redefine:

   ```plantuml
   class StandardFine {
     + amount(): Decimal
   }
   ```

   Anota en `traduccion.md` que `StandardFine` hereda de `Fine`: la flecha de generalización llega en la semana 03.

6. Comprueba:

   ```bash
   plantuml -syntax < starter/prestamo.puml
   grep -c '{static}' starter/prestamo.puml
   grep -c '{abstract}' starter/prestamo.puml
   ```

   Output:

   ```
   CLASS
   (4 entities)
   2
   1
   ```

7. Compara con el código: cada miembro de tu diagrama tiene que estar en el código, y cada miembro del código que no dibujaste tiene que estar justificado en `traduccion.md`.

8. Borra los TODO y valida:

   ```bash
   grep -c TODO starter/prestamo.puml; plantuml -checkonly starter/prestamo.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] `plantuml -syntax` imprime `(4 entities)`; 2 miembros `{static}` y 1 `{abstract}`
- [ ] Ningún tipo de Java o Python en el diagrama (`LocalDate`, `int`, `str`, `bool`)
- [ ] `isRenewable()` con visibilidad protegida y `Fine` en cursiva
- [ ] `traduccion.md` justifica lo que no se dibujó

## Reto extra

`Loan` tiene `status` y `renewals`, y `renew()` comprueba los dos. ¿Qué invariante protege `renew()` que un setter de `renewals` habría roto?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 04 — Enumeraciones, clases abstractas e interfaces](../lab-04-enums-abstractas-e-interfaces/README.md) | [Lab 06 — Revisar un diagrama de clases](../lab-06-revisar-un-diagrama-de-clases/README.md) → |

[↑ Semana 02](../../README.md)
