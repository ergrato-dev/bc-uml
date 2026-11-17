# Lab 03 — Puertos y delegación

⏱ Duración estimada: ~60 min

## Objetivo

Encerrar las piezas de la taquilla de un cine en un componente compuesto que ofrece una sola interfaz por un puerto y delega la petición en una de sus partes.

## Contexto

- Sintaxis y reglas: [Componentes e interfaces](../../1-teoria/02-componentes-e-interfaces.md), apartado "Componente compuesto, puertos y delegación".
- `starter/taquilla.puml` renderiza, pero el quiosco conoce las tres piezas internas de la taquilla y usa una interfaz de cada una.
- Especificación: el quiosco vende entradas. Para él, vender es una sola operación. Dentro de la taquilla, el plano de butacas atiende la venta, pide el precio al tarificador y la impresión a la impresora de entradas. Mañana la taquilla puede repartir ese trabajo de otra forma sin que el quiosco cambie.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-08-componentes_paquetes_y_despliegue/2-practicas/lab-03-puertos-y-delegacion
   ```

1. Renderiza el starter y cuenta las interfaces que requiere el quiosco:

   ```bash
   plantuml -tsvg starter/taquilla.puml; echo $?
   plantuml -syntax < starter/taquilla.puml
   grep -c '^Kiosk ' starter/taquilla.puml
   ```

   Output:

   ```
   0
   DESCRIPTION
   (7 entities)
   3
   ```

   Abre `starter/taquilla.svg`: el quiosco tira de tres interfaces. Si la taquilla cambia una pieza, el quiosco se entera.

2. **TODO 1 — Componente compuesto.** Mete las tres piezas en `BoxOffice`, junto con las dos interfaces que solo se usan dentro y sus líneas. Añade lo que pide la especificación: `SeatMap` requiere precio e impresión.

   ```plantuml
   component BoxOffice {
     component SeatMap
     component Pricing
     component TicketPrinter
     interface PriceQuote
     interface Printing
     Pricing -- PriceQuote
     TicketPrinter -- Printing
     SeatMap --( PriceQuote
     SeatMap --( Printing
   }
   ```

   Deja fuera `interface SeatSelection` y `SeatMap -- SeatSelection` por ahora. Renderiza:

   ```bash
   plantuml -tsvg starter/taquilla.puml; plantuml -syntax < starter/taquilla.puml
   ```

   Output:

   ```
   DESCRIPTION
   (7 entities)
   ```

   Las mismas 7 entidades: `BoxOffice` es un contenedor y PlantUML no lo cuenta. En el SVG, las líneas del quiosco cruzan el borde de `BoxOffice` para llegar a las piezas de dentro. Eso es lo que vas a quitar.

3. **TODO 2 — Puerto y delegación.** Declara la interfaz de la taquilla en la línea del TODO 2:

   ```plantuml
   interface TicketSales
   ```

   Dale a `BoxOffice` un puerto de entrada que delega en `SeatMap`: el `portin` va como primera línea dentro de las llaves y la delegación, como última.

   ```plantuml
   component BoxOffice {
     portin "sales" as salesPort
     ...
     salesPort --> SeatMap : <<delegate>>
   }
   ```

   Y fuera de las llaves, la interfaz provista por el puerto:

   ```plantuml
   TicketSales - salesPort
   ```

   Renderiza: un cuadrado pequeño en el borde de `BoxOffice`, el puerto, con `TicketSales` colgando por fuera y una flecha `«delegate»` hacia `SeatMap`.

4. **TODO 3 — El quiosco solo conoce la taquilla.** Sustituye las tres líneas de `Kiosk` por una:

   ```plantuml
   Kiosk --( TicketSales
   ```

   Borra `interface SeatSelection` y `SeatMap -- SeatSelection`: la selección de butaca ya no sale de la taquilla, entra por el puerto. Borra los comentarios de los TODO y renderiza: del quiosco sale una sola línea, que no cruza el borde.

5. Comprueba:

   ```bash
   plantuml -checkonly starter/taquilla.puml; echo $?
   plantuml -syntax < starter/taquilla.puml
   grep -c '^Kiosk ' starter/taquilla.puml
   grep -cE -- '--[(] ' starter/taquilla.puml
   grep -c '<<delegate>>' starter/taquilla.puml
   grep -c SeatSelection starter/taquilla.puml
   ```

   Output:

   ```
   0
   DESCRIPTION
   (8 entities)
   1
   3
   1
   0
   ```

   El quiosco requiere 1 interfaz en lugar de 3. Quedan 3 requeridas: las 2 de `SeatMap` por dentro y la del quiosco. El puerto cuenta como entidad: 8.

6. Crea `preguntas.md` y responde en 1 o 2 líneas cada una:
   - Si `Pricing` pasa a ser un servicio externo, ¿qué cambia en el diagrama? ¿Y en el quiosco?
   - ¿Por qué `PriceQuote` y `Printing` se declaran dentro de `BoxOffice` y `TicketSales` fuera?
   - ¿Qué diferencia hay entre la flecha `«delegate»` y una interfaz requerida?

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0` y `-syntax` da `(8 entities)`
- [ ] `BoxOffice` contiene las tres piezas y las dos interfaces internas
- [ ] Un puerto que provee `TicketSales` y delega en `SeatMap`
- [ ] `Kiosk` requiere solo `TicketSales`
- [ ] `preguntas.md` responde las 3 preguntas

## Reto extra

El cine abre la venta por internet. La web también vende entradas, pero el pago lo hace un proveedor externo y la entrada se envía por correo, no se imprime. Añade el componente `WebShop`. ¿Puede usar `TicketSales` tal cual? ¿Qué le falta a `BoxOffice`: otro puerto, otra interfaz o las dos cosas?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 02 — Componentes e interfaces](../lab-02-componentes-e-interfaces/README.md) | [Lab 04 — Nodos y artefactos](../lab-04-nodos-y-artefactos/README.md) → |

[↑ Semana 08](../../README.md)
