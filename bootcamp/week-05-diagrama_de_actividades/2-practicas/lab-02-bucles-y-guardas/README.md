# Lab 02 — Bucles y guardas

⏱ Duración estimada: ~60 min

## Objetivo

Modelar el cobro en la caja de una tienda con un bucle, una decisión de varias salidas y guardas excluyentes y exhaustivas.

## Contexto

- Bucles, guardas y finales: [Acciones, decisiones y finales](../../1-teoria/01-acciones-y-decisiones.md).
- `switch` es la forma de PlantUML para una decisión con más de dos salidas: un solo rombo, una guarda por `case`.
- `starter/caja.puml` renderiza con dos acciones y los TODO.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-05-diagrama_de_actividades/2-practicas/lab-02-bucles-y-guardas
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/caja.puml; echo $?
   ```

   Output: `0`. Abre `starter/caja.svg`: `Scan item` y `Show total` en fila, sin final.

2. **TODO 1 — Bucle.** El cajero escanea al menos un artículo y repite mientras queden. Envuelve `:Scan item;`:

   ```plantuml
   repeat
     :Scan item;
   repeat while (More items?) is ([yes]) not ([no])
   ```

   Renderiza. En el SVG, la flecha `[yes]` vuelve a un rombo de fusión antes de `Scan item`: UML dibuja el bucle con decisión y fusión.

3. **TODO 2 — Decisión de tres salidas.** Después de `:Show total;`:

   ```plantuml
   switch (Payment method?)
   case ([card])
     :Charge card;
   case ([cash])
     :Collect cash;
     :Give change;
   case ([voucher])
     :Redeem voucher;
   endswitch
   ```

   Renderiza: un solo rombo con tres salidas y una fusión que las junta.

4. **TODO 3 — Rechazo de la tarjeta.** Dentro de `case ([card])`, debajo de `:Charge card;`:

   ```plantuml
   if (Charge approved?) then ([no])
     :Cancel sale;
     stop
   else ([yes])
   endif
   ```

   La venta cancelada termina la actividad entera: `stop` dentro de la rama. En el SVG, `Cancel sale` acaba en su propio final.

5. **TODO 4 — Cierre.** Antes de `@enduml`: `:Print receipt;` y `stop`. Borra los comentarios de los TODO.

6. Comprueba:

   ```bash
   plantuml -checkonly starter/caja.puml; echo $?
   grep -cE '^[[:space:]]*repeat[[:space:]]*$' starter/caja.puml
   grep -cE '^[[:space:]]*case[[:space:]]*[(][[]' starter/caja.puml
   grep -oE '[(][[][^]]+[]][)]' starter/caja.puml | wc -l
   grep -cE '^[[:space:]]*stop[[:space:]]*$' starter/caja.puml
   ```

   Output:

   ```
   0
   1
   3
   7
   2
   ```

   1 bucle, 3 casos, 7 guardas entre corchetes y 2 finales.

7. **Guardas.** Crea `guardas.md`. Para cada conjunto de guardas, di si es **excluyente** (nunca dos verdaderas a la vez) y **exhaustivo** (siempre una verdadera), y corrígelo si no lo es:

   | Decisión | Guardas |
   |---|---|
   | Descuento por importe | `[total > 100]`, `[total > 50]` |
   | Venta de alcohol | `[age < 18]`, `[age > 18]` |
   | Medio de pago | `[card]`, `[cash]`, `[voucher]` |
   | Envío gratis | `[total >= 30]`, `[total < 30]`, `[member]` |

   Pista: prueba cada conjunto con un valor concreto (`total = 120`, `age = 18`, un socio con `total = 40`).

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0`
- [ ] 1 `repeat`, 3 `case` y 7 guardas entre corchetes
- [ ] 2 `stop`: la venta cancelada y el ticket impreso
- [ ] `guardas.md` analiza los 4 conjuntos y corrige los que fallan

## Reto extra

El banco puede rechazar la tarjeta por un error de red. Permite reintentar el cargo hasta que se aprueba o el cliente decide pagar de otra forma. ¿Te sirve `repeat`, `while` o una decisión que vuelve atrás? Escribe tu versión en `starter/caja-reto.puml`.

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 01 — Acciones y decisiones](../lab-01-acciones-y-decisiones/README.md) | [Lab 03 — Fork y join](../lab-03-fork-y-join/README.md) → |

[↑ Semana 05](../../README.md)
