# Lab 02 — Componentes e interfaces

⏱ Duración estimada: ~60 min

## Objetivo

Sustituir las flechas directas entre los componentes de una tienda por interfaces provistas y requeridas, de forma que cada componente dependa de un contrato y no de otro componente.

## Contexto

- Sintaxis y reglas: [Componentes e interfaces](../../1-teoria/02-componentes-e-interfaces.md).
- `starter/componentes.puml` renderiza, pero une los componentes con `-->`: dice quién usa a quién, no a través de qué.
- Especificación: `Checkout` consulta el stock y crea envíos. `Shipping` reserva el stock al preparar el envío y avisa al cliente. `Inventory` ofrece la consulta y la reserva por separado, porque quien solo consulta no tiene por qué poder reservar.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-08-componentes_paquetes_y_despliegue/2-practicas/lab-02-componentes-e-interfaces
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/componentes.puml; echo $?
   plantuml -syntax < starter/componentes.puml
   ```

   Output:

   ```
   0
   DESCRIPTION
   (4 entities)
   ```

   Los diagramas de componentes y de despliegue son, para PlantUML, `DESCRIPTION`. Abre `starter/componentes.svg`: cuatro componentes y cuatro flechas.

2. **TODO 1 — Interfaces.** Declara las cuatro interfaces en la línea del TODO 1, antes de usarlas:

   ```plantuml
   interface StockQuery
   interface StockReservation
   interface ShipmentApi
   interface Notifier
   ```

   ```bash
   plantuml -tsvg starter/componentes.puml; plantuml -syntax < starter/componentes.puml
   ```

   Output:

   ```
   DESCRIPTION
   (8 entities)
   ```

   Cuatro círculos sueltos: todavía nadie las ofrece. Si declaras una interfaz debajo de la primera línea que la usa, PlantUML ya la ha creado por su cuenta y falla. Con `interface Notifier` movida justo encima de `@enduml` al terminar el TODO 2:

   ```
   Error line 25 in file: starter/componentes.puml
   Some diagram description contains errors
   ```

   `plantuml -syntax < starter/componentes.puml` da el motivo: `This element (Notifier) is already defined`. Sube la declaración.

3. **TODO 2 — Interfaces provistas.** Cada interfaz la implementa un componente. Con dos guiones, la interfaz queda debajo del componente:

   ```plantuml
   Inventory -- StockQuery
   Inventory -- StockReservation
   ```

   Escribe tú las otras dos: `ShipmentApi` la provee `Shipping` y `Notifier` la provee `Notifications`. Renderiza: cada círculo cuelga de su componente.

4. **TODO 3 — Interfaces requeridas.** Sustituye cada flecha por la interfaz que de verdad se usa. El `(` dibuja el semicírculo:

   ```plantuml
   Checkout --( StockQuery
   ```

   `Checkout --> Shipping` pasa a `Checkout --( ShipmentApi`. `Shipping --> Inventory` es una reserva, no una consulta: `Shipping --( StockReservation`. Y `Shipping --> Notifications` pasa a `Shipping --( Notifier`. Borra los comentarios de los TODO y renderiza: cada semicírculo abraza un círculo. Ningún componente toca a otro directamente.

5. Comprueba que cada interfaz requerida tiene quien la provea. `comm -23` imprime las requeridas que no están entre las provistas:

   ```bash
   f=starter/componentes.puml
   comm -23 <(grep -oE -- '--[(] [A-Za-z]+' $f | awk '{print $2}' | sort -u) <(grep -oE '^[A-Za-z]+ -- [A-Za-z]+$' $f | awk '{print $3}' | sort -u)
   ```

   Output:

   ```
   (sin salida)
   ```

   Si aparece un nombre, o te falta la provista o lo has escrito distinto en las dos líneas.

6. Comprueba:

   ```bash
   plantuml -checkonly starter/componentes.puml; echo $?
   plantuml -syntax < starter/componentes.puml
   grep -cE '^[A-Za-z]+ -- [A-Za-z]+$' starter/componentes.puml
   grep -cE -- '--[(] ' starter/componentes.puml
   grep -c -- '-->' starter/componentes.puml
   ```

   Output:

   ```
   0
   DESCRIPTION
   (8 entities)
   4
   4
   0
   ```

   4 componentes y 4 interfaces, 4 provistas, 4 requeridas y ninguna flecha directa.

7. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - ¿Qué ganas al separar `StockQuery` y `StockReservation` en lugar de tener una sola `InventoryApi`?
   - Si la tienda cambia `Notifications` por un servicio externo de correo, ¿qué componentes del diagrama tienes que tocar?
   - ¿Por qué `Checkout --> Shipping` decía menos que `Checkout --( ShipmentApi`?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` da `DESCRIPTION` y `(8 entities)`
- [ ] 4 interfaces declaradas antes de usarse, cada una provista por un componente
- [ ] 4 interfaces requeridas y ninguna flecha `-->` entre componentes
- [ ] `comm -23` no imprime nada
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

La tienda acepta devoluciones: `Returns` recibe el paquete, devuelve el stock al inventario y avisa al cliente. Añade el componente. ¿Necesita una interfaz nueva en `Inventory` o le vale una de las que ya hay?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 01 — Paquetes y dependencias](../lab-01-paquetes-y-dependencias/README.md) | [Lab 03 — Puertos y delegación](../lab-03-puertos-y-delegacion/README.md) → |

[↑ Semana 08](../../README.md)
