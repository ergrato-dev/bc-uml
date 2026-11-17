# Lab 05 — Defensa de decisiones

⏱ Duración estimada: ~60 min

## Objetivo

Preparar la defensa del diagrama de clases de una tienda online: encontrar sus decisiones de modelado, escribir cada una con su alternativa y su motivo, y montar un guion de 10 minutos.

## Contexto

- Las cuatro partes de una decisión y el guion: [Revisión por pares y defensa](../../1-teoria/03-revision-y-defensa.md), apartado "La defensa".
- `starter/clases.puml` es el pedido de una tienda: 10 clasificadores, 9 relaciones y un solo comentario `'`. Cada decisión sin comentario es una pregunta que te harán en la defensa.
- `starter/defensa.md` tiene la decisión 1 escrita como ejemplo.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-10-proyecto_integrador/2-practicas/lab-05-defensa-de-decisiones
   ```

1. Renderiza el diagrama, ábrelo (`starter/clases.svg`) y cuenta relaciones y comentarios:

   ```bash
   plantuml -tsvg starter/clases.puml; echo $?
   plantuml -syntax < starter/clases.puml
   grep -cE -- '-->|[*]--|<[|][.][.]' starter/clases.puml
   grep -cE "^[[:space:]]*'" starter/clases.puml
   ```

   Output:

   ```
   0
   CLASS
   (10 entities)
   9
   1
   ```

2. Lee la decisión 1 de `starter/defensa.md` y comprueba el formato con el mismo `awk` que usa el autograding del proyecto:

   ```bash
   awk '/^### / {n++} /^- [*][*]Diagrama:[*][*].*[]][(]/ {g++} /^- [*][*]Alternativa:[*][*][[:space:]]*[^[:space:]]/ {a++} /^- [*][*]Por qué:[*][*][[:space:]]*[^[:space:]]/ {p++} END {print n+0, "decisiones,", g+0, "diagramas,", a+0, "alternativas,", p+0, "porqués"}' starter/defensa.md
   ```

   Output:

   ```
   1 decisiones, 1 diagramas, 1 alternativas, 1 porqués
   ```

   Los cuatro números tienen que ser iguales: una decisión sin alternativa o sin motivo no cuenta.

3. **TODO 1 a 4 — Cuatro decisiones más.** Busca en el SVG elementos que alguien podría haber modelado de otra forma. Cinco candidatos, elige cuatro:
   - `OrderLine` tiene `unitPrice` y `Product` tiene `price`. ¿Por qué el precio está dos veces?
   - `DiscountRule` es una interfaz con dos clases. ¿Por qué no un enum?
   - `Payment` es una clase `0..1`. ¿Por qué no un atributo `paid: Boolean`?
   - `Order --> Address : ships to`. ¿Por qué el pedido tiene dirección si el cliente ya las tiene?
   - `OrderStatus` es un enum. ¿Por qué no una subclase por estado?

   Escribe cada una debajo de la decisión 1, con las cuatro líneas. El motivo sale de la tienda, no de la técnica:

   ```markdown
   ### 2. La línea guarda su precio

   - **Diagrama:** [clases](clases.puml)
   - **Decisión:** `OrderLine` tiene `unitPrice` aunque `Product` ya tiene `price`.
   - **Alternativa:** que `subtotal()` lea `product.price` cada vez.
   - **Por qué:** el precio del catálogo cambia; un pedido ya hecho cobra el precio del día de la compra.
   ```

   Borra el comentario de los TODO 1 a 4 y repite el `awk` del paso 2. Output:

   ```
   5 decisiones, 5 diagramas, 5 alternativas, 5 porqués
   ```

4. **El porqué también va en el diagrama.** Encima de cada elemento que defiendes, un comentario `'` de una línea con el motivo. Si el elemento es un atributo, el comentario va dentro de la clase, encima del atributo:

   ```plantuml
     ' Precio del día de la compra: el del catálogo cambia.
     - unitPrice: Decimal
   ```

   Comprueba:

   ```bash
   plantuml -checkonly starter/clases.puml; echo $?
   grep -cE "^[[:space:]]*'" starter/clases.puml
   ```

   Output:

   ```
   0
   5
   ```

5. **TODO 5 — El guion.** Cinco paradas en `## Guion (10 minutos)`, cada una con un enlace al diagrama que abres y los minutos entre paréntesis:

   ```markdown
   1. El dominio: qué vende la tienda y quién compra (1 min).
   2. [Clases](clases.puml): pedido, líneas y producto (3 min).
   ```

   Suma los minutos:

   ```bash
   grep -oE '[(][0-9]+ min[)]' starter/defensa.md | grep -oE '[0-9]+' | awk '{s+=$1} END {print s+0, "min"}'
   ```

   Output: `10 min`. Antes de escribir el guion sale `0 min`.

6. **TODO 6 — Las preguntas que esperas.** Dos preguntas difíciles y tu respuesta en una línea. Casi siempre caen sobre lo que no comentaste o sobre la multiplicidad más rara: `Order "0..*" --> "0..*" DiscountRule` es una buena candidata.

7. Ensaya. Pon un cronómetro y explica el modelo en voz alta siguiendo el guion, con el SVG abierto. Si una parada se pasa de su tiempo, recorta lo que dices, no el número.

8. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Qué decisión de las cinco que había te costó más encontrarle una alternativa? ¿Era de verdad una decisión?
   - "Porque es más limpio" no vale como motivo. Escribe un motivo técnico que tampoco valdría y explica por qué.
   - ¿Por qué el comentario `'` del diagrama dice el motivo y no la decisión?

## Criterios de éxito

- [ ] El `awk` del paso 2 da `5 decisiones, 5 diagramas, 5 alternativas, 5 porqués`
- [ ] `clases.puml` renderiza y tiene 5 comentarios `'`, uno por decisión
- [ ] El guion suma `10 min`, en cinco paradas con enlace
- [ ] `## Preguntas que espero` tiene dos preguntas con respuesta
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Defiende la decisión contraria a una de las tuyas: escribe la tarjeta de la alternativa como si fuera la elegida. Si el motivo te sale igual de convincente, la decisión depende de algo del dominio que todavía no sabes. Escribe qué pregunta le harías a la tienda para decidir.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 04 — Revisión por pares](../lab-04-revision-por-pares/README.md) | [Lab 06 — Depurar un modelo roto](../lab-06-depurar-modelo-roto/README.md) → |

[↑ Semana 10](../../README.md)
