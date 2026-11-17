# Lab 06 — Depurar máquinas de estados rotas

⏱ Duración estimada: ~60 min

## Objetivo

Reparar la máquina de estados de un envío de tienda con 3 errores de sintaxis de PlantUML y 4 errores de modelado que PlantUML dibuja sin protestar.

## Contexto

- Repasa los "Errores típicos" de los tres archivos de [teoría](../../1-teoria/01-estados-y-transiciones.md).
- `starter/envio.puml` **no renderiza**: es el único starter de la semana roto a propósito.
- Especificación: el envío se crea con su etiqueta y pasa a tránsito cuando el transportista lo recoge; al entrar en tránsito se avisa al cliente. En tránsito, el paquete está en un centro de reparto y sale a reparto. En cada intento de entrega, si el destinatario está, se entrega y se recoge la firma; si no, vuelve al centro. Tras 3 intentos se devuelve al remitente. Si pasan 7 días en tránsito, se da por perdido. Al entregarse, se pide una reseña. Entregado, devuelto o perdido, el envío termina.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-07-maquinas_de_estados/2-practicas/lab-06-depurar-maquinas-rotas
   ```

### Parte 1 — Sintaxis

PlantUML se detiene en el primer error. Corrige uno, renderiza otra vez y pasa al siguiente.

1. Renderiza:

   ```bash
   plantuml -tsvg starter/envio.puml; echo $?
   plantuml -syntax < starter/envio.puml
   ```

   Output:

   ```
   Error line 10 in file: starter/envio.puml
   Some diagram description contains errors
   200
   ERROR
   9
   Syntax Error? (Assumed diagram type: state)
   ```

   `-tsvg` cuenta las líneas desde 1 y `-syntax` desde 0: las dos señalan la línea 10, `AtHub => OutForDelivery : dispatch()`. `=>` no es una flecha de PlantUML. Cámbiala por `-->`.

2. Renderiza otra vez:

   ```
   Error line 13 in file: starter/envio.puml
   Some diagram description contains errors
   200
   ERROR
   12
   No inner state defined (Assumed diagram type: state)
   ```

   La línea 13 es un `}` que no cierra nada: el compuesto `InTransit` ya se cerró en la 12. Borra la línea 13.

3. Renderiza otra vez:

   ```
   Error line 15 in file: starter/envio.puml
   Some diagram description contains errors
   200
   ERROR
   14
   Syntax Error? (Assumed diagram type: state)
   ```

   Al borrar una línea, la siguiente sube: ahora la 15 es `state "Returned to sender as ReturnedToSender`. Al nombre visible le falta la comilla de cierre. Escribe `state "Returned to sender" as ReturnedToSender`.

4. Renderiza otra vez:

   ```bash
   plantuml -tsvg starter/envio.puml; echo $?
   plantuml -syntax < starter/envio.puml
   ```

   Output:

   ```
   0
   STATE
   (10 entities)
   ```

   Renderiza. Abre `starter/envio.svg` y compáralo con la especificación antes de seguir: los 4 errores que quedan están a la vista.

### Parte 2 — Modelado

5. **Estados sin salida y sin entrada.** Un estado al que se llega y del que no se sale (sin ser el final) atrapa el objeto. Un estado al que no se llega nunca sobra. Búscalos:

   ```bash
   for s in $(grep -oE -- '--> [A-Za-z]+' starter/envio.puml | cut -c5- | sort -u); do grep -qE "^[[:space:]]*$s[[:space:]]*-->" starter/envio.puml || echo "$s sin salida"; done
   for s in $(grep -oE '^[A-Za-z]+ :' starter/envio.puml | cut -d' ' -f1 | sort -u); do grep -qE -- "--> $s([^A-Za-z]|$)" starter/envio.puml || echo "$s sin entrada"; done
   ```

   Output:

   ```
   Lost sin salida
   Deliverd sin entrada
   ```

   - **Error 1 — `Lost` sin salida.** Un envío perdido termina su vida, según la especificación. Añade `Lost --> [*]` junto a los otros finales.
   - **Error 2 — `Deliverd`.** Es una errata de `Delivered`. PlantUML no avisa: crea un estado nuevo, suelto en una esquina del SVG, con el `entry` que debía tener `Delivered`. Corrige el nombre.

6. **Error 3 — La etiqueta al revés.** Busca guardas delante del evento:

   ```bash
   grep -nE -- '-->[^:]*:[[:space:]]*[[][^]]*[]][[:space:]]*[a-zA-Z]' starter/envio.puml
   ```

   Output:

   ```
   17:InTransit --> ReturnedToSender : [attempts = 3] returnToSender()
   ```

   Reescríbela como `returnToSender() [attempts = 3]`.

7. **Error 4 — Dos transiciones con el mismo evento.** Busca el evento que sale dos veces del mismo estado:

   ```bash
   grep -n attemptDelivery starter/envio.puml
   ```

   Output:

   ```
   11:  OutForDelivery --> AtHub : attemptDelivery()
   16:OutForDelivery --> Delivered : attemptDelivery() / collectSignature()
   ```

   Llega `attemptDelivery()` a un paquete en `OutForDelivery`: ¿vuelve al centro o se entrega? La máquina no lo sabe. Separa las dos con guardas que no se puedan cumplir a la vez:

   ```plantuml
   OutForDelivery --> AtHub : attemptDelivery() [recipient absent]
   OutForDelivery --> Delivered : attemptDelivery() [recipient at home] / collectSignature()
   ```

8. Comprueba:

   ```bash
   plantuml -checkonly starter/envio.puml; echo $?
   plantuml -syntax < starter/envio.puml
   grep -cE 'attemptDelivery[(][)] [[]' starter/envio.puml
   ```

   Output:

   ```
   0
   STATE
   (9 entities)
   2
   ```

   Repite los dos `for` del paso 5 y el `grep` del paso 6: ninguno imprime nada. Una entidad menos: `Deliverd` ya no existe.

9. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué `after(7 days)` sale del borde de `InTransit` y no de `AtHub`? ¿Qué pasaría si saliera de `AtHub`?
   - ¿Qué error de los 4 habría sido el más caro de descubrir ya en el código? ¿Por qué?
   - Un paquete en `OutForDelivery`, ¿en qué estados está a la vez? Si llega `returnToSender()` con 3 intentos, ¿qué transición lo saca y se ejecuta algún `exit`?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` da `(9 entities)`
- [ ] Los dos `for` del paso 5 y el `grep` del paso 6 no imprimen nada
- [ ] Las dos transiciones con `attemptDelivery()` llevan guardas excluyentes
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Rompe tú una máquina: copia `starter/envio.puml` arreglado en `roto.puml`, mete un error de sintaxis y uno de modelado distintos de los de este lab, y pásaselo a un compañero. Anota cuánto tarda en encontrar cada uno y qué comando le ayudó.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 05 — De la clase a la máquina](../lab-05-de-la-clase-a-la-maquina/README.md) | [Proyecto — Máquina de estados de una entidad](../../3-proyecto/README.md) → |

[↑ Semana 07](../../README.md)
