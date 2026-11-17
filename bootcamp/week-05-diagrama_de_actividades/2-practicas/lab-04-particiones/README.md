# Lab 04 — Particiones

⏱ Duración estimada: ~60 min

## Objetivo

Repartir las acciones de un pedido en línea en particiones, una por responsable, y paralelizar las que no dependen entre sí.

## Contexto

- Reglas de las particiones: [Concurrencia y particiones](../../1-teoria/02-concurrencia-y-particiones.md).
- En `starter/pedido.puml` casi todo cae en `Customer` y hay una partición `Database`. El flujo es correcto; los responsables, no.
- Los responsables: el cliente (`Customer`), la tienda (`Store`), la pasarela de pago (`Payment Gateway`), el almacén (`Warehouse`) y la empresa de mensajería (`Carrier`).

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-05-diagrama_de_actividades/2-practicas/lab-04-particiones
   ```

1. Renderiza el starter y cuenta las particiones:

   ```bash
   plantuml -tsvg starter/pedido.puml; echo $?
   grep -E '^[[:space:]]*[|][^|]+[|][[:space:]]*$' starter/pedido.puml | sed -E 's/[[:space:]]//g' | sort -u | wc -l
   ```

   Output:

   ```
   0
   2
   ```

   Abre `starter/pedido.svg`: dos calles, `Customer` con casi todo y `Database` con `Save order`.

2. **Responsables.** Crea `responsables.md` con una tabla `| Acción | Partición | Por qué |` y una fila por acción. Regla: la acción va en la partición de **quien la hace**, no de quien la pide. Ejemplo: `Authorize payment` la hace `Payment Gateway`, aunque el cliente la provoca.

3. **TODO 3 — Database.** Borra `|Database|`, `:Save order;` y el `|Customer|` que le sigue. Guardar el pedido es un detalle de cómo lo implementa la tienda, no un paso del proceso de negocio, y una base de datos no es responsable de nada.

4. **TODO 1 — Orden de las calles.** PlantUML dibuja las particiones en el orden en que aparecen por primera vez. Para fijarlo, sustituye el `|Customer|` que hay antes de `start` por las cinco declaraciones seguidas y vuelve a `Customer` al final:

   ```plantuml
   |Customer|
   |Store|
   |Payment Gateway|
   |Warehouse|
   |Carrier|
   |Customer|
   start
   ```

   Renderiza: cinco calles; todo sigue en `Customer`.

5. **TODO 2 — Mover acciones.** Antes de cada acción que cambia de responsable, escribe la partición. Las dos primeras:

   ```plantuml
   :Place order;
   |Payment Gateway|
   :Authorize payment;
   ```

   Sigue con tu tabla del paso 2. Dentro de la rama `[no]`, `|Store|` va antes de `:Notify payment failure;`. Renderiza después de cada cambio y comprueba en el SVG que la flecha cruza a la calle correcta.

6. **TODO 4 — Paralelo entre calles.** Preparar el pedido y emitir la factura no dependen uno del otro. Después de `:Confirm order;`:

   ```plantuml
   fork
     |Warehouse|
     :Pick items;
     :Pack order;
   fork again
     |Store|
     :Issue invoice;
   end fork
   |Carrier|
   ```

   Cada rama puede cambiar de partición. Renderiza: el fork en `Store` y una rama en `Warehouse`. Borra los comentarios de los TODO.

7. Comprueba:

   ```bash
   plantuml -checkonly starter/pedido.puml; echo $?
   grep -E '^[[:space:]]*[|][^|]+[|][[:space:]]*$' starter/pedido.puml | sed -E 's/[[:space:]]//g' | sort -u | wc -l
   grep -c Database starter/pedido.puml
   ```

   Output:

   ```
   0
   5
   0
   ```

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0`
- [ ] 5 particiones en el orden `Customer`, `Store`, `Payment Gateway`, `Warehouse`, `Carrier`, y ninguna `Database`
- [ ] Cada acción en la partición de quien la hace, igual que en `responsables.md`
- [ ] Un fork con una rama en `Warehouse` y otra en `Store`

## Reto extra

El cliente puede no estar en casa. Añade en `Carrier` una decisión `Customer at home?`: si no, el paquete vuelve al almacén y se intenta otra vez al día siguiente. ¿En qué partición está la acción de reprogramar?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 03 — Fork y join](../lab-03-fork-y-join/README.md) | [Lab 05 — Objetos y señales](../lab-05-objetos-y-senales/README.md) → |

[↑ Semana 05](../../README.md)
