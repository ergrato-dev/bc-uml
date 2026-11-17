# Lab 05 — Adapter y Factory Method

⏱ Duración estimada: ~60 min

## Objetivo

Aislar una tienda de su proveedor de pagos con el patrón Adapter y quitar el `if` que elige la etiqueta de envío con el patrón Factory Method.

## Contexto

- Roles y estructura: [Patrones GoF en UML](../../1-teoria/03-patrones-gof-en-uml.md), apartados "Adapter" y "Factory Method".
- `starter/pagos.puml`: `Checkout` llama directamente a `AcmePayClient`, que es código del proveedor. Trabaja en céntimos y devuelve `"OK"` o un código de error.
- `starter/envios.puml`: `ShippingService` crea la etiqueta de cada transportista con un `if` sobre su nombre (la nota lo muestra).

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-09-de_uml_a_codigo_y_patrones/2-practicas/lab-05-adapter-y-factory-method
   ```

1. Renderiza los dos starters y ábrelos (`starter/pagos.svg` y `starter/envios.svg`):

   ```bash
   plantuml -tsvg starter/pagos.puml; plantuml -syntax < starter/pagos.puml
   plantuml -tsvg starter/envios.puml; plantuml -syntax < starter/envios.puml
   ```

   Output:

   ```
   CLASS
   (4 entities)
   CLASS
   (6 entities)
   ```

### Parte A: Adapter (`pagos.puml`)

2. **TODO 1 — Target.** La interfaz que la tienda querría tener, en sus propios términos (`Decimal` y `Boolean`):

   ```plantuml
   interface PaymentGateway <<interface>> <<Target>> {
     + pay(amount: Decimal, cardToken: String): Boolean
   }
   ```

3. **TODO 2 — Adapter y Adaptee.** La clase que cumple `PaymentGateway` y traduce cada llamada a `charge()`. Encima, un comentario `'` con lo que traduce:

   ```plantuml
   ' Adapter: pasa de Decimal a céntimos y de "OK" a Boolean.
   class AcmePayAdapter <<Adapter>> {
     + pay(amount: Decimal, cardToken: String): Boolean
   }
   ```

   Añade `<<Adaptee>>` a `AcmePayClient`. Su código no cambia: solo su papel en el diagrama.

4. **TODO 3 — Client.** Añade `<<Client>>` a `Checkout` y cambia sus relaciones: `Checkout` deja de conocer al proveedor.

   ```plantuml
   Checkout --> "1" PaymentGateway
   PaymentGateway <|.. AcmePayAdapter
   AcmePayAdapter --> "1" AcmePayClient
   ```

   Borra la línea `Checkout --> "1" AcmePayClient` y la nota (lo que decía queda en el comentario del adaptador). Borra los comentarios de los TODO 1 a 3 y comprueba:

   ```bash
   plantuml -checkonly starter/pagos.puml; echo $?
   plantuml -syntax < starter/pagos.puml
   for r in Client Target Adapter Adaptee; do grep -c "<<$r>>" starter/pagos.puml; done
   grep -E '^Checkout --> ' starter/pagos.puml
   ```

   Output:

   ```
   0
   CLASS
   (5 entities)
   1
   1
   1
   1
   Checkout --> "1" PaymentGateway
   ```

   Un rol por clase. Si la tienda cambia de proveedor, escribe otro adaptador y `Checkout` no se entera.

### Parte B: Factory Method (`envios.puml`)

5. **TODO 4 — Creator.** `ShippingService` pasa a llamarse `Shipper`, es abstracta y ya no recibe el transportista. Su operación `ship()` es la misma para todos; lo que cambia es qué etiqueta crea, y eso lo decide una operación abstracta:

   ```plantuml
   abstract class Shipper <<Creator>> {
     + ship(order: Order): ShippingLabel
     {abstract} # createLabel(order: Order): ShippingLabel
   }
   ```

   `createLabel` es `#` (protegida): solo la usa `ship()` y la redefinen las subclases. Cambia `ShippingService` por `Shipper` en las líneas del final.

6. **TODO 5 — Product y ConcreteProduct.** Las etiquetas ya están bien modeladas; solo les falta el rol. Añade `<<Product>>` a `ShippingLabel` y `<<ConcreteProduct>>` a `FastBoxLabel` y `EcoPostLabel`.

7. **TODO 6 — ConcreteCreator.** Un creador por transportista, que redefine `createLabel`:

   ```plantuml
   class FastBoxShipper <<ConcreteCreator>> {
     # createLabel(order: Order): ShippingLabel
   }
   ```

   Escribe también `EcoPostShipper`. Cambia las relaciones del final:

   ```plantuml
   Shipper <|-- FastBoxShipper
   Shipper <|-- EcoPostShipper
   Shipper ..> Order
   Shipper ..> ShippingLabel
   FastBoxShipper ..> FastBoxLabel
   EcoPostShipper ..> EcoPostLabel
   ```

   `Shipper` solo depende de la etiqueta abstracta; cada creador concreto, de la suya. Borra la nota y los comentarios de los TODO y comprueba:

   ```bash
   plantuml -checkonly starter/envios.puml; echo $?
   plantuml -syntax < starter/envios.puml
   for r in Creator ConcreteCreator Product ConcreteProduct; do grep -c "<<$r>>" starter/envios.puml; done
   grep -cE '^(abstract )?class ShippingService' starter/envios.puml
   ```

   Output:

   ```
   0
   CLASS
   (7 entities)
   1
   2
   1
   2
   0
   ```

   En el SVG, `Shipper` arriba con sus dos creadores, y cada creador con una flecha discontinua hacia su etiqueta.

8. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Por qué `PaymentGateway` usa `Decimal` y no céntimos, si el proveedor trabaja en céntimos?
   - ¿Qué ganas al llevar a `Shipper` el código común de `ship()` en lugar de repetirlo en cada creador?
   - Llega un tercer transportista. Cuenta las clases nuevas y las clases que cambian en `envios.puml`.

## Criterios de éxito

- [ ] Los dos diagramas salen con `0` en `plantuml -checkonly`, con `(5 entities)` y `(7 entities)`
- [ ] `pagos.puml` tiene los roles `Client`, `Target`, `Adapter` y `Adaptee`, y `Checkout` solo conoce `PaymentGateway`
- [ ] `envios.puml` tiene un `Creator`, dos `ConcreteCreator`, un `Product` y dos `ConcreteProduct`
- [ ] No quedan `ShippingService`, notas ni TODO
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

Escribe en tu lenguaje `AcmePayAdapter.pay()` completo, con la conversión a céntimos y la del resultado. ¿Dónde pones el redondeo de `Decimal` a céntimos y por qué ahí?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 04 — Observer](../lab-04-observer/README.md) | [Lab 06 — Depurar patrones rotos](../lab-06-depurar-patrones-rotos/README.md) → |

[↑ Semana 09](../../README.md)
