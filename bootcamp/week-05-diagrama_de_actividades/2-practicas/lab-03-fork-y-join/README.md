# Lab 03 — Fork y join

⏱ Duración estimada: ~60 min

## Objetivo

Convertir una preparación de estreno en secuencia en un flujo con ramas paralelas, un join y un final de flujo.

## Contexto

- Fork, join y la diferencia con la decisión: [Concurrencia y particiones](../../1-teoria/02-concurrencia-y-particiones.md).
- `starter/estreno.puml` tiene las siete acciones en fila. Es correcto pero falso: obliga a imprimir los carteles después de abrir la venta, y nada lo exige.
- La regla para meter dos acciones en la misma rama: una necesita el resultado de la otra.

## Paso a paso

0. Abre el contenedor desde la raíz del repositorio y entra en la carpeta del lab:

   ```bash
   docker compose run --rm uml bash
   cd bootcamp/week-05-diagrama_de_actividades/2-practicas/lab-03-fork-y-join
   ```

1. Renderiza el starter:

   ```bash
   plantuml -tsvg starter/estreno.puml; echo $?
   ```

   Output: `0`. Abre `starter/estreno.svg`: siete acciones en una columna.

2. **Dependencias.** Antes de tocar el diagrama, crea `dependencias.md` con una línea por acción entre `Confirm premiere date` y `Open doors`: qué necesita que haya pasado antes. Ejemplo: `Test projection` necesita `Receive film copy`. Las que solo necesitan la fecha confirmada pueden ir en paralelo.

3. **TODO 1 y TODO 2 — Fork.** Borra los comentarios de los TODO. Debajo de `:Confirm premiere date;`, envuelve las tareas independientes:

   ```plantuml
   fork
     :Open ticket sales;
   fork again
     :Print posters;
   fork again
     :Receive film copy;
     :Test projection;
   fork again
     :Post on social media;
   end fork
   ```

   `Receive film copy` y `Test projection` van en la misma rama porque una necesita la otra.

4. **TODO 4 — Join, con un error a propósito.** Cambia `end fork` por `endif` y renderiza:

   ```bash
   plantuml -tsvg starter/estreno.puml; echo $?
   ```

   Output:

   ```
   Error line 15 in file: starter/estreno.puml
   Some diagram description contains errors
   200
   ```

   La línea 15 cierra el fork con la pareja de una decisión. Vuelve a escribir `end fork` y renderiza: `0`. En el SVG, dos barras: el fork arriba y el join abajo.

5. **TODO 3 — Final de flujo.** Abrir puertas no espera a la publicación en redes. Debajo de `:Post on social media;`, dentro de su rama, añade `end`. Renderiza: esa rama termina en un círculo con aspa y no llega al join.

6. Comprueba:

   ```bash
   plantuml -checkonly starter/estreno.puml; echo $?
   grep -cE '^[[:space:]]*fork again[[:space:]]*$' starter/estreno.puml
   grep -cE '^[[:space:]]*end fork[[:space:]]*$' starter/estreno.puml
   grep -cE '^[[:space:]]*end[[:space:]]*$' starter/estreno.puml
   ```

   Output:

   ```
   0
   3
   1
   1
   ```

   4 ramas (3 `fork again`), 1 join y 1 final de flujo.

7. **Decisión o fork.** Crea `decision-o-fork.md` y clasifica cada situación como decisión o fork, con una línea de porqué:
   1. El cliente compra entradas en taquilla o en la web.
   2. Al vender una entrada, el sistema descuenta la butaca y envía el ticket por correo.
   3. Si la función tiene menos de 10 entradas vendidas, se cancela.
   4. Antes de la función, se limpia la sala y se revisa el sonido.
   5. El proyector usa la copia digital o, si falla, la de respaldo.
   6. Al terminar la función, se abre la salida y se enciende la luz de la sala.

## Criterios de éxito

- [ ] `plantuml -checkonly` sale con `0`
- [ ] 4 ramas, con `Receive film copy` y `Test projection` en la misma
- [ ] 1 `end fork` y 1 `end` en la rama de redes
- [ ] `dependencias.md` y `decision-o-fork.md` completos

## Reto extra

Cambia el `end` de la rama de redes por `stop` y renderiza. El dibujo casi no cambia. Escribe en `decision-o-fork.md` qué cambia en la ejecución: ¿qué pasa con la venta de entradas si la publicación termina antes?

<!-- nav -->
---

## 🔗 Navegación

| Anterior | Siguiente |
|---|---|
| ← [Lab 02 — Bucles y guardas](../lab-02-bucles-y-guardas/README.md) | [Lab 04 — Particiones](../lab-04-particiones/README.md) → |

[↑ Semana 05](../../README.md)
