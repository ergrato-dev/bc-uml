# Lab 04 — Clase asociación, navegabilidad y dependencia

⏱ Duración estimada: ~60 min

## Objetivo

Sacar de una clase los datos que pertenecen a un vínculo, y distinguir una asociación navegable de una dependencia.

## Contexto

- Clase asociación: `(A, B) .. C`, con `C` declarada como clase normal. Ver [Asociaciones y multiplicidad](../../1-teoria/01-asociaciones-y-multiplicidad.md).
- Navegabilidad: `-->` dice que solo desde un extremo se llega al otro.
- Dependencia: `..>` cuando una clase usa otra solo dentro de una operación. Ver [Generalización, realización y dependencia](../../1-teoria/02-generalizacion-realizacion-y-dependencia.md).

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-03-relaciones_y_diagrama_de_objetos/2-practicas/lab-04-clase-asociacion-y-dependencia
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/proveedores.puml; echo $?; plantuml -syntax < starter/proveedores.puml
   ```

   Output:

   ```
   0
   CLASS
   (5 entities)
   ```

2. Piensa en un producto con dos proveedores: uno lo vende a 4,10 y entrega en 3 días; el otro, a 3,80 en 10 días. `Product.unitCost` no puede guardar los dos. Ese dato es del **par** producto–proveedor.

3. **TODO 1**: borra `- unitCost: Decimal` y `- leadTimeDays: Integer` de `Product`.

4. **TODO 2**: crea la clase asociación debajo de la asociación `Product`–`Supplier`:

   ```plantuml
   class SupplyTerms {
     - unitCost: Decimal
     - leadTimeDays: Integer
   }
   (Product, Supplier) .. SupplyTerms
   ```

   Renderiza: `SupplyTerms` cuelga con una línea discontinua del **centro** de la asociación, no de una de las clases.

5. **TODO 3**: asociación navegable. La factura conoce su pedido; el pedido no necesita conocer su factura:

   ```plantuml
   Invoice "0..1" --> "1" Order : bills >
   ```

   Renderiza: punta abierta en `Order`. Sin la punta, la asociación no diría nada sobre la dirección.

6. **TODO 4**: dependencia. `Invoice.render()` recibe la plantilla como parámetro, pero la factura no la guarda:

   ```plantuml
   Invoice ..> InvoiceTemplate : <<use>>
   ```

   Renderiza: línea discontinua con punta abierta y el texto `«use»`.

7. Comprueba:

   ```bash
   plantuml -syntax < starter/proveedores.puml
   grep -cE '^[(][[:alpha:]]+, [[:alpha:]]+[)] [.][.] ' starter/proveedores.puml
   ```

   Output:

   ```
   CLASS
   (7 entities)
   1
   ```

   Son 7 y no 6: PlantUML cuenta como entidad el punto donde la clase asociación se une a la línea.

8. Crea `decisiones.md` en la carpeta del lab con tres respuestas cortas:
   - ¿Por qué `SupplyTerms` es clase asociación y no un atributo de `Supplier`?
   - ¿Qué cambiaría si `Invoice` guardara la plantilla en un atributo `- template: InvoiceTemplate`?
   - ¿Por qué `Invoice`–`Order` es `0..1` en `Invoice` y no `1`?

9. Borra los TODO y valida:

   ```bash
   grep -c TODO starter/proveedores.puml; plantuml -checkonly starter/proveedores.puml; echo $?
   ```

   Output: `0` y `0`.

## Criterios de éxito

- [ ] `Product` ya no tiene `unitCost` ni `leadTimeDays`; están en `SupplyTerms`
- [ ] `plantuml -syntax` imprime `(7 entities)` y el `grep` del paso 7 imprime `1`
- [ ] El SVG muestra la punta de navegación en `Order` y la dependencia `«use»` hacia `InvoiceTemplate`
- [ ] `decisiones.md` responde las tres preguntas

## Reto extra

La tienda quiere el historial de precios: el mismo proveedor cambia el precio de un producto varias veces al año. Una clase asociación admite un solo objeto por par. Convierte `SupplyTerms` en una clase normal con dos asociaciones y añade `- validFrom: Date`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 03 — Generalización y realización](../lab-03-generalizacion-y-realizacion/README.md) | [Lab 05 — Diagrama de objetos](../lab-05-diagrama-de-objetos/README.md) → |

[↑ Semana 03](../../README.md)
