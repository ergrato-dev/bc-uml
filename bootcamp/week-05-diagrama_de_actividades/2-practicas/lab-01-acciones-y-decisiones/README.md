# Lab 01 — Acciones y decisiones

⏱ Duración estimada: ~60 min

## Objetivo

Modelar la devolución de un libro como diagrama de actividad, con acciones bien nombradas, dos decisiones con guardas y un final.

## Contexto

- Sintaxis y reglas: [Acciones, decisiones y finales](../../1-teoria/01-acciones-y-decisiones.md).
- `starter/devolucion.puml` renderiza, pero solo tiene tres acciones mal nombradas y los TODO.
- El bibliotecario recibe un libro: lo escanea, busca el préstamo, cobra una multa si vuelve tarde y decide dónde va el ejemplar.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-05-diagrama_de_actividades/2-practicas/lab-01-acciones-y-decisiones
   ```

1. Renderiza el starter y comprueba el tipo de diagrama:

   ```bash
   plantuml -tsvg starter/devolucion.puml; echo $?
   plantuml -syntax < starter/devolucion.puml
   ```

   Output:

   ```
   0
   ACTIVITY
   activity3
   ```

   `ACTIVITY` es el tipo; `activity3` indica la sintaxis nueva. Abre `starter/devolucion.svg`: un punto negro y tres acciones en fila.

2. **TODO 1 — Nombres.** Una acción es algo que alguien hace: verbo en infinitivo y objeto. Renombra:

   | Antes | Después |
   |---|---|
   | `:Copy barcode;` | `:Scan copy barcode;` |
   | `:Loan search;` | `:Find active loan;` |
   | `:Return screen;` | `:Show loan details;` |

   `Return screen` era una pantalla, no un paso. Borra el comentario del TODO 1.

3. **TODO 2 — Primera decisión.** Debajo de las acciones:

   ```plantuml
   if (Returned late?) then ([yes])
     :Register fine;
   else ([no])
   endif
   ```

   La rama `[no]` está vacía: no hace nada, pero la guarda se escribe igual para que la decisión cubra los dos casos. Renderiza y abre el SVG: un rombo con `[yes]` y `[no]` y otro rombo debajo donde se juntan (la fusión).

4. **TODO 3 — Segunda decisión.** Ahora las dos ramas tienen acción: `[yes]` lleva a `:Send copy to repair;` y `[no]` a `:Put copy on shelf;`. Escríbela con la misma forma del paso 3.

5. **TODO 4 — Cierre.** Añade `:Close loan;` y `stop` antes de `@enduml`. Borra los comentarios de los TODO.

6. Comprueba:

   ```bash
   plantuml -checkonly starter/devolucion.puml; echo $?
   grep -cE '^[[:space:]]*:[^;]+;[[:space:]]*$' starter/devolucion.puml
   grep -cE '^[[:space:]]*if[[:space:]]*[(]' starter/devolucion.puml
   grep -cE '(then|else)[[:space:]]*[(][[]' starter/devolucion.puml
   grep -cE '^[[:space:]]*stop[[:space:]]*$' starter/devolucion.puml
   ```

   Output:

   ```
   0
   7
   2
   4
   1
   ```

   7 acciones, 2 decisiones, 4 guardas entre corchetes y 1 final.

7. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué `Returned late?` necesita la rama `[no]` aunque esté vacía?
   - Si el ejemplar está dañado **y** el préstamo vuelve tarde, ¿por qué ramas pasa el flujo? Síguelo en el SVG.
   - ¿Qué cambia si mueves `:Close loan;` antes de la primera decisión?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0`
- [ ] 7 acciones, todas con verbo y objeto, y ninguna con nombre de pantalla o de cosa
- [ ] 2 decisiones con 4 guardas entre corchetes y 1 `stop`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Añade la regla "si el socio tiene una reserva pendiente de este libro, avísale" después de `Put copy on shelf`, solo en esa rama. ¿Dónde se cierra la nueva decisión?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Índice de labs](../README.md) | [Lab 02 — Bucles y guardas](../lab-02-bucles-y-guardas/README.md) → |

[↑ Semana 05](../../README.md)
