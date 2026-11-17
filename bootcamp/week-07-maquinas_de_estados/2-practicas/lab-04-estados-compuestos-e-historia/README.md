# Lab 04 — Estados compuestos e historia

⏱ Duración estimada: ~60 min

## Objetivo

Agrupar en un estado compuesto los estados de una membresía de biblioteca que comparten salidas, sustituir las transiciones repetidas por una desde el borde y recordar el subestado con historia.

## Contexto

- Sintaxis y reglas: [Estados compuestos e historia](../../1-teoria/03-compuestos-e-historia.md).
- `starter/membresia.puml` renderiza, pero dibuja `Standard` y `Premium` sueltos, repite cada salida desde los dos y, al reactivar una membresía, la devuelve siempre como `Standard`.
- Especificación: una membresía activa es estándar o premium, y puede cambiar entre las dos. Una membresía activa, del tipo que sea, se puede suspender o cerrar. Al reactivarse, vuelve al tipo que tenía antes de la suspensión. Un socio puede darse de alta directamente como premium.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-07-maquinas_de_estados/2-practicas/lab-04-estados-compuestos-e-historia
   ```

1. Renderiza el starter y cuenta las flechas que llegan a `Suspended` y a `Closed`:

   ```bash
   plantuml -tsvg starter/membresia.puml; echo $?
   plantuml -syntax < starter/membresia.puml
   grep -cE -- '--> (Suspended|Closed)' starter/membresia.puml
   ```

   Output:

   ```
   0
   STATE
   (7 entities)
   5
   ```

   Abre `starter/membresia.svg`: cuatro de esas cinco flechas salen de `Standard` o de `Premium` y dicen lo mismo dos veces.

2. **TODO 1 — Estado compuesto.** Envuelve las dos transiciones entre `Standard` y `Premium` en un compuesto `Active` con su propio estado inicial, y haz que `activate()` llegue al borde de `Active`:

   ```plantuml
   Pending --> Active : activate()

   state Active {
     [*] --> Standard
     Standard --> Premium : upgrade()
     Premium --> Standard : downgrade()
   }
   ```

   ```bash
   plantuml -tsvg starter/membresia.puml; plantuml -syntax < starter/membresia.puml
   ```

   Output:

   ```
   STATE
   (8 entities)
   ```

   La entidad nueva es `Active`. Al entrar por el borde, la membresía empieza en `Standard`: lo dice el `[*]` de dentro, no la flecha de fuera. Si al renderizar te sale `No inner state defined`, sobra un `}`.

3. **TODO 2 — Transiciones desde el borde.** Borra las cuatro transiciones que salen de `Standard` y de `Premium` hacia `Suspended` y `Closed` y escribe dos desde `Active`:

   ```plantuml
   Active --> Suspended : suspend(reason)
   Active --> Closed : close()
   ```

   Renderiza: las flechas salen del borde de `Active`. Valen para cualquier subestado.

4. **TODO 3 — Historia.** `Suspended --> Standard` olvida qué tipo de membresía era. Para volver al subestado en el que estaba, apunta al pseudoestado de historia del compuesto:

   ```plantuml
   Suspended --> Active[H] : reactivate()
   ```

   Renderiza: dentro de `Active` aparece un círculo con una `H`, y la flecha de `reactivate()` llega a él. Si la membresía estaba en `Premium` al suspenderse, vuelve a `Premium`.

5. **TODO 4 — Entrar a un subestado.** Una flecha puede cruzar el borde y llegar directamente a un subestado, sin pasar por el estado inicial del compuesto:

   ```plantuml
   Pending --> Premium : activatePremium()
   ```

   Borra los comentarios de los TODO y renderiza: la flecha de `activatePremium()` entra en `Active` y termina en `Premium`.

6. Comprueba:

   ```bash
   plantuml -checkonly starter/membresia.puml; echo $?
   plantuml -syntax < starter/membresia.puml
   grep -cE -- '--> (Suspended|Closed)' starter/membresia.puml
   grep -c 'Active[[]H[]]' starter/membresia.puml
   grep -cE '^[[:space:]]+[[][*][]] -->' starter/membresia.puml
   ```

   Output:

   ```
   0
   STATE
   (9 entities)
   3
   1
   1
   ```

   De 5 flechas a 3 (2 desde el borde de `Active` y 1 desde `Suspended`), 1 historia y 1 estado inicial dentro del compuesto. Las 9 entidades incluyen la `H`.

7. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - Si la membresía está en `Premium` y llega `close()`, ¿qué transición la saca? ¿Por qué no hace falta dibujarla desde `Premium`?
   - ¿Qué pasaría al reactivar si quitas `[H]` y dejas `Suspended --> Active : reactivate()`?
   - ¿Cambiaría algo usar `Active[H*]` en este diagrama? ¿Cuándo empezaría a importar?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` da `(9 entities)`
- [ ] Un compuesto `Active` con `Standard`, `Premium` y su propio estado inicial
- [ ] `suspend(reason)` y `close()` salen una sola vez del borde de `Active`
- [ ] `reactivate()` llega a `Active[H]`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

La biblioteca guarda dos cosas independientes de una membresía activa: su tipo (estándar o premium) y si tiene multas pendientes (`Clear` o `WithFines`). Convierte `Active` en un compuesto con dos regiones separadas por `--`, como en la teoría. ¿Qué devuelve ahora `Active[H]`? ¿Sigue bastando con `[H]`?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 03 — Actividades internas](../lab-03-actividades-internas/README.md) | [Lab 05 — De la clase a la máquina](../lab-05-de-la-clase-a-la-maquina/README.md) → |

[↑ Semana 07](../../README.md)
