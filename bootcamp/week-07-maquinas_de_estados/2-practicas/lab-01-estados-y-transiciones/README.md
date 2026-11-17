# Lab 01 — Estados y transiciones

⏱ Duración estimada: ~60 min

## Objetivo

Modelar el ciclo de vida de un ejemplar de biblioteca con estado inicial, estados con nombre, transiciones disparadas por eventos y estado final.

## Contexto

- Sintaxis y reglas: [Estados y transiciones](../../1-teoria/01-estados-y-transiciones.md).
- `starter/ejemplar.puml` renderiza, pero solo tiene una flecha sin evento y los TODO.
- Especificación: un ejemplar recién catalogado está disponible. Se presta a un socio y vuelve al devolverlo. Un ejemplar disponible se puede apartar para un socio: después se le presta a ese socio o se anula la reserva. Si se detecta un daño, disponible o al volver de un préstamo, va a reparación; de ahí vuelve disponible o se da de baja, y con la baja termina su vida.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-07-maquinas_de_estados/2-practicas/lab-01-estados-y-transiciones
   ```

1. Renderiza el starter y comprueba el tipo de diagrama:

   ```bash
   plantuml -tsvg starter/ejemplar.puml; echo $?
   plantuml -syntax < starter/ejemplar.puml
   ```

   Output:

   ```
   0
   SEQUENCE
   (2 participants)
   ```

   No es un error tuyo: con una sola línea `Available --> OnLoan`, PlantUML no puede saber que es una máquina de estados y la adivina como secuencia. Abre `starter/ejemplar.svg`: dos lifelines y una flecha discontinua.

2. **TODO 1 — Estado inicial.** Escribe en la línea del TODO 1:

   ```plantuml
   [*] --> Available
   ```

   ```bash
   plantuml -tsvg starter/ejemplar.puml; plantuml -syntax < starter/ejemplar.puml
   ```

   Output:

   ```
   STATE
   (3 entities)
   ```

   `[*]` solo existe en los diagramas de estados: ahora PlantUML sabe qué estás dibujando. Empieza siempre una máquina de estados por su estado inicial. Las 3 entidades son el punto negro del inicial, `Available` y `OnLoan`.

3. **TODO 2 — Préstamo y devolución.** Una transición sin evento no dice qué la dispara. Añade el evento después de `:` y dibuja la vuelta:

   ```plantuml
   Available --> OnLoan : lend(memberId)
   OnLoan --> Available : return()
   ```

   Renderiza: dos flechas entre `Available` y `OnLoan`, una en cada sentido, cada una con su evento.

4. **TODO 3 — La reserva.** Escribe tú las tres transiciones de la especificación: apartar el ejemplar (`reserve(memberId)`), prestarlo al socio que lo reservó (`lend(memberId)`) y anular la reserva (`cancelReservation()`). Cada una con `Origen --> Destino : evento`. Comprueba:

   ```bash
   plantuml -tsvg starter/ejemplar.puml; plantuml -syntax < starter/ejemplar.puml
   ```

   Output:

   ```
   STATE
   (4 entities)
   ```

   `lend(memberId)` aparece dos veces, desde `Available` y desde `Reserved`. No es una repetición: es el mismo evento aceptado en dos estados distintos.

5. **TODO 4 — Reparación y baja.** Añade las transiciones `reportDamage()` hacia `InRepair` desde los dos estados que dice la especificación, la vuelta con `repaired()` y la baja con `withdraw()` hacia `Withdrawn`.

6. **TODO 5 — Estado final.** Con la baja termina la vida del ejemplar:

   ```plantuml
   Withdrawn --> [*]
   ```

   Borra los comentarios de los TODO y renderiza. Abre `starter/ejemplar.svg`: el punto negro arriba, el círculo con punto (final) debajo de `Withdrawn`.

7. Comprueba:

   ```bash
   plantuml -checkonly starter/ejemplar.puml; echo $?
   plantuml -syntax < starter/ejemplar.puml
   grep -cE -- '-->.*:[[:space:]]*[a-z]' starter/ejemplar.puml
   grep -cE -- '--> [[][*][]]' starter/ejemplar.puml
   ```

   Output:

   ```
   0
   STATE
   (7 entities)
   9
   1
   ```

   7 entidades: 5 estados, el inicial y el final. 9 transiciones con evento: todas menos la que sale del inicial, que no lleva evento porque el ejemplar empieza su vida al crearse.

8. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Qué pasa si llega `reserve(memberId)` a un ejemplar en `OnLoan`? ¿Dónde lo dice el diagrama?
   - ¿Por qué `Withdrawn` lleva al estado final y `Available` no?
   - Si `Copy` guarda su estado en un atributo, ¿qué enumeración necesita en el diagrama de clases y con qué literales?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` da `STATE` y `(7 entities)`
- [ ] Un estado inicial que lleva a `Available` y un estado final después de `Withdrawn`
- [ ] 9 transiciones con evento, sin ninguna flecha sin etiqueta entre estados
- [ ] Los 5 estados nombrados como situaciones, no como acciones
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Un ejemplar perdido por un socio tampoco vuelve. Añade el estado `Lost` y decide desde qué estado se llega y con qué evento. ¿Tiene que llevar al estado final? ¿Y si el socio lo encuentra después?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Índice de labs](../README.md) | [Lab 02 — Guardas, acciones y choice](../lab-02-guardas-acciones-y-choice/README.md) → |

[↑ Semana 07](../../README.md)
