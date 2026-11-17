# Lab 03 — Strategy

⏱ Duración estimada: ~60 min

## Objetivo

Sustituir el `switch` que calcula el precio de una entrada de cine por el patrón Strategy, con cada rol marcado como estereotipo en el diagrama.

## Contexto

- Roles y estructura: [Patrones GoF en UML](../../1-teoria/03-patrones-gof-en-uml.md), apartado "Strategy".
- `starter/precios.puml` renderiza, pero `Screening` decide el precio con un `switch` sobre `ScreeningKind` (la nota lo muestra). Cada tipo de función nuevo obliga a abrir `Screening` y añadir un caso.
- Especificación: el cine tiene tres políticas de precio (normal, matinal y estreno) y quiere añadir más sin tocar `Screening`. Cada función usa una política desde que se programa.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-09-de_uml_a_codigo_y_patrones/2-practicas/lab-03-strategy
   ```

1. Renderiza el starter y ábrelo (`starter/precios.svg`):

   ```bash
   plantuml -tsvg starter/precios.puml; echo $?
   plantuml -syntax < starter/precios.puml
   ```

   Output:

   ```
   0
   CLASS
   (4 entities)
   ```

   Tres clasificadores y la nota: PlantUML también cuenta las notas.

2. **TODO 1 — Strategy.** Declara la interfaz común con sus dos estereotipos, el de UML y el del rol:

   ```plantuml
   interface PricingPolicy <<interface>> <<Strategy>> {
     + priceFor(seat: Seat): Decimal
   }
   ```

   El estereotipo va siempre después del nombre. `interface <<Strategy>> PricingPolicy` da `Syntax Error?`.

3. **TODO 2 — ConcreteStrategy.** Una clase por cada caso del `switch`, que realiza `PricingPolicy`:

   ```plantuml
   class RegularPricing <<ConcreteStrategy>> {
     + priceFor(seat: Seat): Decimal
   }

   PricingPolicy <|.. RegularPricing
   ```

   Escribe también `MatineePricing` y `PremierePricing`, cada una con su realización. Renderiza:

   ```bash
   plantuml -tsvg starter/precios.puml; plantuml -syntax < starter/precios.puml
   ```

   Output:

   ```
   CLASS
   (8 entities)
   ```

   Si te dejas un `>` en un estereotipo, por ejemplo `class MatineePricing <<ConcreteStrategy> {`:

   ```
   Error line 44 in file: starter/precios.puml
   Some diagram description contains errors
   ```

   El número de línea depende de cómo hayas escrito el archivo; la línea que indica es la del estereotipo incompleto.

4. **TODO 3 — Context.** `Screening` ya no decide el precio: lo delega en la política que tenga.
   - Añade `<<Context>>` a `Screening` y borra su atributo `- kind: ScreeningKind`.
   - Borra `enum ScreeningKind` y la nota del `switch`: ya no existen.
   - Asocia `Screening` con la interfaz, nunca con una política concreta:

   ```plantuml
   Screening --> "1" PricingPolicy
   PricingPolicy ..> Seat
   ```

   Encima de `Screening`, un comentario `'` que diga por qué delega. Borra los comentarios de los TODO y renderiza: `Screening` apunta a `PricingPolicy` y de ella cuelgan las tres políticas con flecha discontinua y triángulo hueco.

5. Comprueba:

   ```bash
   plantuml -checkonly starter/precios.puml; echo $?
   plantuml -syntax < starter/precios.puml
   grep -c '<<ConcreteStrategy>>' starter/precios.puml
   grep -cE '<[|][.][.]' starter/precios.puml
   grep -c ScreeningKind starter/precios.puml
   grep -cE '^Screening --> "1" PricingPolicy$' starter/precios.puml
   ```

   Output:

   ```
   0
   CLASS
   (6 entities)
   3
   3
   0
   1
   ```

   Tres estrategias concretas, tres realizaciones, ningún rastro del enum y una sola asociación del contexto hacia la interfaz.

6. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - El cine añade una política "día del espectador". ¿Qué clases nuevas escribes y cuáles tocas?
   - ¿Por qué `Screening --> RegularPricing` rompería el patrón?
   - ¿Cuándo un enum con un `switch` es mejor solución que Strategy?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` da `(6 entities)`
- [ ] Los tres roles marcados: `<<Context>>`, `<<Strategy>>` y tres `<<ConcreteStrategy>>`
- [ ] `ScreeningKind` y la nota han desaparecido
- [ ] `Screening` se asocia con la interfaz, no con una política concreta
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Escribe en tu lenguaje el esqueleto de `PricingPolicy`, `MatineePricing` y `Screening`, y comprueba con el `comm` del [lab 01](../lab-01-del-diagrama-al-codigo/README.md) que el código tiene las mismas clases que el diagrama, sin contar `Seat`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 02 — Del código al diagrama](../lab-02-del-codigo-al-diagrama/README.md) | [Lab 04 — Observer](../lab-04-observer/README.md) → |

[↑ Semana 09](../../README.md)
