# Lab 02 — Del código al diagrama

⏱ Duración estimada: ~60 min

## Objetivo

Reconstruir el diagrama de clases del carrito de una tienda leyendo su código y decidir qué pasa al diagrama, qué relación es cada campo y qué se queda fuera.

## Contexto

- Reglas de lectura: [Del código al diagrama](../../1-teoria/02-del-codigo-al-diagrama.md).
- El mismo código está en dos lenguajes: `starter/java/` y `starter/python/`. Lee el de tu lenguaje; los dos cuentan exactamente lo mismo.
- `starter/tienda.puml` solo tiene `Customer` y `Product`. Lo completas tú.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-09-de_uml_a_codigo_y_patrones/2-practicas/lab-02-del-codigo-al-diagrama
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/tienda.puml; echo $?
   plantuml -syntax < starter/tienda.puml
   ```

   Output:

   ```
   0
   CLASS
   (2 entities)
   ```

2. Lista las clases del código que todavía no están en el diagrama. `comm -3` imprime en la primera columna las que solo están en el código y, tras un tabulador, las que solo están en el diagrama:

   ```bash
   C=starter/java      # o bien: C=starter/python
   comm -3 <(grep -rhoIE '(class|interface|enum|record)[[:space:]]+[A-Z][A-Za-z0-9_]*' $C | awk '{print $2}' | sort -u) <(grep -oE '^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+' starter/tienda.puml | awk '{print $NF}' | sort -u)
   ```

   Output:

   ```
   Cart
   CartLine
   DiscountRule
   PriceList
   SeasonalDiscount
   ```

3. **TODO 1 — Clases, atributos y operaciones.** Abre cada clase del código y decide campo por campo:
   - Campo de tipo de la biblioteca estándar (`String`, `int`, `BigDecimal`, `LocalDate`, `Map`): atributo con tipo UML. `BigDecimal` y `Decimal` pasan a `Decimal`; `LocalDate` y `date`, a `Date`; `int`, a `Integer`.
   - Campo de tipo de otra clase de la tienda (`customer`, `lines`, `discount`, `product`): **no** es atributo. Será una asociación en el TODO 3.
   - Métodos públicos: operaciones con parámetros tipados. Getters, propiedades de solo lectura y constructores no pasan.

   `CartLine` queda así:

   ```plantuml
   class CartLine {
     - quantity: Integer
     + subtotal(prices: PriceList): Decimal
   }
   ```

   `DiscountRule` es una interfaz en Java y una clase `ABC` sin estado en Python: en UML, `interface DiscountRule <<interface>>`. `Cart` no tiene ningún atributo: sus tres campos son referencias. Escribe las cinco clases y repite el `comm` del paso 2:

   ```
   (sin salida)
   ```

   Comprueba que ningún atributo tiene como tipo una clase del diagrama:

   ```bash
   grep -oE '^[[:space:]]*(abstract[[:space:]]+)?(class|enum|interface)[[:space:]]+[A-Za-z0-9_]+' starter/tienda.puml | awk '{print $NF}' > /tmp/clases
   grep -E '^[[:space:]]*-[[:space:]]' starter/tienda.puml | grep -wFf /tmp/clases
   ```

   Output: `(sin salida)`. Si copiaste los campos tal cual, sale:

   ```
     - customer: Customer
     - lines: List<CartLine>
   ```

   Bórralos: los dibujarás como líneas.

4. **TODO 2 — Realización.** `SeasonalDiscount implements DiscountRule` (o `class SeasonalDiscount(DiscountRule)`) es una realización:

   ```plantuml
   DiscountRule <|.. SeasonalDiscount
   ```

5. **TODO 3 — Asociaciones, composición y dependencias.** Recorre los campos que dejaste fuera en el TODO 1 y los parámetros:

   | En el código | En el diagrama |
   |---|---|
   | `Cart.customer`, llega por el constructor | `Cart "0..*" --> "1" Customer` |
   | `Cart.lines`, `add()` hace `new CartLine` y `getLines()` devuelve una copia | `Cart "1" *-- "0..*" CartLine` |
   | `CartLine.product` | `CartLine "0..*" --> "1" Product` |
   | `Cart.discount`, empieza vacío | `Cart "0..*" --> "0..1" DiscountRule` |
   | `PriceList` solo como parámetro en `Cart` y en `CartLine` | `Cart ..> PriceList` y `CartLine ..> PriceList` |
   | `Product` como parámetro de `priceOf` | `PriceList ..> Product` |

   Escribe las siete líneas. Encima de la composición, un comentario `'` con el motivo. Borra los comentarios de los TODO y renderiza: `Cart` en el centro, la composición con un rombo negro junto a `Cart` y las dependencias con línea discontinua.

6. Comprueba:

   ```bash
   plantuml -checkonly starter/tienda.puml; echo $?
   plantuml -syntax < starter/tienda.puml
   grep -cE '[+][[:space:]]*get[A-Z]' starter/tienda.puml
   grep -cE -- '-->' starter/tienda.puml
   grep -cE '[*]--' starter/tienda.puml
   grep -cE '[.][.]>' starter/tienda.puml
   grep -cE '<[|][.][.]' starter/tienda.puml
   ```

   Output:

   ```
   0
   CLASS
   (7 entities)
   0
   3
   1
   3
   1
   ```

   Ningún getter, 3 asociaciones, 1 composición, 3 dependencias y 1 realización.

7. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué `Cart --> Customer` es asociación y no composición, si el campo es `final`?
   - El código no dice si un carrito puede estar vacío. ¿Qué multiplicidad pusiste en `CartLine` y en qué te basaste?
   - Si mañana `Cart` guarda la `PriceList` en un campo, ¿qué cambia en el diagrama?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` da `(7 entities)`
- [ ] El `comm -3` no imprime nada: mismas clases en el código y en el diagrama
- [ ] Ningún atributo tiene como tipo una clase del diagrama y ningún getter es operación
- [ ] 3 asociaciones, 1 composición, 3 dependencias y 1 realización
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

La tienda guarda el historial: `Customer` tiene una lista de `Order` y cada `Order` se crea a partir de un `Cart` copiando sus líneas en `OrderLine`. Escribe el código mínimo de `Order` y `OrderLine` en tu lenguaje y añádelas al diagrama. ¿`Order` y `Cart` comparten las líneas o cada uno tiene las suyas?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 01 — Del diagrama al código](../lab-01-del-diagrama-al-codigo/README.md) | [Lab 03 — Strategy](../lab-03-strategy/README.md) → |

[↑ Semana 09](../../README.md)
