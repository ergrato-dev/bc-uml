# Lab 05 — De la clase a la máquina

⏱ Duración estimada: ~60 min

## Objetivo

Trazar la máquina de estados de una entrada de cine contra su diagrama de clases, para que cada estado sea un literal de la enumeración y cada evento de llamada sea una operación de la clase.

## Contexto

- Sintaxis y reglas: [Estados y transiciones](../../1-teoria/01-estados-y-transiciones.md), apartados de tipos de evento y de estados y atributos.
- `starter/clases.puml` tiene la clase `Ticket`, con su atributo `status: TicketStatus`, y la enumeración. `starter/estados.puml` es su máquina de estados. Los dos renderizan, pero no cuentan lo mismo.
- Especificación: una entrada se reserva y, si no se paga en 15 minutos, caduca. Pagada, se valida en la puerta o se devuelve el dinero antes de la función.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-07-maquinas_de_estados/2-practicas/lab-05-de-la-clase-a-la-maquina
   ```

1. Renderiza los dos diagramas:

   ```bash
   plantuml -tsvg starter/clases.puml starter/estados.puml; echo $?
   plantuml -syntax < starter/estados.puml
   ```

   Output:

   ```
   0
   STATE
   (6 entities)
   ```

   Abre los dos SVG uno al lado del otro. A simple vista parecen coherentes; el paso 2 lo comprueba.

2. **Estados frente a literales.** Saca los literales de `TicketStatus` y los estados a los que llega alguna transición, en mayúsculas, y compáralos:

   ```bash
   awk '/^enum TicketStatus/,/^}/' starter/clases.puml | grep -oE '^[[:space:]]+[A-Z_]+$' | tr -d ' _' | sort > literales.txt
   grep -oE -- '--> [A-Za-z]+' starter/estados.puml | cut -c5- | tr a-z A-Z | sort -u > estados.txt
   comm -3 literales.txt estados.txt
   ```

   Output:

   ```
   	BOOKED
   EXPIRED
   RESERVED
   ```

   `awk` se queda solo con el bloque de `TicketStatus` (sin él, `CARD` y `CASH` también contarían). `comm -3` imprime lo que no coincide: a la izquierda, literales sin estado; con sangría, estados sin literal.

3. **TODO 1 — Estado sin literal.** `Booked` y `RESERVED` son lo mismo con dos nombres. El nombre del modelo es el de la enumeración: cambia `Booked` por `Reserved` en las dos líneas en que aparece.

4. **TODO 2 — Literal sin estado.** `EXPIRED` no tiene estado. Añade la caducidad de la especificación con un evento de tiempo, y su final:

   ```plantuml
   Reserved --> Expired : after(15 min)
   Expired --> [*]
   ```

   Repite los tres comandos del paso 2: `comm -3` no imprime nada.

5. **Eventos frente a operaciones.** Saca los eventos con paréntesis, sin `after` ni `when` (los eventos de tiempo y de cambio no son operaciones), y las operaciones públicas de `Ticket`:

   ```bash
   grep -oE ': [a-z][A-Za-z]*[(]' starter/estados.puml | tr -d ':( ' | grep -vxE 'after|when' | sort -u > eventos.txt
   awk '/^class Ticket/,/^}/' starter/clases.puml | grep -oE '[+] [a-z][A-Za-z]*[(]' | tr -d '+( ' | sort -u > operaciones.txt
   comm -3 eventos.txt operaciones.txt
   ```

   Output:

   ```
   	printQr
   refund
   scan
   	validate
   ```

   A la izquierda, eventos que `Ticket` no sabe atender; con sangría, operaciones que no disparan ninguna transición.

6. **TODO 3 — Evento sin operación.** `scan()` y `validate()` son la misma cosa. La clase manda: cambia `scan()` por `validate()` en `starter/estados.puml`.

7. **TODO 4 — Operación que falta.** `refund()` sí es un evento de la especificación, y falta en la clase. Esta vez se corrige el diagrama de clases: en `starter/clases.puml`, sustituye el comentario del TODO 4 por:

   ```plantuml
     + refund(): void
   ```

   Borra los comentarios de los TODO de `starter/estados.puml` y repite los tres comandos del paso 5:

   ```
   	printQr
   ```

   Solo queda `printQr`: una operación que no cambia el estado de la entrada. No toda operación es un evento de la máquina, pero todo evento de llamada tiene que ser una operación.

8. Comprueba y limpia:

   ```bash
   plantuml -checkonly starter/clases.puml starter/estados.puml; echo $?
   plantuml -syntax < starter/estados.puml
   comm -23 eventos.txt operaciones.txt | wc -l
   rm -f *.txt
   ```

   Output:

   ```
   0
   STATE
   (7 entities)
   0
   ```

   0 eventos sin operación. Es la misma comprobación que hace el autograding del proyecto con tu dominio.

9. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - En el TODO 1 cambiaste la máquina y en el TODO 4 cambiaste la clase. ¿Cómo decides cuál de los dos diagramas está mal?
   - ¿Por qué `after(15 min)` no necesita una operación `expire()` en `Ticket`? ¿Quién la llamaría?
   - `returnMoney()` es una acción, no un evento. ¿Debe ser una operación de `Ticket`, de otra clase o de ninguna?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` para los dos archivos y `-syntax` da `(7 entities)`
- [ ] Los 5 estados se llaman como los 5 literales de `TicketStatus`
- [ ] Todo evento de llamada de la máquina es una operación de `Ticket`
- [ ] `Ticket` tiene `+ refund(): void`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Haz el mismo cruce con tu dominio, sobre el `02-clases.puml` de tu proyecto: elige la clase que tiene un atributo de tipo enumeración y escribe los estados que tendría su máquina. ¿Te falta algún literal? ¿Alguna operación? Es el punto de partida del proyecto de esta semana.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 04 — Estados compuestos e historia](../lab-04-estados-compuestos-e-historia/README.md) | [Lab 06 — Depurar máquinas de estados rotas](../lab-06-depurar-maquinas-rotas/README.md) → |

[↑ Semana 07](../../README.md)
